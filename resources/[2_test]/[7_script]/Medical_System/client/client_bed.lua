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

local Beds = {}
local PlayerCoords = GetEntityCoords(PlayerPedId())
local inRangeofBed = false
local isInUse = false
local playersLastCoords = 0
local Anim = 'sit'
local AnimIndex = 0
local LayDownIndex = 1
local LayStomachIndex = 1
local SitBedIndex = 1


CreateThread(function()
    while true do
        PlayerCoords = GetEntityCoords(PlayerPedId()) 
        Wait(1000) 
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000

        if inRangeofBed and Beds.Bed ~= 0 then
            local player = PlayerPedId()
            local modelCoords = Beds.BedCoords
            local distanceDiff = #(modelCoords - PlayerCoords)

            if distanceDiff < 2.0 and not isInUse then
                sleep = 0 

                if Beds.BedIsBed then
                    if IsControlJustPressed(0, 175) and AnimIndex < 2 then 
                        AnimIndex = AnimIndex + 1
                    elseif IsControlJustPressed(0, 174) and AnimIndex > 0 then 
                        AnimIndex = AnimIndex - 1
                    end

                    if AnimIndex == 2 then Anim = "stomach"
                    elseif AnimIndex == 1 then Anim = "back"
                    elseif AnimIndex == 0 then Anim = "sit" end

                    if Anim == "sit" then
                        DrawText3Ds(modelCoords.x, modelCoords.y, modelCoords.z, Config.Text.SitOnBed .. ' | ' .. Config.Text.SwitchBetween)
                    else
                        DrawText3Ds(modelCoords.x, modelCoords.y, modelCoords.z, Config.Text.LayOnBed .. ' ~g~' .. Anim .. '~w~ | ' .. Config.Text.SwitchBetween)
                    end

                    if IsControlJustPressed(0, Config.MedBed.KeyToUse) then
                        TriggerServerEvent('UseBed', Beds, Beds.BedCoords)
                    end
                end
            end


            if isInUse then
                sleep = 0
                DrawText3Ds(modelCoords.x, modelCoords.y, modelCoords.z, Config.Text.ExitBed)
                if IsControlJustPressed(0, Config.MedBed.KeyToLeave) then
                    isInUse = false
                    TriggerServerEvent('ExitBed', Beds.BedCoords)
                    ClearPedTasksImmediately(player)
                    FreezeEntityPosition(player, false)

                    local x, y, z = table.unpack(playersLastCoords)
                    if GetDistanceBetweenCoords(x, y, z, PlayerCoords, true) < 10 then
                        SetEntityCoords(player, x, y, z)
                    end
                end
            end
        end

        Wait(sleep) 
    end
end)

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local foundBed = false

        for _, object in ipairs(Config.MedBed.Beds) do
            local closestmodel = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 3.0, GetHashKey(object.model), false, false, false)
            
            if closestmodel ~= 0 then
                local coordsmodel = GetEntityCoords(closestmodel)
                local distanceDiff = #(coordsmodel - playerCoords)

                if distanceDiff < 3.0 then
                    if distanceDiff < 2.0 then
                        Beds = {
                            Bed = closestmodel,
                            BedCoords = coordsmodel,
                            BedcX = object.offsetx,
                            BedcY = object.offsety,
                            BedcZ = object.offsetz,
                            BedDir = object.heading,
                            BedIsBed = object.bed
                        }
                        foundBed = true
                    end
                    break
                end
            end
        end

        inRangeofBed = foundBed
        Wait(2000)
    end
end)

local notified = false -- Flag to track notification status

CreateThread(function()
    local player = PlayerPedId()
    while Config.HealingPerSecond > 0 do
        if isInUse and Beds.BedIsBed then
            if Config.Framework == "esx" then
                ESX.TriggerServerCallback('Checkin:EmsOnline', function(EMSOnline)
                    if not EMSOnline then
                        local health = GetEntityHealth(player)
                        if health <= 199 then
                            SetEntityHealth(player, health + Config.HealingAmount)
                        end
                        notified = false -- Reset notification flag if healing is allowed
                    elseif not notified then
                        exports["esx_notify"]:Notify("info", 5000, "Vous ne pouvez pas soigner pendant que les services médicaux d'urgence sont en service.")
                        notified = true -- Set flag to prevent spamming
                    end
                end)
            else
                QBCore.Functions.TriggerCallback('Checkin:EmsOnline', function(EMSOnline)
                    if not EMSOnline then
                        local health = GetEntityHealth(player)
                        if health <= 199 then
                            SetEntityHealth(player, health + Config.HealingAmount)
                        end
                        notified = false -- Reset notification flag if healing is allowed
                    elseif not notified then
                        QBCore.Functions.Notify("Vous ne pouvez pas soigner pendant que les services médicaux d'urgence sont en service.", "error", 5000)
                        notified = true -- Set flag to prevent spamming
                    end
                end)
            end
        else
            notified = false -- Reset flag when leaving the bed
        end
        Wait(Config.HealingPerSecond * 1000)
    end
end)


local LayDownIndex = 1
local LayStomachIndex = 1
local SitBedIndex = 1

RegisterNetEvent('BedAnimation')
AddEventHandler('BedAnimation', function(v, coords)
    local model = v.Bed
    local vertx = v.BedcX
    local verty = v.BedcY
    local vertz = v.BedcZ
    local dir = v.BedDir
    local isBed = v.BedIsBed
    local modelcoords = coords
    
    local ped = PlayerPedId()
    playersLastCoords = GetEntityCoords(ped)
    FreezeEntityPosition(model, true)
    FreezeEntityPosition(ped, true)
    isInUse = true

    if isBed then
        SetEntityCoords(ped, modelcoords.x, modelcoords.y, modelcoords.z + 0.5)
        SetEntityHeading(ped, GetEntityHeading(model) - 180.0)

        if Anim == 'back' then
            local animData = Config.MedBed.LayDownAnims[LayDownIndex]
            if animData.dict then
                Animation(animData.dict, animData.anim, ped)
            else
                TaskStartScenarioAtPosition(ped, animData.anim, modelcoords.x + vertx, modelcoords.y + verty, modelcoords.z - vertz, GetEntityHeading(model) + dir, 0, true, true)
            end
        elseif Anim == 'stomach' then
            local animData = Config.MedBed.LayStomachAnims[LayStomachIndex]
            if animData.dict then
                Animation(animData.dict, animData.anim, ped)
            else
                TaskStartScenarioAtPosition(ped, animData.anim, modelcoords.x + vertx, modelcoords.y + verty, modelcoords.z - vertz, GetEntityHeading(model) + dir, 0, true, true)
            end
        elseif Anim == 'sit' then
            local animData = Config.MedBed.SitBedAnims[SitBedIndex]
            if animData.dict then
                Animation(animData.dict, animData.anim, ped)
            else
                TaskStartScenarioAtPosition(ped, animData.anim, modelcoords.x + vertx, modelcoords.y + verty, modelcoords.z - vertz, GetEntityHeading(model) + 180.0, 0, true, true)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if isInUse then
            if IsControlJustPressed(0, 173) then 
                if Anim == 'back' then
                    LayDownIndex = LayDownIndex % #Config.MedBed.LayDownAnims + 1
                elseif Anim == 'stomach' then
                    LayStomachIndex = LayStomachIndex % #Config.MedBed.LayStomachAnims + 1
                elseif Anim == 'sit' then
                    SitBedIndex = SitBedIndex % #Config.MedBed.SitBedAnims + 1
                end
                TriggerEvent('BedAnimation', Beds, Beds.BedCoords) 
            end
        end
    end
end)

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 350
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
end

function Animation(dict, anim, ped)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
