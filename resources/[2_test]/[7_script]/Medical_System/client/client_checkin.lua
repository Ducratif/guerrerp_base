--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local QBCore, ESX = nil, nil

if Config.Framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
end

local PlayerData = {}
local isDead = false

Citizen.CreateThread(function()
    while (Config.Framework == "esx" and ESX.GetPlayerData().job == nil) or (Config.Framework == "qbcore" and QBCore.Functions.GetPlayerData().job == nil) do
        Citizen.Wait(10)
    end
    PlayerData = (Config.Framework == "esx" and ESX.GetPlayerData()) or QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler(Config.Framework == "esx" and 'esx:setJob' or 'QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

AddEventHandler(Config.Framework == "esx" and 'esx:onPlayerDeath' or 'hospital:client:SetDeathStatus', function(data)
    isDead = true
end)

for k, v in pairs(Config.HospitalZones) do
    exports.ox_target:addBoxZone({
        coords = vec3(v.coords.x, v.coords.y, v.coords.z), -- Ensure vector3 format
        size = vec3(1.0, 1.0, 1.0), -- Ensure proper size definition
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'checkin',
                icon = 'fas fa-hospital',
                label = 'Vous soignez (Vous coutera 5000$)',
                onSelect = function(data)
                    OpenHospitalMenu(k)
                end
            }
        }
    })
end


function OpenHospitalMenu(zone)
    local checkedIn = false
    if checkedIn == false then
        if Config.Framework == "esx" then
            ESX.TriggerServerCallback('Checkin:EmsOnline', function(EMSOnline)
                if EMSOnline then
                    exports["esx_notify"]:Notify("info", 5000, "Vous ne pouvez pas vous enregistrer pendant que les services médicaux d'urgence sont en service.")
                    return
                else
                    CheckInAtDesk()
                end
            end)
        else
            QBCore.Functions.TriggerCallback('Checkin:EmsOnline', function(EMSOnline)
                if EMSOnline then
                    QBCore.Functions.Notify("Vous ne pouvez pas vous enregistrer pendant que les services médicaux d'urgence sont en service.", "error", 5000)
                    return
                else
                    CheckInAtDesk()
                end
            end)
        end
    end
end

function CheckInAtDesk()
    if Config.Framework == "esx" then
        exports["esx_notify"]:Notify("info", 5000, "<b>Enregistré</b></br>Enregistrement à l'hôpital")
        TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(PlayerPedId()))
    else
        QBCore.Functions.Notify("Enregistré !", "success", 5000)
        TriggerEvent('hospital:client:Revive')
    end
    Wait(1000)
    TeleportPatient(isDead)
end

function TeleportPatient(playerDeath)
    local playerPed = PlayerPedId()
    for k, v in pairs(Config.HospitalZones) do
        local distance = GetDistanceBetweenCoords(GetEntityCoords(playerPed), v.coords.x, v.coords.y, v.coords.z, true)
        if distance <= 10 then
            SetEntityCoords(playerPed, v.reviveSpawn.x, v.reviveSpawn.y, v.reviveSpawn.z, 1, 1, 0, 0)
            ClearPedTasksImmediately(playerPed)
            break
        end
    end
    TriggerServerEvent('Checkin:PatientBill', Config.Bill, playerDeath)
end

local function MoveToPoint(coords)
    local playerPed = PlayerPedId()
    DoScreenFadeOut(800)
    Citizen.Wait(800)
    SetEntityCoordsNoOffset(playerPed, coords.x, coords.y, coords.z, true, true, true)
    DoScreenFadeIn(800)
end

local function OpenElevatorMenu(area, currentFloor)
    local menuOptions, floorNames = {}, {}
    for floorName in pairs(area.floors) do
        table.insert(floorNames, floorName)
    end
    table.sort(floorNames)
    local uniqueOptions = {}
    for _, floorName in ipairs(floorNames) do
        if floorName ~= currentFloor then
            uniqueOptions[floorName] = {
                title = "Passer à " .. floorName:gsub("^%l", string.upper),
                description = "Passer à " .. floorName,
                event = "move_to_floor",
                args = area.floors[floorName]
            }
        end
    end
    for _, option in pairs(uniqueOptions) do
        table.insert(menuOptions, option)
    end
    lib.registerContext({ id = 'elevator_options', title = 'Elevator', options = menuOptions })
    lib.showContext('elevator_options')
end

RegisterNetEvent('move_to_floor')
AddEventHandler('move_to_floor', function(coords)
    MoveToPoint(coords)
end)

local function getCurrentFloor()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for _, area in ipairs(Config.ElevatorAreas) do
        for floorName, floorCoords in pairs(area.floors) do
            if math.abs(playerCoords.z - floorCoords.z) < 5.0 then
                return floorName
            end
        end
    end
    return "lobby"
end

for _, area in ipairs(Config.ElevatorAreas) do
    for floorName, coords in pairs(area.floors) do
        exports['ox_target']:addSphereZone({
            coords = coords,
            radius = 1.5,
            options = {
                {
                    name = "elevator_interaction_" .. floorName,
                    label = "Use Elevator",
                    icon = "fa-solid fa-elevator",
                    onSelect = function()
                        local currentFloor = getCurrentFloor()
                        OpenElevatorMenu(area, currentFloor)
                    end
                }
            }
        })
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
