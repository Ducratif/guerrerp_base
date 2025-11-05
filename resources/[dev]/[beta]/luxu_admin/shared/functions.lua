--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Shared functions module
-- Core Luxu framework initialization and utilities

-- Initialize Luxu framework object
local luxuFramework = {}
luxuFramework.resourceName = GetCurrentResourceName()

-- Determine execution context (server or client)
local executionContext
if IsDuplicityVersion() then
  executionContext = "server"
else
  executionContext = "client"
end
luxuFramework.context = executionContext

-- Export Luxu framework globally
Luxu = luxuFramework
-- Printing utilities with different log levels
local printUtilities = {}

-- Info level logging
function printUtilities.info(...)
  print(string.format("[LUXU] [INFO] %s", ...))
end

-- Warning level logging with yellow color
function printUtilities.warning(...)
  print(string.format("^3[LUXU] [WARNING] %s", ...))
end

-- Error level logging with red color
function printUtilities.error(...)
  print(string.format("^1[LUXU] [ERROR] %s", ...))
end

-- JSON pretty printing utility
function printUtilities.json(data)
  print(json.encode(data, { indent = true }))
end

-- Attach print utilities to Luxu framework
Luxu.print = printUtilities
-- Parse resource path helper function
local function parseResourcePath(filePath)
  -- Check if path starts with @resource_name format
  local resourceMatch = filePath:match("@[^%.]+")
  if resourceMatch then
    -- Extract resource name (remove @)
    local resourceName = resourceMatch:gsub("@", "")
    -- Extract file path (after resource name)
    local pathPart = filePath:sub(#resourceMatch + 2)
    -- Convert dots to slashes for file path
    local normalizedPath = pathPart:gsub("%.", "/")
    return resourceName, normalizedPath
  end
  
  -- Default to current resource if no @ prefix
  local normalizedPath = filePath:gsub("%.", "/")
  return Luxu.resourceName, normalizedPath
end
-- JSON file loading function
local function loadJsonFile(filePath)
  -- Validate input parameter
  if type(filePath) ~= "string" then
    error(("file path must be a string (received '%s')"):format(filePath), 2)
  end
  
  -- Parse resource and file path
  local resourceName, normalizedPath = parseResourcePath(filePath)
  
  -- Load JSON file from resource
  local fileContent = LoadResourceFile(resourceName, string.format("%s.json", normalizedPath))
  
  if fileContent then
    return json.decode(fileContent)
  end
  
  -- Throw error if file not found
  error(string.format([[
json file '%s' not found
	no file '@%s/%s.json']], filePath, resourceName, normalizedPath))
end

-- Export LoadJson function globally
LoadJson = loadJsonFile
-- Custom require function for loading Lua modules
local function customRequire(modulePath, environment)
  -- Validate environment parameter if provided
  if environment ~= nil then
    assert(type(environment) == "table", "env must be a table")
  end
  
  -- Validate module path parameter
  if type(modulePath) ~= "string" then
    error(("path must be a string (received '%s')"):format(modulePath), 2)
  end
  
  -- Parse resource and module path
  local resourceName, normalizedPath = parseResourcePath(modulePath)
  
  -- Try different file extensions in order
  local fileExtensions = { ".lua", "/init.lua", "" }
  
  for _, extension in ipairs(fileExtensions) do
    local fullPath = normalizedPath .. extension
    local fileContent = LoadResourceFile(resourceName, fullPath)
    
    if fileContent then
      -- Load and compile the module
      local loadedFunction = assert(load(
        fileContent,
        string.format("@@%s/%s%s", resourceName, normalizedPath, extension),
        "t",
        environment or _ENV
      ))
      
      -- Execute if it's a function, otherwise return as-is
      if type(loadedFunction) == "function" then
        return loadedFunction()
      end
      return loadedFunction
    end
  end
  
  -- Throw error if module not found
  error(("module '%s' not found"):format(modulePath), 2)
end

-- Attach custom require to Luxu framework and override global require
Luxu.require = customRequire
require = customRequire
-- Duplicate LoadJson function (keeping for compatibility)
local function loadJsonFileDuplicate(filePath)
  -- Validate input parameter
  if type(filePath) ~= "string" then
    error(("file path must be a string (received '%s')"):format(filePath), 2)
  end
  
  -- Parse resource and file path
  local resourceName, normalizedPath = parseResourcePath(filePath)
  
  -- Load JSON file from resource
  local fileContent = LoadResourceFile(resourceName, string.format("%s.json", normalizedPath))
  
  if fileContent then
    return json.decode(fileContent)
  end
  
  -- Throw error if file not found
  error(string.format([[
json file '%s' not found
	no file '@%s/%s.json']], filePath, resourceName, normalizedPath))
end

-- Override LoadJson with duplicate function
LoadJson = loadJsonFileDuplicate
-- Interval management system
local activeIntervals = {}

-- Set interval function with callback execution
function Luxu.setInterval(callback, interval, onComplete)
  local intervalId = 0
  local waitTime = interval or 0
  
  Citizen.CreateThreadNow(function(threadId)
    intervalId = threadId
    activeIntervals[intervalId] = true
    
    while activeIntervals[intervalId] do
      Wait(waitTime)
      if activeIntervals[intervalId] then
        callback()
      end
    end
    
    activeIntervals[intervalId] = nil
    if onComplete then
      onComplete()
    end
  end)
  
  return intervalId
end
-- Synchronous interval function with timeout-based recursion
function Luxu.setIntervalSync(callback, interval)
  local waitTime = interval or 0
  
  Citizen.CreateThreadNow(function()
    local function executeCallback()
      pcall(callback)
      SetTimeout(waitTime, executeCallback)
    end
    executeCallback()
  end)
end
-- Timed interval function that auto-clears after specified duration
local function setTimedInterval(callback, interval, duration)
  local intervalId = Luxu.setInterval(callback, interval)
  
  CreateThread(function()
    Wait(duration)
    Luxu.clearInterval(intervalId)
  end)
  
  return intervalId
end

-- Export SetTimedInterval globally
SetTimedInterval = setTimedInterval
-- Clear interval function
function Luxu.clearInterval(intervalId)
  if not intervalId then
    return
  end
  activeIntervals[intervalId] = nil
end
-- Initialize table and array utilities
Luxu.table = {}
Luxu.array = {}
-- Array includes function to check if value exists in array
function Luxu.array.includes(array, value)
  for i = 1, #array do
    if array[i] == value then
      return true
    end
  end
  return false
end
-- Map data structure implementation with metatable
local mapPrototype = {
  values = {}
}

local mapMetatable = {}

-- Length metamethod for map
function mapMetatable.__len(mapInstance)
  local count = 0
  for _ in pairs(mapInstance.values) do
    count = count + 1
  end
  return count
end

-- Index metamethod for map access
function mapMetatable.__index(mapInstance, key)
  if mapInstance.values[key] then
    return mapInstance.values[key]
  end
  return nil
end

-- Newindex metamethod for map assignment
function mapMetatable.__newindex(mapInstance, key, value)
  mapInstance.values[key] = value
end

-- Create map with metatable
Luxu.map = setmetatable(mapPrototype, mapMetatable)
-- Map constructor function with full Map API
function Luxu.map.new(mapInstance, initialValues)
  local newMap = {
    _data = {}
  }
  
  -- Set method to add key-value pairs
  function newMap.set(key, value)
    mapInstance._data[key] = value
  end
  
  -- Has method to check if key exists
  function newMap.has(key)
    return mapInstance._data[key] ~= nil
  end
  
  -- Get method to retrieve value by key
  function newMap.get(key)
    return mapInstance._data[key]
  end
  
  -- Delete method to remove key-value pair
  function newMap.delete(key)
    mapInstance._data[key] = nil
  end
  
  -- Clear method to remove all entries
  function newMap.clear()
    mapInstance._data = {}
  end
  
  -- Keys method to get array of all keys
  function newMap.keys()
    local keyArray = {}
    for key in pairs(mapInstance._data) do
      keyArray[#keyArray + 1] = key
    end
    return keyArray
  end
  
  -- Values method to get array of all values
  function newMap.values()
    local valueArray = {}
    for _, value in pairs(mapInstance._data) do
      valueArray[#valueArray + 1] = value
    end
    return valueArray
  end
  
  -- ForEach method to iterate over entries
  function newMap.forEach(callback)
    for key, value in pairs(mapInstance._data) do
      callback(key, value)
    end
  end
  
  -- Metatable for map instance
  local instanceMetatable = {
    __index = mapInstance,
    __newindex = function(instance, key, value)
      instance.values[key] = value
    end
  }
  
  local finalMap = setmetatable(newMap, instanceMetatable)
  finalMap.values = initialValues or {}
  
  return finalMap
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
