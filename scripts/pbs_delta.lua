#!/usr/bin/env lua

--[[
  All machines should be passwordless-ly ssh-able from wherever this script is running.
]]--


machines = {
  {
    hostname = "mnemosyne",
    ip = "192.168.0.26",
    mac = "fc:3f:db:0d:d0:16",
    boot_type = "wol",
    shutdown_type = "shutdown",
    depends_on = nil,
    jobs = {
      verify = "v-fa3124c3-cd46",
      prune = "s-59b5d519-ce09",
      gc = "primary",
      sync = "s-c54aa391-2be4",
    },
  },
  {
    hostname = "clio",
    ip = "192.168.0.30",
    mac = nil,
    boot_type = "virsh",
    shutdown_type = "virsh",
    depends_on = 2,
    jobs = {
      verify = "v-e5afe385-67b6",
      prune = "s-26d72a40-3a40",
      gc = "primary",
      sync = nil,
    },
  },
  {
    hostname = "poseidon",
    ip = "192.168.0.8",
    mac = "3c:52:82:6c:1e:bc",
    boot_type = "wol",
    shutdown_type = "shutdown",
    depends_on = nil,
    jobs = {
      nil,
    },
  },
}


-- runs an OS command and returns the output
function runcommand(command)
  -- prints our command
  print(string.format("PBS Delta: `%s`", command))
  
  -- run command and store result
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()

  -- return and trim final newline
  return result:sub(1, -2)
end

-- checks if a machine is reachable and turns it on if not
function upcheck(id)
  -- checks if we can login with ssh
  -- more reliable than ping
  response = runcommand(string.format("ssh root@%s exit 2>&1", machines[id].ip))
  if response:find("No route to host") or response:find("Permission denied") then
    return false
  else
    return true
  end
end
