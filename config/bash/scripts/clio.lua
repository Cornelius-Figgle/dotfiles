#!/usr/bin/env lua

--[[
  A small lua script that runs on a Debian CT on a virtualisation host to allow
  backups to PBS from non-Debian hosts. It copys data from other hosts to
  itself and then archives it to the PBS instance since the PBS client can only
  be installed on Debian- and Fedora/RHEL-based systems. Automation can be
  acheived via Cron or similar programs.

  CT requires: lua5.4,proxmox-backup-client,rsync,wakeonlan
  Hosts requires: rsync

  It also requires a virtual disk to be mounted to /data (backup should be
  skipped on this) and for publickey ssh to be enabled and set up on each host.
  It is recommended to run this by hand a few times before automating it as it
  will sometimes require user input the first times commands are run (ie. the
  PBS password etc).
]]


-- define script settings, keys should be self-explanatory
config = {
  name = ("clio"):upper(),
  dryrun = false,

  pbs = {
    host = "mnemosyne",
    ip = "192.168.0.26",
    mac = "fc:3f:db:0d:d0:16",
    shutdown_cmd = "systemctl poweroff",
    repo = "primary",
    ns = "host",
  },
  
  pve = {
    host = "zeus",  -- this is to skip checking the PVE host
  },

  hosts = {--[[
    poseidon = {
      ip = "192.168.0.8",
      mac = "3c:52:82:6c:1e:bc",
      paths = {
        "/home/",
        "/root/",
        "/etc/",
        "/var/",
        "/vm/",
      },
      remove_dir = true,
    },--]]
    zeus = {
      ip = "192.168.0.19",
      mac = "ec:8e:b5:79:2b:eb",
      paths = {
        "/etc/pve/",
        "/etc/fstab",
        "/etc/apt/sources.list",
        "/etc/apt/sources.list.d/",
        "/root/",
        "/var/lib/vz/",
      },
      remove_dir = false,
    },
    mnemosyne = {
      ip = "192.168.0.26",
      mac = "fc:3f:db:0d:d0:16",
      paths = {
        "/etc/proxmox-backup/",
        "/etc/fstab",
        "/etc/apt/sources.list",
        "/etc/apt/sources.list.d/",
        "/root/",
      },
      remove_dir = false,
    },
  },
}


-- runs an OS command and returns the output
function runcommand(command)
  -- prints our command
  print(string.format("%s: `%s`", config.name, command))
  
  -- skip actual execution for dry runs
  if config.dryrun then
    return ""
  end
    
  -- run command and store result
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()

  -- return and trim final newline
  return result:sub(1, -2)
end


-- if required, powers on the host, and rsyncs data to this CT
for host in pairs(config.hosts) do  
  -- checks if a ssh command is unsuccessful (ie if the host is down)
  -- we ignore the PVE host to save time, since it must be up if this CT is
  if host ~= config.pve.host and runcommand(string.format("ssh root@%s exit 2>&1", config.hosts[host].ip)):find("No route to host") then
    -- power on the host via WOL
    config.hosts[host].req_shutdown = true
    print(string.format("%s: %s is unreachable, sending WOL packet", config.name, host))
    runcommand(string.format("wakeonlan %s", config.hosts[host].mac))

    -- wait until host is reachable
    while runcommand(string.format("ssh root@%s exit 2>&1", config.hosts[host].ip)):find("No route to host") do
      print(string.format("%s: waiting for %s to become reachable", config.name, host))
      runcommand("sleep 5")
    end
  end

  print(string.format("%s: %s is reachable, preceeding with data copy", config.name, host))

  -- rsync the data to this CT
  for _, path in pairs(config.hosts[host].paths) do
    print(string.format("%s: copying %s from %s to local storage", config.name, path, host))
    local command = string.format([[rsync -av --mkpath ]] .. "root@%s:%s /data/%s%s", config.hosts[host].ip, path, host, path)
    runcommand(command)
  end

  -- if required, shutdown the host once complete
  -- we skip the PBS host since we need that next
  if host ~= config.pbs.host and config.hosts[host].req_shutdown then
    print(string.format("%s: shutting down %s", config.name, host))
    
    -- shutdown the host
    if config.hosts[host].shutdown_cmd then
      runcommand(string.format("ssh root@%s %s", config.hosts[host].ip, config.hosts[host].shutdown_cmd))
    else
      runcommand(string.format("ssh root@%s shutdown -h now", config.hosts[host].ip))
    end
  end
end

-- check if PBS host is up
if runcommand(string.format("ssh root@%s exit 2>&1", config.pbs.ip)):find("No route to host") then
  -- power on the host via WOL
  config.pbs.req_shutdown = true
  print(string.format("%s: %s is unreachable, sending WOL packet", config.name, config.pbs.host))
  runcommand(string.format("wakeonlan %s", config.pbs.mac))

  -- wait until host is reachable
  while runcommand(string.format("ssh root@%s exit 2>&1", config.pbs.ip)):find("No route to host") do
    print(string.format("%s: waiting for %s to become reachable", config.name, config.pbs.host))
    runcommand("sleep 5")
  end
end

-- creates a string of the different archives (one per host)
local command = ""
for host in pairs(config.hosts) do
  print(string.format("%s: Archiving /data/%s to PBS as %s.pxar", config.name, config.hosts[host], config.hosts[host]))
  command = command .. string.format("%s.pxar:/data/%s ", host, host)
end

-- archives this data to the PBS host
command = "proxmox-backup-client backup " .. command .. [[--ns ]] .. config.pbs.ns .. [[ --repository ]] .. config.pbs.ip .. ":" .. config.pbs.repo
runcommand(command)

-- removes local data
for host in pairs(config.hosts) do
  -- disable to allow rsync's incremental backup to do it's thing and reduce the backup time, at the cost of CT disk space
  if config.hosts[host].remove_dir then
    print(string.format("%s: removing /data/%s from local storage", config.name, host))
    local command = string.format("rm -r /data/%s", host)
    runcommand(command)
  else
    print(string.format("%s: preserving /data/%s", config.name, host))
  end
end

-- if required, shutdown the PBS host once complete
if config.pbs.req_shutdown or config.hosts[config.pbs.host].req_shutdown then
  print(string.format("%s: shutting down %s", config.name, config.pbs.host))
  
  -- shutdown the host
  if config.pbs.shutdown_cmd then
    runcommand(string.format("ssh root@%s %s", config.pbs.ip, config.pbs.shutdown_cmd))
  else
    runcommand(string.format("ssh root@%s shutdown -h now", config.pbs.ip))
  end
end
