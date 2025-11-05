--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Admin Actions Module
-- Handles various admin actions and callbacks

local registerCallback, vehicleCache, isHandcuffed, handcuffObject, handcuffModel, handcuffThread, toggleHandcuffs, refreshESXVehicles, openClothingMenu

-- Register a NUI callback with optional server event
function registerCallback(callbackName, callbackFunction, serverEventFunction)
    RegisterNuiCallback(callbackName, function(data, cb)
        local result = Luxu.callbackSync(callbackName, false, data)
        if not result then
            cb(false)
            return
        end
        
        if type(callbackFunction) == "function" then
            local success = pcall(callbackFunction, result, cb, data)
            if not success then
                cb(false)
            end
        else
            cb(result)
        end
    end)
    
    if serverEventFunction then
        Luxu.registerNetEventStrict(callbackName, serverEventFunction)
    end
end
-- Vehicle cache with metatable for dynamic vehicle info loading
vehicleCache = setmetatable({}, {
    __index = function(self, modelHash)
        local displayName = GetDisplayNameFromVehicleModel(modelHash)
        local labelText = GetLabelText(displayName)
        
        local vehicleInfo = {
            name = displayName:lower(),
            label = labelText
        }
        
        self[modelHash] = vehicleInfo
        return vehicleInfo
    end
})
-- Refresh ESX vehicles cache
function refreshESXVehicles()
    if Framework.name ~= "esx" then
        return
    end
    
    Luxu.callbackAsync("getESXVehicles", false, function(vehicles)
        if not vehicles then
            return
        end
        
        for modelHash, vehicleData in pairs(vehicles) do
            vehicleCache[modelHash] = {
                name = vehicleData.model,
                label = vehicleData.label
            }
        end
    end)
end
RefreshESXVehicles = refreshESXVehicles
-- Handcuff system variables
isHandcuffed = false
handcuffObject = 0
handcuffModel = -1521520664  -- prop_zip_tie_001
-- Handcuff animation thread
function handcuffThread()
    while isHandcuffed do
        local playerPed = PlayerPedId()
        
        -- Only play animation if not ragdoll or getting up
        if not IsPedRagdoll(playerPed) and not IsPedGettingUp(playerPed) then
            if not IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) then
                TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0.0, false, false, false)
            end
        end
        
        -- Disable player actions while handcuffed
        DisablePlayerFiring(Luxu.cache.playerId, true)
        DisableControlAction(0, 140, true)  -- Disable melee attacks
        
        Wait(0)
    end
    
    -- Cleanup when handcuffs are removed
    RemoveAnimDict("mp_arresting")
    StopAnimTask(PlayerPedId(), "mp_arresting", "idle", 2.0)
end
-- Toggle handcuffs on/off
function toggleHandcuffs(enable)
    local playerPed = Luxu.cache.ped
    
    if enable then
        if not isHandcuffed then
            -- Enable handcuff restrictions
            SetEnableHandcuffs(playerPed, true)
            SetEnableBoundAnkles(playerPed, true)
            
            -- Load and create handcuff prop
            RequestModel(handcuffModel)
            while not HasModelLoaded(handcuffModel) do
                Wait(0)
            end
            
            local playerCoords = GetEntityCoords(playerPed)
            handcuffObject = CreateObject(handcuffModel, playerCoords.x, playerCoords.y, playerCoords.z, true, true, false)
            SetModelAsNoLongerNeeded(handcuffModel)
            
            -- Attach handcuffs to player's hands
            local attachOffset = vector3(0.0, 0.065, -0.011)
            local attachRotation = vector3(60, 0.0, 70)
            local boneIndex = GetPedBoneIndex(playerPed, 57005)  -- SKEL_R_Hand
            
            AttachEntityToEntity(
                handcuffObject, playerPed, boneIndex,
                attachOffset.x, attachOffset.y, attachOffset.z,
                attachRotation.x, attachRotation.y, attachRotation.z,
                false, true, false, true, 2, true
            )
            
            -- Load animation dictionary
            RequestAnimDict("mp_arresting")
            while not HasAnimDictLoaded("mp_arresting") do
                Wait(0)
            end
            
            isHandcuffed = true
            Luxu.setInterval(handcuffThread)
        end
    elseif not enable then
        if isHandcuffed then
            -- Remove handcuff object
            if DoesEntityExist(handcuffObject) then
                DeleteObject(handcuffObject)
            end
            
            -- Disable handcuff restrictions
            SetEnableBoundAnkles(playerPed, false)
            SetEnableHandcuffs(playerPed, false)
            
            isHandcuffed = false
        end
    end
end
ToggleHandcuffs = toggleHandcuffs
-- Register basic admin action callbacks
registerCallback("actions:get_logs")
registerCallback("actions:update_vehicle_plate")
registerCallback("actions:send_to_garage")
registerCallback("actions:remove_vehicle")
registerCallback("actions:kick")
registerCallback("actions:multi_kick")
registerCallback("actions:warn")
registerCallback("actions:multi_warn")
registerCallback("actions:warn_remove")
registerCallback("actions:ban")
registerCallback("actions:ban_offline")
registerCallback("actions:multi_ban")
registerCallback("actions:unban")
registerCallback("actions:jail")
registerCallback("actions:unjail")
registerCallback("actions:add_note")
registerCallback("actions:delete_note")
registerCallback("actions:get_notes")
registerCallback("actions:update_job")
registerCallback("actions:routing_bucket")
registerCallback("actions:delete_character")
-- Player control system
local function handlePlayerControl(serverId, cb)
    cb(true)
    if not serverId then
        return
    end
    
    local targetPlayer = GetPlayerFromServerId(serverId)
    repeat
        Wait(0)
    until targetPlayer
    
    local targetPed = GetPlayerPed(targetPlayer)
    ClonePedToTarget(targetPed, PlayerPedId())
end

local function startSpectating(serverId)
    CreateThread(function()
        local targetPed = nil
        local lastCoords = nil
        
        Wait(1250)
        
        local targetPlayer = GetPlayerFromServerId(serverId)
        targetPed = GetPlayerPed(targetPlayer)
        
        -- Enter spectator mode
        NetworkSetInSpectatorMode(true, targetPed)
        NetworkSetInSpectatorModeExtended(true, targetPed, true)
        SetMinimapInSpectatorMode(true, targetPed)
        
        -- Spectator loop
        while LocalPlayer.state.luxu_admin_is_controlled do
            local player = GetPlayerFromServerId(serverId)
            if not player then
                return
            end
            
            local playerPed = PlayerPedId()
            SetEntityVisible(playerPed, false, false)
            lastCoords = GetEntityCoords(targetPed)
            
            Wait(300)
        end
        
        -- Exit spectator mode
        local playerPed = PlayerPedId()
        SetEntityVisible(playerPed, true, false)
        NetworkSetInSpectatorMode(false, nil)
        NetworkSetInSpectatorModeExtended(false, nil, false)
        SetMinimapInSpectatorMode(false, nil)
        SetEntityVisible(playerPed, true, false)
        ResetEntityAlpha(playerPed)
        
        if lastCoords then
            SetEntityCoords(playerPed, lastCoords.x, lastCoords.y, lastCoords.z, false, false, false, false)
        end
    end)
end

registerCallback("actions:control", handlePlayerControl, startSpectating)
-- Announcement system
local function handleAnnouncement(data)
    FetchNui("announcment:received", data)
end

registerCallback("actions:announcment", nil, handleAnnouncement)
registerCallback("actions:freeze")
registerCallback("actions:multi_freeze")

-- Clothing menu handler
local function handleOpenClothingMenu(result, cb, data)
    if data.target == Luxu.cache.serverId then
        Visibility.hideMenu()
    end
    cb(true)
end

registerCallback("actions:open_clothing_menu", handleOpenClothingMenu)
registerCallback("actions:open_inventory")
registerCallback("actions:get_players_with_item")
registerCallback("actions:give_item")
registerCallback("actions:remove_item")
registerCallback("actions:change_ped_model")

-- Reset ped model handler
local function resetPedModel(data)
    Luxu.clothing.loadPlayerSkin()
end

registerCallback("actions:reset_ped_model", nil, resetPedModel)
registerCallback("actions:give_food_and_water")
registerCallback("actions:update_time")
registerCallback("actions:update_weather")
registerCallback("actions:copy_coords")
registerCallback("actions:multi_message")

-- Message system handler
local function handleSendMessage(data)
    FetchNui("message_received", data)
end

registerCallback("actions:send_message", nil, handleSendMessage)
-- Money and job management
registerCallback("actions:update_money_account")
registerCallback("actions:get_jobs")

-- Teleportation actions
registerCallback("actions:teleport_to_player")
registerCallback("actions:teleport_bring_player")
registerCallback("actions:teleport_to_coords")
registerCallback("actions:teleport_last_location")
registerCallback("actions:teleport_to_player_vehicle")
registerCallback("actions:teleport_seat_in_our_vehicle")
registerCallback("actions:multi_teleport_bring_player")
registerCallback("actions:multi_teleport_to_coords")
registerCallback("actions:multi_teleport_last_location")

-- Vehicle key management
registerCallback("actions:give_vehicle_key")
-- Give vehicle key from nearest vehicle
RegisterNuiCallback("actions:give_vehicle_key_from_nearest_vehicle", function(data, cb)
    local nearestVehicle, distance = Luxu.getNearestVehicle(Luxu.cache.coords, 5.0, true)
    
    if not nearestVehicle then
        cb(false)
        return
    end
    
    local plate = GetVehicleNumberPlateText(nearestVehicle)
    local result = Luxu.callbackSync("actions:give_vehicle_key", false, {
        target = Luxu.cache.serverId,
        plate = plate
    })
    
    cb(result)
end)
registerCallback("actions:remove_vehicle")

-- Vehicle spawning system
local function spawnVehicle(data)
    local vehicleId = data.id
    local coords = Luxu.cache.coords
    
    -- Request and create vehicle
    local modelHash = Luxu.requestModel(data.model)
    local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, coords.w, true, true)
    
    -- Wait for vehicle to exist
    repeat
        Wait(0)
    until DoesEntityExist(vehicle)
    
    -- Delete current vehicle if player is in one
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
    end
    
    -- Put player in vehicle
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    -- Configure vehicle settings
    SetVehicleRadioEnabled(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true, false)
    SetVehicleUndriveable(vehicle, false)
    
    -- Repair and maintain vehicle
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehicleTyreFixed(vehicle, 0)
    SetVehicleOilLevel(vehicle, 100.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    Luxu.fuel.setFuel(vehicle, 100.0)
    
    -- Notify server about spawned vehicle
    local plate = GetVehicleNumberPlateText(vehicle)
    Luxu.triggerServerEvent("vehicle_spawned", {
        plate = plate,
        model = modelHash,
        id = vehicleId
    })
end

registerCallback("actions:spawn_vehicle", nil, spawnVehicle)
-- Fix current vehicle
local function fixVehicle()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then
        return
    end
    
    -- Fix vehicle components
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleOilLevel(vehicle, 100.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehicleFuelLevel(vehicle, 100.0)
    Luxu.fuel.setFuel(vehicle, 100.0)
    
    -- Fix all tires
    for i = 0, 7 do
        SetVehicleTyreFixed(vehicle, i)
    end
end

registerCallback("actions:fix_vehicle", nil, fixVehicle)
-- Delete vehicles in radius
local function deleteVehicle(data)
    local radius = data.radius
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    if radius == 0 then
        -- Delete nearest vehicle only
        local nearestVehicle, distance = Luxu.getNearestVehicle(playerCoords, nil, true)
        if not nearestVehicle then
            Luxu.notify(Locales.error, Locales.no_vehicle_nearby, 4000, "error")
            return
        end
        
        if not NetworkGetEntityIsNetworked(nearestVehicle) then
            SetEntityAsMissionEntity(nearestVehicle, true, true)
            DeleteEntity(nearestVehicle)
            return
        else
            TriggerServerEvent(data.eventName, {VehToNet(nearestVehicle)})
            return
        end
    end
    
    -- Delete vehicles in radius
    local nearbyVehicles = Luxu.getNearbyVehicles(playerCoords, radius, true)
    local networkedVehicles = {}
    
    for _, vehicleData in ipairs(nearbyVehicles) do
        if NetworkGetEntityIsNetworked(vehicleData.vehicle) then
            table.insert(networkedVehicles, VehToNet(vehicleData.vehicle))
        else
            SetEntityAsMissionEntity(vehicleData.vehicle, true, true)
            DeleteEntity(vehicleData.vehicle)
        end
    end
    
    if #networkedVehicles > 0 then
        TriggerServerEvent(data.eventName, networkedVehicles)
    end
end

registerCallback("actions:delete_vehicle", nil, deleteVehicle)
-- Repair target player's vehicle
local function repairVehicle(data)
    local targetPed = GetPlayerPed(data.target)
    local vehicle = GetVehiclePedIsIn(targetPed, false)
    
    if not vehicle then
        return
    end
    
    -- Fix vehicle components
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleFuelLevel(vehicle, 100.0)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true, false)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleOilLevel(vehicle, 100.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehicleTyreFixed(vehicle, 0)
    Luxu.fuel.setFuel(vehicle, 100.0)
    
    -- Fix all tires
    for i = 0, 7 do
        SetVehicleTyreFixed(vehicle, i)
    end
end

registerCallback("actions:repair_vehicle", nil, repairVehicle)
-- Admin toggle functions
local function handleNoclip(data)
    ToggleNoclip(data)
end

local function handleShowCoords(data)
    ToggleShowCoords(data)
end

registerCallback("actions:noclip", nil, handleNoclip)
registerCallback("actions:show_coords", nil, handleShowCoords)
registerCallback("actions:show_sprite")

-- God mode toggle
local function handleGodMode(data)
    ToggleGodMode(data)
end

registerCallback("actions:godmode", nil, handleGodMode)
-- Invisibility toggle
local function handleInvisibility(data)
    ToggleInvisibility(data)
end

registerCallback("actions:invisibility", nil, handleInvisibility)
-- Entity inspector toggle
local function handleEntityInspector(data)
    ToggleEntityInspector(data)
end

registerCallback("actions:entity_inspector", nil, handleEntityInspector)
-- Player names toggle
local function handlePlayerNames(data)
    TogglePlayerNames(data)
end

registerCallback("actions:player_names", nil, handlePlayerNames)
-- Head light toggle
local function handleHeadLight(data)
    ToggleHeadLight(data)
end

registerCallback("actions:head_light", nil, handleHeadLight)
-- Thermal vision toggle
local function handleThermalVision(data)
    ToggleThermalVision(data)
end

registerCallback("actions:thermal_vision", nil, handleThermalVision)
-- Night vision toggle
local function handleNightVision(data)
    ToggleNightVision(data)
end

registerCallback("actions:night_vision", nil, handleNightVision)
-- Infinite ammo toggle
local function handleInfiniteAmmo(data)
    ToggleInfiniteAmmo(data)
end

registerCallback("actions:infinite_ammo", nil, handleInfiniteAmmo)
-- Super jump toggle
local function handleSuperJump(data)
    ToggleSuperJump(data)
end

registerCallback("actions:super_jump", nil, handleSuperJump)
registerCallback("actions:multi_revive")

-- Revive closest player
local function handleRevive()
    local playerPed = Luxu.cache.ped
    local playerCoords = GetEntityCoords(playerPed)
    local closestPlayer = GetClosestPlayer(playerCoords.x, playerCoords.y, playerCoords.z, 3.0)
    
    if closestPlayer == -1 then
        return
    end
    
    local targetPed = GetPlayerPed(closestPlayer)
    local targetServerId = GetPlayerServerId(closestPlayer)
    
    if IsEntityDead(targetPed) then
        TriggerServerEvent("luxu_admin:revive", targetServerId)
    end
end

registerCallback("actions:revive", nil, handleRevive)

-- Self heal function
local function handleSelfHeal(data)
    local playerPed = Luxu.cache.ped
    
    -- Resurrect if dead
    ResurrectPed(playerPed)
    
    -- Restore health to maximum
    local maxHealth = GetEntityMaxHealth(playerPed)
    SetEntityHealth(playerPed, maxHealth)
    
    -- Clear blood damage
    ClearPedBloodDamage(playerPed)
    
    -- Restore stamina
    RestorePlayerStamina(PlayerId(), 100.0)
end
L6_1 = L0_1
L7_1 = "actions:heal"
L8_1 = nil
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Luxu
  L1_2 = L1_2.cache
  L1_2 = L1_2.ped
  L2_2 = GetPedMaxHealth
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SetEntityHealth
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = ClearPedBloodDamage
  L4_2 = L1_2
  L3_2(L4_2)
  L3_2 = RestorePlayerStamina
  L4_2 = PlayerId
  L4_2 = L4_2()
  L5_2 = 100.0
  L3_2(L4_2, L5_2)
end

registerCallback("actions:heal", nil, L9_1)
registerCallback("actions:multi_kill")

-- Kill player (set health to 0)
local function handleKill(data)
    SetEntityHealth(Luxu.cache.ped, 0)
end

registerCallback("actions:kill", nil, handleKill)
-- Handcuff toggle
local function handleHandcuff(data)
    ToggleHandcuffs(data)
end

registerCallback("actions:handcuff", nil, handleHandcuff)
-- Update player ped model
local function updatePedModel(modelName)
    local modelHash
    
    -- Convert to hash if it's a string
    if type(modelName) ~= "number" or not modelName then
        modelHash = joaat(modelName)
    else
        modelHash = modelName
    end
    
    -- Validate model
    if IsModelInCdimage(modelHash) and IsModelValid(modelHash) then
        -- Request and load model
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(0)
        end
        
        -- Set player model
        SetPlayerModel(PlayerId(), modelHash)
        SetModelAsNoLongerNeeded(modelHash)
        
        -- Set default component variation for specific models
        if modelHash == -1667301416 or modelHash == 1885233650 then
            SetPedDefaultComponentVariation(PlayerPedId())
        end
    end
end

registerCallback("actions:update_ped_model", nil, updatePedModel)
-- Create explosion at player location
local function createExplosion()
    local playerCoords = GetEntityCoords(PlayerPedId())
    AddExplosion(playerCoords.x, playerCoords.y, playerCoords.z, 1, 100.0, true, false, 1.0)
end

registerCallback("actions:explosion", nil, createExplosion)
-- Start fire at player location
local function startFire()
    local playerCoords = GetEntityCoords(PlayerPedId())
    StartScriptFire(playerCoords.x, playerCoords.y, playerCoords.z, 2, false)
end

registerCallback("actions:burn", nil, startFire)
-- Make player ragdoll
local function makeRagdoll()
    local playerPed = PlayerPedId()
    SetPedToRagdoll(playerPed, 1000, 1000, 0, true, true, false)
end

registerCallback("actions:ragdoll", nil, makeRagdoll)
registerCallback("actions:multi_slap")

-- Slap player with random force
local function slapPlayer()
    local forceTypes = {
        MinForce = 0,
        MaxForceRot = 1,
        MinForce2 = 2,
        MaxForceRot2 = 3,
        ForceNoRot = 4,
        ForceRotPlusForce = 5
    }
    
    local playerPed = PlayerPedId()
    local forceType = forceTypes.MaxForceRot2
    local forceVector = vector3(math.random(20), math.random(20), 10.0)
    local offsetVector = vector3(0.0, 0.0, 0.0)
    
    ApplyForceToEntity(playerPed, forceType, forceVector.x, forceVector.y, forceVector.z, 
                      offsetVector.x, offsetVector.y, offsetVector.z, 0, false, true, true, false, true)
end

registerCallback("actions:slap", nil, slapPlayer)
-- Start spectating target player
local function handleSpectate(data)
    local targetCoords = vector3(data.coords.x, data.coords.y, data.coords.z)
    StartSpectating(data.target, targetCoords)
end

registerCallback("actions:spectate", nil, handleSpectate)
RegisterNuiCallback("actions:give_vehicle", function(data, cb)
    -- Request and load vehicle model
    local modelHash = joaat(data.model)
    Luxu.requestModel(modelHash)
    
    -- Create vehicle at player coordinates
    local coords = Luxu.cache.coords
    local vehicle = CreateVehicle(data.model, coords.x, coords.y, coords.z, coords.w, true, true)
    
    -- Wait for vehicle to exist
    repeat
        Wait(0)
    until DoesEntityExist(vehicle)
    
    -- Clean up model and set fuel
    SetModelAsNoLongerNeeded(data.model)
    Luxu.fuel.setFuel(vehicle, 100.0)
    
    cb(true)
end)
-- Get player vehicles callback
RegisterNuiCallback("actions:get_player_vehicles", function(data, cb)
    local vehicleData = Luxu.callbackSync("actions:get_player_vehicles", false, data)
    
    if not vehicleData then
        cb(false)
        return
    end
    
    -- Add vehicle name and label information
    for _, vehicle in ipairs(vehicleData) do
        local vehicleInfo = vehicleCache[vehicle.model]
        if vehicleInfo then
            vehicle.name = vehicleInfo.name
            vehicle.label = vehicleInfo.label
        end
    end
    
    cb(vehicleData)
end)
-- Get player ped information callback
RegisterNuiCallback("actions:get_ped", function(data, cb)
    local player = GetPlayerFromServerId(data.serverId)
    
    if not player then
        cb(false)
        return
    end
    
    local playerPed = GetPlayerPed(player)
    local pedModel = GetEntityModel(playerPed)
    local pedInfo = PedHashes[pedModel] or false
    
    cb(pedInfo)
end)
-- Give vehicle to target player callback
RegisterNuiCallback("actions:vehicle_give", function(data, cb)
    local targetPlayer = data.target
    local modelHash
    
    -- Convert model to hash if needed
    if type(data.model) == "number" and data.model then
        modelHash = data.model
    else
        modelHash = joaat(data.model)
    end
    
    -- Validate model
    if not Luxu.isModelValid(modelHash) or not IsModelInCdimage(modelHash) then
        Luxu.notify(Locales.error, Locales.invalid_model, 4000, "error")
        cb(false)
        return
    end
    
    -- Request model and create temporary vehicle to get mods
    Luxu.requestModel(modelHash)
    local coords = Luxu.cache.coords
    local tempVehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, coords.w, false, true)
    
    -- Wait for vehicle to exist
    repeat
        Wait(0)
    until DoesEntityExist(tempVehicle)
    
    -- Clean up model
    SetModelAsNoLongerNeeded(data.model)
    
    -- Make vehicle invisible and get mods
    SetEntityVisible(tempVehicle, false, false)
    local vehicleMods = Luxu.getVehicleMods(tempVehicle)
    
    -- Delete temporary vehicle
    DeleteVehicle(tempVehicle)
    
    -- Trigger server event to give vehicle to target
    Luxu.triggerServerEvent("actions:vehicle_give", targetPlayer, modelHash, vehicleMods)
    
    cb(true)
end)
-- Resource stop handler - cleanup handcuffs
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if isHandcuffed then
            toggleHandcuffs(false)
        end
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
