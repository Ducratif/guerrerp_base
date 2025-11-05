--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Shared initialization module
-- Core initialization utilities and helper functions

-- No-operation function (placeholder)
local function noop(...)
  -- Empty function for placeholder purposes
end

-- Export noop function globally
noop = noop
-- Ox_lib integration system
local libTable = {}
local libMetatable = {}

-- Metatable index function for dynamic ox_lib loading
function libMetatable.__index(table, functionName)
  -- Reset lib global to nil
  lib = nil
  
  -- Load ox_lib init.lua file
  local oxLibContent = LoadResourceFile("ox_lib", "init.lua")
  
  -- Load and execute ox_lib initialization
  local oxLibLoader = load(oxLibContent, "@@ox_lib/init.lua", "t")
  oxLibLoader()
  
  -- Return the requested function from lib
  return lib[functionName]
end

-- Create lib proxy with metatable
lib = setmetatable(libTable, libMetatable)
-- Export provider function for registering CFX exports
local function exportProvider(resourceName, exportName, exportFunction)
  local eventName = string.format("__cfx_export_%s_%s", resourceName, exportName)
  AddEventHandler(eventName, exportFunction)
end

-- Export ExportProvider globally
ExportProvider = exportProvider
-- Check if resource export exists
local function hasExports(resourceName, exportName)
  return xpcall(function()
    return exports[resourceName][exportName] ~= nil
  end, function()
    return false
  end)
end

-- Export HasExports globally
HasExports = hasExports
-- Check if development mode is enabled
local devModeMetadata = GetResourceMetadata(Luxu.resourceName, "luxu_dev", 0)
local isDevelopmentMode = devModeMetadata == "true"

-- Export IsDev globally
IsDev = isDevelopmentMode
-- Load main configuration file
local mainConfig = LoadJson("config.config")

-- Export Config globally
Config = mainConfig
-- Load localization file based on config
local localeFileName = "locales." .. Config.locales.lang
local localeData = LoadJson(localeFileName)

-- Export Locales globally
Locales = localeData
-- Load framework bridge module
local frameworkBridge = require("bridge.framework")

-- Export Framework globally
Framework = frameworkBridge
-- Export framework objects for different frameworks
local frameworkObject = Framework.object

-- Export framework objects globally
QBCore = frameworkObject
ESX = frameworkObject
Ox = frameworkObject
Custom = frameworkObject
-- Resource stop event handler
local function onResourceStop(callback)
  AddEventHandler("onResourceStop", function(resourceName)
    local currentResource = GetCurrentResourceName()
    if resourceName == currentResource then
      callback()
    end
  end)
end

-- Export onResourceStop globally
onResourceStop = onResourceStop

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
