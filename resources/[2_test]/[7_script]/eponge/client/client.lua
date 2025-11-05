--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local prop = nil

local function getNearestVehicle()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
    return vehicle
end

local function attachProp()
    local ped = PlayerPedId()
    local model = `prop_sponge_01`
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
    
    prop = CreateObject(model, 0.0, 0.0, 0.0, true, true, true)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 28422),
        0.00, -- Forward/Backward
        0.02, -- Left/Right
        -0.03, -- Up/Down
        -75.0, -- Pitch
        180.0, -- Roll
        -180.0, -- Yaw
        true, true, false, true, 1, true)
end

local function removeProp()
    if prop then
        DeleteEntity(prop)
        prop = nil
    end
end

local function cleanVehicle()
    local vehicle = getNearestVehicle()
    if vehicle ~= 0 then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        attachProp()
        
        RequestAnimDict('timetable@floyd@clean_kitchen@base')
        while not HasAnimDictLoaded('timetable@floyd@clean_kitchen@base') do
            Wait(100)
        end

        TaskPlayAnim(ped, 'timetable@floyd@clean_kitchen@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
        
        if lib.progressBar({
            duration = 5000,
            label = 'Nettoyage du véhicule...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
            },
        }) then
            SetVehicleDirtLevel(vehicle, 0.0)
            TriggerServerEvent('sponge:updateDurability')
        end
        
        removeProp()
        ClearPedTasks(ped)
    else
        lib.notify({
            title = 'Error',
            description = 'Aucun véhicule à proximité',
            type = 'error'
        })
    end
end

RegisterNetEvent('sponge:use')
AddEventHandler('sponge:use', function()
    cleanVehicle()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    removeProp()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
