--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local QBCore = nil
local ESX = nil

if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
end

RegisterNetEvent('phone_rues:callService')
AddEventHandler('phone_rues:callService', function(service, message)
    local playerCoords = nil

    if Config.Framework == 'qbcore' then
        local player = QBCore.Functions.GetPlayer(source)
        playerCoords = player.PlayerData.coords

        for _, xTargetPlayerId in ipairs(QBCore.Functions.GetPlayers()) do
            local targetPlayer = QBCore.Functions.GetPlayer(xTargetPlayerId)

            if targetPlayer and targetPlayer.PlayerData.job.name == service then
                exports['pv-pager']:SendPagerNotification(service, message) -- Change to your notification system
                TriggerClientEvent('phone_rues:showLocationOnMap', targetPlayer.PlayerData.source, playerCoords)
            end
        end

    elseif Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        playerCoords = xPlayer.getCoords(true)

        for _, xTargetPlayer in ipairs(ESX.GetExtendedPlayers()) do
            if xTargetPlayer.job.name == service then
                exports['pv-pager']:SendPagerNotification(service, message) -- Change to your notification system
                TriggerClientEvent('phone_rues:showLocationOnMap', xTargetPlayer.source, playerCoords)
            end
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
