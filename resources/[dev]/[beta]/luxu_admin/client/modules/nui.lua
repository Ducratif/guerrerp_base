--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- NUI Module
-- Handles NUI callbacks, server communication, and admin panel features

-- Load and decode ped list from configuration
local pedListData = json.decode(LoadResourceFile(GetCurrentResourceName(), "config/ped_list.json"))
local PedHashes = {}
-- Initialize ped hashes on resource start
AddEventHandler("onClientResourceStart", function(resourceName)
  if resourceName == GetCurrentResourceName() then
    -- Build ped hash lookup table
    for _, pedName in ipairs(pedListData) do
      local pedHash = joaat(pedName)
      PedHashes[pedHash] = pedName
    end
    
    -- Wait for NUI to be ready, then send ped list
    Wait(1500)
    FetchNui("setPedList", pedListData)
  end
end)
-- Get teleport locations from configuration
RegisterNuiCallback("getTeleports", function(data, callback)
  local teleportConfig = lib.require("config.teleports")
  callback(json.encode(teleportConfig, {indent = true}))
end)
-- Get server information (always returns true)
RegisterNUICallback("getServerInfo", function(data, callback)
  callback(true)
end)
-- Get all available vehicle models
RegisterNuiCallback("getVehicleModels", function(data, callback)
  local vehicleModels = GetAllVehicleModels()
  callback(vehicleModels)
end)
-- Load and execute help configuration
RegisterNuiCallback("getHelp", function(data, callback)
  local helpConfig = load(LoadResourceFile(GetCurrentResourceName(), "config/help.lua"))()
  callback(helpConfig)
end)
-- Get nearby players using Luxu framework
RegisterNuiCallback("getNearbyPlayers", function(data, callback)
  local nearbyPlayers = Luxu.getNearbyPlayers(data, false, true, true)
  callback(nearbyPlayers)
end)
-- Get player's current coordinates and heading (rounded to 2 decimal places)
RegisterNuiCallback("getMyCoords", function(data, callback)
  local playerCoords = GetEntityCoords(PlayerPedId())
  local playerHeading = GetEntityHeading(PlayerPedId())
  
  local roundedCoords = {
    x = math.floor(playerCoords.x * 100) / 100,
    y = math.floor(playerCoords.y * 100) / 100,
    z = math.floor(playerCoords.z * 100) / 100,
    w = math.floor(playerHeading * 100) / 100
  }
  
  callback(roundedCoords)
end)
-- External chat and user management server callbacks
Luxu.registerNuiServerCallback("external_chat:requestUrl")
Luxu.listenForServerNuiEvent("user:loadData")
Luxu.registerNuiServerCallback("user:getData")
Luxu.registerNuiServerCallback("user:update")

-- Permission management
Luxu.listenForServerNuiEvent("permissions:refresh")
Luxu.registerNuiServerCallback("permissions:get")
Luxu.registerNuiServerCallback("getPanelData")

-- Staff management server callbacks
Luxu.registerNuiServerCallback("staff:getDuty")
Luxu.registerNuiServerCallback("staff:toggleDuty")
Luxu.registerNuiServerCallback("staff:getGroups")
Luxu.registerNuiServerCallback("staff:getGroupsAndStaff")
Luxu.registerNuiServerCallback("staff:createGroup")
Luxu.registerNuiServerCallback("staff:updateGroup")
Luxu.registerNuiServerCallback("staff:deleteGroup")
Luxu.registerNuiServerCallback("staff:createMember")
Luxu.registerNuiServerCallback("staff:updateMember")
Luxu.registerNuiServerCallback("staff:removeMember")
Luxu.registerNuiServerCallback("staff:getStaffNames")
-- Player management server callbacks
Luxu.registerNuiServerCallback("player:getMoneyAccounts")
Luxu.registerNuiServerCallback("player:getWarnings")
Luxu.registerNuiServerCallback("player:getPing")

-- Statistics and performance server callbacks
Luxu.registerNuiServerCallback("invalidateStatsCache")
Luxu.registerNuiServerCallback("getStatsPerformance")
Luxu.registerNuiServerCallback("getPlayerList")
Luxu.registerNuiServerCallback("getLatestPlayers")
Luxu.registerNuiServerCallback("getSteamProfile")
Luxu.registerNuiServerCallback("getServerStatistics")
Luxu.registerNuiServerCallback("getStatistics")
Luxu.registerNuiServerCallback("getPlayerStatsHistory")
Luxu.registerNuiServerCallback("dutyTracking:getOverview")
-- Console management server callbacks
Luxu.registerNuiServerCallback("console:subscribe")
Luxu.registerNuiServer("console:unsubscribe")
Luxu.registerNuiServer("console:sendCommand")
Luxu.listenForServerNuiEvent("console:newLog")
Luxu.registerNuiServerCallback("getPlayerCountChartData")
-- Moderation server callbacks
Luxu.registerNuiServerCallback("getBans")
Luxu.registerNuiServerCallback("getWarnings")
Luxu.registerNuiServerCallback("getJail")
-- Event management server callbacks
Luxu.registerNuiServerCallback("events:get")
Luxu.registerNuiServerCallback("events:createEvent")
Luxu.registerNuiServerCallback("events:delete")
-- Blip management server callbacks
Luxu.registerNuiServerCallback("blips:get")
Luxu.registerNuiServerCallback("blips:create")
Luxu.registerNuiServerCallback("blips:update")
Luxu.registerNuiServerCallback("blips:delete")
-- Remote spectate management
Luxu.registerNuiServerCallback("spectate:remote:start")
Luxu.registerNuiServer("spectate:remote:stop")

-- Remote spectate network events
Luxu.registerNetEvent("spectate:remote:end", function(data)
  FetchNui("spectate:remote:end", data)
end)

Luxu.registerNetEvent("spectate:remote:request", function(data)
  FetchNui("spectate:remote:request", data)
end)
-- Remote spectate viewer WebRTC communication
Luxu.registerNuiServer("spectate:remote:viewer:sendIceCandidate")
Luxu.registerNuiServer("spectate:remote:viewer:sendAnswer")

Luxu.registerNetEvent("spectate:remote:viewer:receiveIceCandidate", function(data)
  FetchNui("spectate:remote:viewer:receiveIceCandidate", data)
end)

Luxu.registerNetEvent("spectate:remote:viewer:receiveOffer", function(data)
  FetchNui("spectate:remote:viewer:receiveOffer", data)
end)
-- Remote spectate host WebRTC communication
Luxu.registerNuiServer("spectate:remote:host:sendOffer")
Luxu.registerNuiServer("spectate:remote:host:sendIceCandidate")

Luxu.registerNetEvent("spectate:remote:host:receiveAnswer", function(data)
  FetchNui("spectate:remote:host:receiveAnswer", data)
end)

Luxu.registerNetEvent("spectate:remote:host:receiveIceCandidate", function(data)
  FetchNui("spectate:remote:host:receiveIceCandidate", data)
end)
-- Media management server callbacks
Luxu.registerNuiServer("media:deleteVideoClip")
Luxu.registerNuiServerCallback("media:requestPresignedUrl")
Luxu.registerNuiServer("media:presignedSuccess")
-- Get inventory item list
RegisterNuiCallback("inventory:getItemList", function(data, callback)
  local itemList = Luxu.inventory.getItems()
  callback(itemList)
end)
-- Map-related server callbacks
Luxu.registerNuiServerCallback("map:getPlayerPositions")
Luxu.registerNuiServerCallback("map:getHeatmapData")
-- Resource management server callbacks
Luxu.registerNuiServerCallback("resources:getResources")
Luxu.registerNuiServer("resources:start")
Luxu.registerNuiServer("resources:stop")
-- Avatar and mugshot management
Luxu.registerNuiServer("mugshot:response")
Luxu.registerNuiServerCallback("avatar:get")
Luxu.registerNuiServer("avatar:refresh")
Luxu.listenForServerNuiEvent("avatar:received")
-- Mugshot system variables and handlers
local currentMugshotHandle = nil

-- Handle mugshot request from server
Luxu.registerNetEvent("mugshot:request", function()
  -- Register ped headshot for current player
  currentMugshotHandle = RegisterPedheadshot(PlayerPedId())
  
  -- Wait for headshot to be ready in separate thread
  CreateThread(function()
    while true do
      if IsPedheadshotReady(currentMugshotHandle) then
        break
      end
      Wait(0)
    end
    
    -- Get headshot texture string and send to NUI
    local headshotTexture = GetPedheadshotTxdString(currentMugshotHandle)
    FetchNui("mugshot:request", headshotTexture)
  end)
end)

-- Handle mugshot response from NUI
RegisterNuiCallback("mugshot:response", function(data)
  -- Send response to server
  Luxu.triggerServerEvent("mugshot:response", data)
  
  -- Clean up headshot handle
  UnregisterPedheadshot(currentMugshotHandle)
  currentMugshotHandle = nil
end)
-- Listen for warning notifications from server
Luxu.listenForServerNuiEvent("warning:received")
-- Weather system configuration
local weatherTypes = {
  "CLEAR",
  "EXTRASUNNY",
  "CLOUDS",
  "OVERCAST",
  "RAIN",
  "CLEARING",
  "THUNDER",
  "SMOG",
  "FOGGY",
  "XMAS",
  "SNOW",
  "SNOWLIGHT",
  "BLIZZARD",
  "HALLOWEEN",
  "NEUTRAL",
  "RAIN_HALLOWEEN",
  "SNOW_HALLOWEEN"
}
-- Build weather lookup tables
local weatherHashLookup = {}
local weatherOptions = {}

-- Create hash lookup and options for NUI
for _, weatherType in ipairs(weatherTypes) do
  local weatherHash = joaat(weatherType)
  weatherHashLookup[weatherHash] = weatherType
  
  table.insert(weatherOptions, {
    value = weatherType,
    label = weatherType:lower()
  })
end
-- Get weather options for NUI
RegisterNuiCallback("weather:getOptions", function(data, callback)
  callback(weatherOptions)
end)
-- Weather and time update interval (every second)
Luxu.setInterval(function()
  local currentHour = GetClockHours()
  local currentMinute = GetClockMinutes()
  local currentWeatherHash, nextWeatherHash, transitionProgress = GetWeatherTypeTransition()
  
  -- Send weather update to NUI
  FetchNui("weather:update", {
    hour = currentHour,
    minute = currentMinute,
    currentWeather = weatherHashLookup[currentWeatherHash],
    nextWeather = weatherHashLookup[nextWeatherHash],
    transitionCompletedPercentage = math.floor(transitionProgress * 100),
    rainLevel = math.floor(GetRainLevel() * 100)
  })
end, 1000)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
