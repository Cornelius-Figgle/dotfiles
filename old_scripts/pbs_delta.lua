#!/usr/bin/env lua

--[[
  All machines should be passwordless-ly ssh-able from wherever this script is running.
]]--

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
