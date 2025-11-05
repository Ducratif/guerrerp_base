--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Load custom functions with error handling
local function loadCustomFunctions()
  require("config.custom_functions.client")
end

local function handleCustomFunctionError(error)
  Luxu.print.error("Error loading client custom functions")
  Luxu.print.error(error)
end

xpcall(loadCustomFunctions, handleCustomFunctionError)
-- Native function reference
local getPedLastDamageBone = GetPedLastDamageBone

-- Check if player has specific permission
function HasPermission(permission, isStrictCheck, requireOnDuty)
  -- Validate boolean parameters
  if type(isStrictCheck) ~= "boolean" then
    isStrictCheck = false
  end
  if type(requireOnDuty) ~= "boolean" then
    requireOnDuty = true
  end
  
  return Luxu.callbackSync("checkPermission", false, permission, isStrictCheck, requireOnDuty)
end
-- Staff duty state management
OnDuty = false

-- Get current duty status
function IsOnDuty()
  return OnDuty
end

-- Handle duty state changes from server
Luxu.registerNetEventStrict("staff:duty", function(dutyState)
  OnDuty = dutyState
end)

-- Initialize duty state on client start
SetTimeout(2000, function()
  Luxu.callbackAsync("staff:getDuty", false, function(dutyState)
    OnDuty = dutyState
  end, Luxu.cache.serverId)
end)
-- ESX vehicle refresh state
local isRefreshingESXVehicles = false

-- NUI callback to refresh ESX vehicles
RegisterNuiCallback("refreshESXVehicles", function(data, callback)
  if isRefreshingESXVehicles then
    return
  end
  
  isRefreshingESXVehicles = true
  RefreshESXVehicles()
  callback(true)
end)
-- NUI callback to get configuration
RegisterNuiCallback("getConfig", function(data, callback)
  callback(Config)
end)

-- NUI callback to get locales
RegisterNuiCallback("getLocales", function(data, callback)
  callback(Locales)
end)
-- Player names system state
local activeThreads = {}
local isPlayerNamesEnabled = false
local gamerTags = {}

-- Toggle player names display
function TogglePlayerNames(enable)
  -- Clear existing gamer tags
  activeThreads.gamerTag = nil
  for _, tagId in pairs(gamerTags) do
    RemoveMpGamerTag(tagId)
  end
  gamerTags = {}
  
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isPlayerNamesEnabled = enable
  else
    isPlayerNamesEnabled = not isPlayerNamesEnabled
  end
  
  if isPlayerNamesEnabled then
    activeThreads.gamerTag = function()
      for _, playerId in ipairs(GetActivePlayers()) do
        local playerPed = GetPlayerPed(playerId)
        
        if not gamerTags[playerPed] then
          local serverId = GetPlayerServerId(playerId)
          local playerState = Player(serverId).state
          local staffGroupLabel = playerState.luxu_admin_staff_group_label
          
          -- Format staff group prefix
          local groupPrefix = ""
          if staffGroupLabel then
            groupPrefix = string.format("%s | ", staffGroupLabel)
          end
          
          local playerName = GetPlayerName(playerId)
          local serverIdText = string.format("[%s] ", serverId)
          
          -- Check if entity exists and is visible
          if DoesEntityExist(playerPed) then
            local hasLineOfSight = HasEntityClearLosToEntity(Luxu.cache.ped, playerPed, 17)
            
            if hasLineOfSight then
              local playerCoords = GetEntityCoords(playerPed)
              local myCoords = GetEntityCoords(Luxu.cache.ped)
              local distance = #(myCoords - playerCoords)
              
              -- Only show tags within 50 units
              if distance < 50 then
                local fullDisplayName = groupPrefix .. serverIdText .. playerName
                local gamerTagId = CreateMpGamerTag(playerPed, fullDisplayName, false, false, "", 0)
                
                gamerTags[playerPed] = gamerTagId
                
                -- Configure gamer tag visibility and appearance
                SetMpGamerTagVisibility(gamerTagId, 0, true)  -- Name component
                SetMpGamerTagVisibility(gamerTagId, 2, true)  -- Health bar component
                SetMpGamerTagHealthBarColor(gamerTagId, 25)   -- Health bar color
                SetMpGamerTagAlpha(gamerTagId, 2, 255)        -- Health bar alpha
              end
            end
          end
        end
      end
    end
  end
end
-- God mode state
local isGodModeEnabled = false

-- Toggle god mode (invincibility)
function ToggleGodMode(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isGodModeEnabled = enable
  else
    isGodModeEnabled = not isGodModeEnabled
  end
  
  activeThreads.godMode = nil
  
  if isGodModeEnabled then
    -- Enable god mode immediately
    SetEntityInvincible(Luxu.cache.ped, true)
    
    -- Create thread to maintain god mode
    activeThreads.godMode = function()
      SetEntityInvincible(Luxu.cache.ped, true)
    end
  else
    -- Disable god mode
    SetEntityInvincible(Luxu.cache.ped, false)
  end
end
-- Invisibility state
local isInvisibilityEnabled = false
local invisibilityIntervalId = 0

-- Toggle invisibility mode
function ToggleInvisibility(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isInvisibilityEnabled = enable
  else
    isInvisibilityEnabled = not isInvisibilityEnabled
  end
  
  -- Clear existing interval
  Luxu.clearInterval(invisibilityIntervalId)
  
  if isInvisibilityEnabled then
    -- Make player invisible initially
    SetEntityVisible(Luxu.cache.ped, false, false)
    
    -- Create interval to maintain invisibility effects
    invisibilityIntervalId = Luxu.setInterval(function()
      SetEntityVisible(Luxu.cache.ped, false, false)
      SetLocalPlayerVisibleLocally(true)  -- Keep visible to self
      SetEntityAlpha(Luxu.cache.ped, 200, false)  -- Semi-transparent
    end, 0)
  else
    -- Restore visibility
    SetEntityVisible(Luxu.cache.ped, true, false)
    ResetEntityAlpha(Luxu.cache.ped)
  end
end
-- Entity inspector state
local isEntityInspectorEnabled = false
local entityInspectorIntervalId = 0

-- Toggle entity inspector
function ToggleEntityInspector(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isEntityInspectorEnabled = enable
  else
    isEntityInspectorEnabled = not isEntityInspectorEnabled
  end
  
  -- Clear existing interval
  Luxu.clearInterval(entityInspectorIntervalId)
  
  if isEntityInspectorEnabled then
    -- Enable entity inspector UI
    FetchNui("toggleEntityInspector", true)
    entityInspectorIntervalId = StartEntityInspector()
  else
    -- Disable entity inspector UI
    FetchNui("toggleEntityInspector", false)
  end
end
-- Headlight system state
local isHeadLightEnabled = false
local headLightIntervalId = 0
local playerHeadLightIntervals = {}

-- Draw light effect at entity position
local function drawHeadLight(entity, playerId)
  -- Clean up if entity no longer exists
  if not DoesEntityExist(entity) then
    if playerHeadLightIntervals[playerId] then
      ClearInterval(playerHeadLightIntervals[playerId])
      playerHeadLightIntervals[playerId] = nil
      return
    end
  end
  
  local entityCoords = GetEntityCoords(entity)
  
  -- Light configuration
  local lightColor = {255, 255, 255}  -- White light
  local lightRange = 100.0
  local lightIntensity = 10.0
  
  -- Draw the light effect
  DrawLightWithRange(
    entityCoords.x, entityCoords.y, entityCoords.z,
    lightColor[1], lightColor[2], lightColor[3],
    lightRange, lightIntensity
  )
end
-- Toggle headlight effect
function ToggleHeadLight(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isHeadLightEnabled = enable
  else
    isHeadLightEnabled = not isHeadLightEnabled
  end
  
  -- Clear existing interval
  Luxu.clearInterval(headLightIntervalId)
  
  -- Set player state for network sync
  LocalPlayer.state:set("luxu_admin.headlight", isHeadLightEnabled, true)
  
  if isHeadLightEnabled then
    -- Start headlight effect interval
    headLightIntervalId = Luxu.setInterval(function()
      drawHeadLight(Luxu.cache.ped)
    end)
  end
end
-- Handle headlight state changes from other players
AddStateBagChangeHandler("luxu_admin.headlight", nil, function(bagName, key, value)
  local playerId = GetPlayerFromStateBagName(bagName)
  
  -- Skip if it's our own player
  if playerId == Luxu.cache.playerId then
    return
  end
  
  if value then
    -- Start headlight effect for other player
    playerHeadLightIntervals[playerId] = Luxu.setInterval(function()
      drawHeadLight(Luxu.cache.ped)
    end)
  else
    -- Stop headlight effect for other player
    if playerHeadLightIntervals[playerId] then
      Luxu.clearInterval(playerHeadLightIntervals[playerId])
      playerHeadLightIntervals[playerId] = nil
    end
  end
end)
-- Thermal vision state
local isThermalVisionEnabled = false

-- Toggle thermal vision
function ToggleThermalVision(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isThermalVisionEnabled = enable
  else
    isThermalVisionEnabled = not isThermalVisionEnabled
  end
  
  activeThreads.thermalVision = nil
  
  -- Set player state for network sync
  LocalPlayer.state:set("luxu_admin.thermal_vision", isThermalVisionEnabled, true)
  
  if isThermalVisionEnabled then
    -- Enable thermal vision
    SetSeethrough(true)
    
    -- Create thread to maintain thermal vision
    activeThreads.thermalVision = function()
      SetSeethrough(true)
    end
  else
    -- Disable thermal vision
    SetSeethrough(false)
  end
end
-- Night vision state
local isNightVisionEnabled = false

-- Toggle night vision
function ToggleNightVision(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isNightVisionEnabled = enable
  else
    isNightVisionEnabled = not isNightVisionEnabled
  end
  
  activeThreads.nightVision = nil
  
  -- Set player state for network sync
  LocalPlayer.state:set("luxu_admin.night_vision", isNightVisionEnabled, true)
  
  if isNightVisionEnabled then
    -- Enable night vision
    SetNightvision(true)
    
    -- Create thread to maintain night vision
    activeThreads.nightVision = function()
      SetNightvision(true)
    end
  else
    -- Disable night vision
    SetNightvision(false)
  end
end
-- Infinite ammo state
local isInfiniteAmmoEnabled = false

-- Toggle infinite ammo
function ToggleInfiniteAmmo(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isInfiniteAmmoEnabled = enable
  else
    isInfiniteAmmoEnabled = not isInfiniteAmmoEnabled
  end
  
  activeThreads.infiniteAmmo = nil
  
  -- Set player state for network sync
  LocalPlayer.state:set("luxu_admin.infinite_ammo", isInfiniteAmmoEnabled, true)
  
  if isInfiniteAmmoEnabled then
    -- Enable infinite ammo immediately
    SetPedInfiniteAmmoClip(Luxu.cache.ped, true)
    
    -- Create thread to maintain infinite ammo
    activeThreads.infiniteAmmo = function()
      local hasWeapon, weaponHash = GetCurrentPedWeapon(Luxu.cache.ped, true)
      
      if hasWeapon then
        local currentAmmo = GetAmmoInPedWeapon(Luxu.cache.ped, weaponHash)
        
        -- Refill ammo if empty
        if currentAmmo == 0 then
          local ammoType = GetPedAmmoTypeFromWeapon(Luxu.cache.ped, weaponHash)
          AddAmmoToPedByType(Luxu.cache.ped, ammoType, 1)
          RefillAmmoInstantly(Luxu.cache.ped)
        end
      end
      
      -- Maintain infinite ammo clip
      SetPedInfiniteAmmoClip(Luxu.cache.ped, true)
    end
  else
    -- Disable infinite ammo
    SetPedInfiniteAmmoClip(Luxu.cache.ped, false)
  end
end
-- Super jump state
local isSuperJumpEnabled = false
local superJumpIntervalId = 0

-- Toggle super jump ability
function ToggleSuperJump(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isSuperJumpEnabled = enable
  else
    isSuperJumpEnabled = not isSuperJumpEnabled
  end
  
  -- Clear existing interval
  Luxu.clearInterval(superJumpIntervalId)
  
  -- Set player state for network sync
  LocalPlayer.state:set("luxu_admin.super_jump", isSuperJumpEnabled, true)
  
  if isSuperJumpEnabled then
    local staminaCounter = 0
    
    superJumpIntervalId = Luxu.setInterval(function()
      -- Restore stamina periodically
      staminaCounter = staminaCounter + 1
      if staminaCounter > 200 then
        RestorePlayerStamina(Luxu.cache.playerId, 100.0)
        staminaCounter = 0
      end
      
      -- Maintain normal movement rate
      SetPedMoveRateOverride(Luxu.cache.ped, 1.0)
      
      -- Enable super jump for this frame
      SetSuperJumpThisFrame(Luxu.cache.playerId)
    end, 0)
  end
end
-- Death logging system state
local totalKills = 0
local headshotKills = 0
local deathLogQueue = {}

-- Handle game events for death logging
AddEventHandler("gameEventTriggered", function(eventName, eventData)
  if eventName == "CEventNetworkEntityDamage" then
    local myPed = PlayerPedId()
    local victimPed = eventData[2]
    
    -- Only process if we are the victim
    if victimPed ~= myPed then
      return
    end
    
    local attackerPed = eventData[1]
    local isDead = eventData[6] == 1
    local weaponHash = eventData[7]
    local isHeadshot = eventData[12] == 1
    local damageBone = getPedLastDamageBone(attackerPed)
    
    -- Track kill statistics if player died
    if isDead and not isHeadshot then
      totalKills = totalKills + 1
      
      -- Check if it was a headshot (bone 31086 = head)
      if damageBone == 31086 then
        headshotKills = headshotKills + 1
      end
      
      -- Update headshot ratio in player state
      LocalPlayer.state:set("luxu_admin.headshot_ratio", headshotKills / totalKills, true)
    end
    
    -- Log player kills (when we kill someone else)
    if attackerPed == myPed then
      local weaponModel = GetWeapontypeModel(weaponHash)
      local victimPlayerId = NetworkGetPlayerIndexFromPed(victimPed)
      
      if isDead and victimPlayerId ~= -1 then
        local killerServerId = GetPlayerServerId(victimPlayerId)
        local killerName = GetPlayerName(victimPlayerId)
        local victimServerId = Luxu.cache.serverId
        local victimName = GetPlayerName(Luxu.cache.playerId)
        
        local logMessage = string.format(
          "[%s]%s killed: [%s]%s | Weapon Model Hash: %s",
          killerServerId, killerName, victimServerId, victimName, weaponModel
        )
        
        table.insert(deathLogQueue, logMessage)
      end
    end
  end
end)
-- Death log batch processing thread
Citizen.CreateThread(function()
  while true do
    -- Send death logs to server if any exist
    if #deathLogQueue > 0 then
      Luxu.triggerServerEventLatent("log:playerDeathBatch", 10000, deathLogQueue)
      deathLogQueue = {}
    end
    
    Citizen.Wait(60000.0)  -- Process every minute
  end
end)
-- Coordinates display state
local isShowCoordsEnabled = false
local coordsIntervalId = 0

-- Toggle coordinates display
function ToggleShowCoords(enable)
  -- Auto-toggle if no boolean provided
  if type(enable) == "boolean" then
    isShowCoordsEnabled = enable
  else
    isShowCoordsEnabled = not isShowCoordsEnabled
  end
  
  -- Clear existing interval
  Luxu.clearInterval(coordsIntervalId)
  
  if isShowCoordsEnabled then
    -- Show coordinates UI
    FetchNui("showCoords", true)
    
    -- Start coordinates update interval
    coordsIntervalId = Luxu.setInterval(function()
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      local heading = GetEntityHeading(playerPed)
      
      -- Send coordinate data to NUI
      FetchNui("coordsUpdate", {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        w = heading
      })
    end, 50)
  else
    -- Hide coordinates UI
    FetchNui("showCoords", false)
  end
end
-- Handle staff duty toggle - disable all admin features when going off duty
OnStaffDutyToggled(function(isOnDuty)
  if isOnDuty then
    return
  end
  
  -- Disable all admin features when going off duty
  ToggleShowCoords(false)
  TogglePlayerNames(false)
  ToggleEntityInspector(false)
  ToggleInvisibility(false)
  ToggleGodMode(false)
  ToggleSuperJump(false)
  ToggleHeadLight(false)
  ToggleThermalVision(false)
  ToggleNightVision(false)
  ToggleInfiniteAmmo(false)
  ToggleNoclip(false)
end)
-- Debounced position update function
local updateMapPosition = Debounce(function(position)
  Luxu.triggerServerEventLatent("map:updatePosition", 10000.0, position)
end, 10000.0)
-- Main cache update and position tracking thread
Citizen.CreateThread(function()
  while true do
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    
    -- Update Luxu cache with current player data
    Luxu.cache.ped = playerPed
    Luxu.cache.coords = vector4(coords.x, coords.y, coords.z, heading)
    
    -- Update vehicle cache
    if IsPedInAnyVehicle(playerPed, false) then
      Luxu.cache.vehicle = GetVehiclePedIsIn(playerPed, false)
    else
      Luxu.cache.vehicle = false
    end
    
    -- Update map position (debounced)
    updateMapPosition({
      x = math.floor(coords.x * 100) / 100,
      y = math.floor(coords.y * 100) / 100
    })
    
    Wait(300)
  end
end)
-- Active threads execution loop
CreateThread(function()
  while true do
    -- Execute all active thread functions
    for _, threadFunction in pairs(activeThreads) do
      pcall(threadFunction)
    end
    
    Wait(1000)
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
