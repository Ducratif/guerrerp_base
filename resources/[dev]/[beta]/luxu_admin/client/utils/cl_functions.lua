--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Client utility functions for Luxu Admin
-- Provides core functionality for NUI communication, caching, keybinds, and various utilities

-- Native function references
local IsPauseMenuActive = IsPauseMenuActive
local GetControlInstructionalButton = GetControlInstructionalButton

-- NUI communication function
local function fetchNui(action, data)
  SendNuiMessage(json.encode({
    action = action,
    data = data
  }))
end

-- Export NUI function
FetchNui = fetchNui
-- Initialize Luxu cache system
Luxu.cache = {
  resource = GetCurrentResourceName(),
  playerId = PlayerId(),
  serverId = GetPlayerServerId(PlayerId()),
  ped = PlayerPedId(),
  vehicle = false,
  coords = vector4(0, 0, 0, 0)
}
-- Initialize bridge modules
Luxu.inventory = Luxu.require("bridge.client.inventory")
Luxu.fuel = require("bridge.client.fuel")
Luxu.player = require("bridge.client.player")
-- Key mapping table for control labels
local keyLabels = {
  b_100 = "LMB",
  b_101 = "RMB",
  b_102 = "MMB",
  b_103 = "Mouse.ExtraBtn1",
  b_104 = "Mouse.ExtraBtn2",
  b_105 = "Mouse.ExtraBtn3",
  b_106 = "Mouse.ExtraBtn4",
  b_107 = "Mouse.ExtraBtn5",
  b_108 = "Mouse.ExtraBtn6",
  b_109 = "Mouse.ExtraBtn7",
  b_110 = "Mouse.ExtraBtn8",
  b_115 = "MouseWheel.Up",
  b_116 = "MouseWheel.Down",
  b_130 = "NumSubstract",
  b_131 = "NumAdd",
  b_134 = "Num Multiplication",
  b_135 = "Num Enter",
  b_137 = "Num1",
  b_138 = "Num2",
  b_139 = "Num3",
  b_140 = "Num4",
  b_141 = "Num5",
  b_142 = "Num6",
  b_143 = "Num7",
  b_144 = "Num8",
  b_145 = "Num9",
  b_170 = "F1",
  b_171 = "F2",
  b_172 = "F3",
  b_173 = "F4",
  b_174 = "F5",
  b_175 = "F6",
  b_176 = "F7",
  b_177 = "F8",
  b_178 = "F9",
  b_179 = "F10",
  b_180 = "F11",
  b_181 = "F12",
  b_182 = "F13",
  b_183 = "F14",
  b_184 = "F15",
  b_185 = "F16",
  b_186 = "F17",
  b_187 = "F18",
  b_188 = "F19",
  b_189 = "F20",
  b_190 = "F21",
  b_191 = "F22",
  b_192 = "F23",
  b_193 = "F24",
  b_194 = "Arrow Up",
  b_195 = "Arrow Down",
  b_196 = "Arrow Left",
  b_197 = "Arrow Right",
  b_198 = "Delete",
  b_199 = "Escape",
  b_200 = "Insert",
  b_201 = "End",
  b_210 = "Delete",
  b_211 = "Insert",
  b_212 = "End",
  b_1000 = "Shift",
  b_1002 = "Tab",
  b_1003 = "Enter",
  b_1004 = "Backspace",
  b_1009 = "PageUp",
  b_1008 = "Home",
  b_1010 = "PageDown",
  b_1012 = "CapsLock",
  b_1013 = "Control",
  b_1014 = "Right Control",
  b_1015 = "Alt",
  b_1055 = "Home",
  b_1056 = "PageUp",
  b_2000 = "Space"
}
-- Keybind metatable and default properties
local keybindMeta = {
  disabled = false,
  isPressed = false,
  defaultKey = "",
  defaultMapper = "keyboard"
}

-- Keybind metatable __index function
function keybindMeta.__index(self, key)
  if key == "currentKey" then
    local currentKey = self:getCurrentKey()
    if currentKey then
      return currentKey
    end
  end
  return keybindMeta[key]
end
-- Get current key for keybind
function keybindMeta.getCurrentKey(self)
  local keyString = GetControlInstructionalButton(0, self.hash, true)
  return keyString:sub(3)
end
-- Get current key label for keybind
function keybindMeta.getCurrentKeyLabel(self)
  local keyString = GetControlInstructionalButton(0, self.hash, true)
  local label = keyLabels[keyString]
  return label or keyString
end
-- Check if control is pressed
function keybindMeta.isControlPressed(self)
  return self.isPressed
end
-- Disable/enable keybind
function keybindMeta.disable(self, disabled)
  self.disabled = disabled
end
-- Add keybind function
function Luxu.addKeybind(keybind)
  -- Generate hash for keybind
  keybind.hash = joaat("+" .. keybind.name) | 2147483648
  
  -- Set metatable for keybind methods
  setmetatable(keybind, keybindMeta)
  
  -- Register press command
  RegisterCommand("+" .. keybind.name, function()
    if keybind.disabled or IsPauseMenuActive() then
      return
    end
    
    keybind.isPressed = true
    if keybind.onPressed then
      keybind:onPressed()
    end
  end, false)
  
  -- Register release command
  RegisterCommand("-" .. keybind.name, function()
    if keybind.disabled or IsPauseMenuActive() then
      return
    end
    
    keybind.isPressed = false
    if keybind.onReleased then
      keybind:onReleased()
    end
  end, false)
  
  -- Register key mapping
  RegisterKeyMapping(
    "+" .. keybind.name,
    keybind.description,
    keybind.defaultMapper,
    keybind.defaultKey
  )
  
  -- Register secondary key mapping if provided
  if keybind.secondaryKey then
    RegisterKeyMapping(
      "~!+" .. keybind.name,
      keybind.description,
      keybind.secondaryMapper or keybind.defaultMapper,
      keybind.secondaryKey
    )
  end
  
  -- Remove chat suggestions after delay
  SetTimeout(500, function()
    TriggerEvent("chat:removeSuggestion", ("/+%s"):format(keybind.name))
    TriggerEvent("chat:removeSuggestion", ("/-%s"):format(keybind.name))
  end)
  
  return keybind
end
-- Register network event with luxu_admin prefix
function Luxu.registerNetEvent(eventName, handler)
  RegisterNetEvent("luxu_admin:client:" .. eventName, handler)
end
-- Register strict network event (local source only)
function Luxu.registerNetEventStrict(eventName, handler)
  RegisterNetEvent("luxu_admin:client:" .. eventName, function(...)
    -- Only allow local source (65535) or server source (0)
    if source ~= 65535 and source ~= 0 then
      return
    end
    handler(...)
  end)
end
-- Add event handler with luxu_admin prefix
function Luxu.addEventHandler(eventName, handler)
  AddEventHandler("luxu_admin:client:" .. eventName, handler)
end
-- Trigger server event with luxu_admin prefix
function Luxu.triggerServerEvent(eventName, ...)
  TriggerServerEvent("luxu_admin:server:" .. eventName, ...)
end
-- Trigger latent server event with luxu_admin prefix
function Luxu.triggerServerEventLatent(eventName, bytesPerSecond, ...)
  TriggerLatentServerEvent(
    "luxu_admin:server:" .. eventName,
    bytesPerSecond or 10000.0,
    ...
  )
end
-- Initialize notification system
Luxu.notify = require("bridge.client.notify").notify
-- Get nearby players within specified distance
function Luxu.getNearbyPlayers(distance, includeSelf, useServerId, sortByDistance)
  local players = {}
  local playersWithDistance = {}
  local localPlayerId = Luxu.cache.playerId
  local localCoords = GetEntityCoords(Luxu.cache.ped)
  local activePlayers = GetActivePlayers()
  
  for i = 1, #activePlayers do
    local playerId = activePlayers[i]
    
    -- Include self check
    if includeSelf or playerId ~= localPlayerId then
      local playerCoords = GetEntityCoords(GetPlayerPed(playerId))
      local playerDistance = #(playerCoords - localCoords)
      
      if distance >= playerDistance then
        local targetId = playerId
        
        -- Use server ID if requested
        if useServerId then
          local serverId = GetPlayerServerId(playerId)
          if serverId then
            targetId = serverId
          end
        end
        
        -- Store with distance for sorting or add directly
        if sortByDistance then
          table.insert(playersWithDistance, {
            id = targetId,
            distance = playerDistance
          })
        else
          table.insert(players, targetId)
        end
      end
    end
  end
  
  -- Sort by distance if requested
  if sortByDistance and #playersWithDistance > 0 then
    table.sort(playersWithDistance, function(a, b)
      return a.distance < b.distance
    end)
    
    -- Extract sorted IDs
    for i = 1, #playersWithDistance do
      players[i] = playersWithDistance[i].id
    end
  end
  
  return players
end
-- Get nearest vehicle to specified coordinates
function Luxu.getNearestVehicle(coords, maxDistance, includePlayerVehicle)
  -- Use player coords if not provided
  if not coords then
    coords = GetEntityCoords(PlayerPedId())
  end
  
  local vehicles = GetGamePool("CVehicle")
  local nearestVehicle = nil
  local nearestCoords = nil
  
  -- Default max distance
  if not maxDistance then
    maxDistance = 2.0
  end
  
  for i = 1, #vehicles do
    local vehicle = vehicles[i]
    
    -- Skip player's current vehicle unless explicitly included
    if lib.context ~= "server" then
      if Luxu.cache.vehicle then
        if not (vehicle ~= Luxu.cache.vehicle or includePlayerVehicle) then
          goto continue
        end
      end
    end
    
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = #(vec3(coords.x, coords.y, coords.z) - vehicleCoords)
    
    if maxDistance > distance then
      maxDistance = distance
      nearestVehicle = vehicle
      nearestCoords = vehicleCoords
    end
    
    ::continue::
  end
  
  return nearestVehicle, nearestCoords
end
-- Get nearby vehicles within specified distance
function Luxu.getNearbyVehicles(coords, maxDistance, includePlayerVehicle)
  local vehicles = GetGamePool("CVehicle")
  local nearbyVehicles = {}
  local count = 0
  
  -- Default max distance
  if not maxDistance then
    maxDistance = 2.0
  end
  
  for i = 1, #vehicles do
    local vehicle = vehicles[i]
    
    -- Skip player's current vehicle unless explicitly included
    if lib.context ~= "server" then
      if Luxu.cache.vehicle then
        if not (vehicle ~= Luxu.cache.vehicle or includePlayerVehicle) then
          goto continue
        end
      end
    end
    
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = #(coords - vehicleCoords)
    
    if maxDistance > distance then
      count = count + 1
      nearbyVehicles[count] = {
        vehicle = vehicle,
        coords = vehicleCoords
      }
    end
    
    ::continue::
  end
  
  return nearbyVehicles
end
-- Register notification event handler
Luxu.registerNetEvent("notify", function(notificationData)
  Luxu.notify(
    notificationData.title,
    notificationData.description,
    notificationData.duration,
    notificationData.type
  )
end)
-- Register NUI server callback with async handling
function Luxu.registerNuiServerCallback(callbackName, useRateLimit, onResult)
  RegisterNuiCallback(callbackName, function(data, callback)
    Luxu.callbackAsync(
      callbackName,
      useRateLimit or false,
      function(result)
        callback(result or false)
        if onResult then
          onResult(result)
        end
      end,
      data
    )
  end)
end
-- Listen for server NUI events
function Luxu.listenForServerNuiEvent(eventName, handler)
  Luxu.registerNetEvent(eventName, function(data)
    if handler then
      return handler(data)
    end
    FetchNui(eventName, data)
  end)
end
-- Register NUI server callback that triggers server event
function Luxu.registerNuiServer(callbackName)
  RegisterNuiCallback(callbackName, function(data, callback)
    TriggerServerEvent("luxu_admin:server:" .. callbackName, data)
    callback(true)
  end)
end
-- Callback system variables
local callbacks = {}
local rateLimits = {}
local CALLBACK_TIMEOUT = 30000.0

-- Register callback result handler
RegisterNetEvent("luxu_admin_callback_result", function(callbackId, ...)
  -- Validate source
  if source == "" then
    return
  end
  
  if source ~= 0 and source ~= 65535 then
    return
  end
  
  -- Get callback handler
  local handler = callbacks[callbackId]
  if not handler then
    return
  end
  
  -- Remove callback and execute
  callbacks[callbackId] = nil
  handler(...)
end)
-- Rate limit check function
local function checkRateLimit(eventName, rateLimitMs)
  if rateLimitMs then
    if type(rateLimitMs) == "number" and rateLimitMs > 0 then
      local currentTime = GetGameTimer()
      local lastCall = rateLimits[eventName] or 0
      
      if currentTime < lastCall then
        return false
      end
      
      rateLimits[eventName] = currentTime + rateLimitMs
    end
  end
  
  return true
end
-- Callback async function with promise support
local function callbackAsync(eventName, rateLimitMs, handler, ...)
  -- Check rate limit
  if not checkRateLimit(eventName, rateLimitMs) then
    return
  end
  
  -- Generate unique callback ID
  local callbackId = nil
  repeat
    callbackId = string.format("%s:%s", eventName, math.random(0, 100000))
  until not callbacks[callbackId]
  
  -- Trigger server event
  TriggerServerEvent("luxu_admin_cb:server:" .. eventName, callbackId, ...)
  
  -- Create promise if no handler provided
  local callbackPromise = not handler and promise.new()
  
  -- Store callback handler
  callbacks[callbackId] = function(success, ...)
    local result = {success, ...}
    
    if callbackPromise then
      return callbackPromise:resolve(result)
    end
    
    if handler then
      handler(table.unpack(result))
    end
  end
  -- Handle promise timeout and await
  if callbackPromise then
    SetTimeout(CALLBACK_TIMEOUT, function()
      callbackPromise:reject(string.format("callback event '%s' timed out", callbackId))
    end)
    
    return table.unpack(Citizen.Await(callbackPromise))
  end
end
-- Assign callback functions to Luxu object
Luxu.callbackAsync = function(eventName, rateLimitMs, handler, ...)
  callbackAsync(eventName, rateLimitMs, handler, ...)
end

Luxu.callbackSync = function(eventName, rateLimitMs, ...)
  return callbackAsync(eventName, rateLimitMs, false, ...)
end
-- Load model with validation
function Luxu.loadModel(modelHash)
  if IsModelValid(modelHash) then
    if IsModelInCdimage(modelHash) then
      RequestModel(modelHash)
      
      while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
      end
      
      return true
    end
  end
  
  return false
end
-- Check if model is valid and in CD image
function Luxu.isModelValid(modelHash)
  if IsModelValid(modelHash) then
    return IsModelInCdimage(modelHash)
  end
  return false
end
-- Request model and wait for it to load
function Luxu.requestModel(model)
  local modelHash = model
  
  -- Convert string to hash if needed
  if type(model) ~= "number" or not model then
    modelHash = joaat(model)
  end
  
  -- Return immediately if already loaded
  if HasModelLoaded(modelHash) then
    return modelHash
  end
  
  -- Request and wait for model to load
  RequestModel(modelHash)
  repeat
    Wait(0)
  until HasModelLoaded(modelHash)
  
  return modelHash
end
-- Check if animation dictionary exists
function Luxu.isAnimDictValid(animDict)
  return DoesAnimDictExist(animDict)
end

-- Load animation dictionary
function Luxu.loadAnimDict(animDict)
  if HasAnimDictLoaded(animDict) then
    return true
  end
  
  RequestAnimDict(animDict)
  
  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(0)
  end
  
  return true
end
-- Raycast utility module
Luxu.raycast = {}

-- Native function references for raycast
local startShapeTestLosProbe = StartShapeTestLosProbe
local getShapeTestResultIncludingMaterial = GetShapeTestResultIncludingMaterial
local mathAbs = math.abs
local mathSin = math.sin
local mathCos = math.cos
local mathPi = math.pi
local getFinalRenderedCamCoord = GetFinalRenderedCamCoord
local getFinalRenderedCamRot = GetFinalRenderedCamRot
-- Convert degrees to radians
local function degreesToRadians(rotation)
  return {
    x = rotation.x * mathPi / 180,
    y = rotation.y * mathPi / 180,
    z = rotation.z * mathPi / 180
  }
end
-- Calculate sine and cosine values for rotation
local function calculateSinCos(rotation)
  local sinValues = {
    x = mathSin(rotation.x),
    y = mathSin(rotation.y),
    z = mathSin(rotation.z)
  }
  
  local cosValues = {
    x = mathCos(rotation.x),
    y = mathCos(rotation.y),
    z = mathCos(rotation.z)
  }
  
  return sinValues, cosValues
end
-- Raycast from coordinates to coordinates
function Luxu.raycast.fromCoords(startCoords, endCoords, flags, intersectType)
  local rayHandle = startShapeTestLosProbe(
    startCoords.x, startCoords.y, startCoords.z,
    endCoords.x, endCoords.y, endCoords.z,
    flags or 511,
    cache.ped,
    intersectType or 4
  )
  
  while true do
    Wait(0)
    local retval, hit, endCoords, surfaceNormal, materialHash = getShapeTestResultIncludingMaterial(rayHandle)
    if retval ~= 1 then
      return hit, materialHash, endCoords, surfaceNormal, materialHash
    end
  end
end
-- Get camera direction vector
local function getCameraDirection()
  local rotation = getFinalRenderedCamRot(2)
  local radians = degreesToRadians(rotation)
  local sinValues, cosValues = calculateSinCos(radians)
  
  return vec3(
    -sinValues.z * mathAbs(cosValues.x),
    cosValues.z * mathAbs(cosValues.x),
    sinValues.x
  )
end
-- Raycast from camera position
function Luxu.raycast.fromCamera(flags, intersectType, distance)
  flags = flags or 511
  intersectType = intersectType or 4
  distance = distance or 10
  
  local camCoords = getFinalRenderedCamCoord()
  local direction = getCameraDirection()
  local endCoords = camCoords + (direction * distance)
  
  return true, 0, endCoords, vec3(0, 0, 0), 0
end
-- Load bridge modules
require("bridge.client.functions")
Luxu.clothing = require("bridge.client.clothing")

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
