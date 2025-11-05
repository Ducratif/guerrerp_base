--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.Framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
end

local EMSConnected = 0

function CountEMS()
    EMSConnected = 0
    if Config.Framework == "esx" then
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer and xPlayer.job and xPlayer.job.name == 'ambulance' then
                EMSConnected = EMSConnected + 1
            end
        end
    else
        local players = QBCore.Functions.GetPlayers()
        for _, playerId in ipairs(players) do
            local Player = QBCore.Functions.GetPlayer(playerId)
            if Player and Player.PlayerData.job.name == "ambulance" then
                EMSConnected = EMSConnected + 1
            end
        end
    end
    SetTimeout(5 * 1000, CountEMS) 
end

CountEMS()

if Config.Framework == "esx" then
    ESX.RegisterServerCallback('Checkin:EmsOnline', function(source, cb)
        cb(EMSConnected > Config.EMSCheck)
    end)
else
    QBCore.Functions.CreateCallback('Checkin:EmsOnline', function(source, cb)
        cb(EMSConnected > Config.EMSCheck)
    end)
end

RegisterServerEvent('Checkin:PatientBill')
AddEventHandler('Checkin:PatientBill', function(_, playerDeath)
    local _source = source
    local montant = 10000  -- 💰 Nouveau montant fixe

    if playerDeath == false then
        montant = montant / 2  -- moitié si pas mort
    end

    if Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() >= montant then
            xPlayer.removeMoney(montant)
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
                account.addMoney(montant)
            end)
            xPlayer.showNotification("On vous a facturé ~g~$"..montant.." pour ~y~services médicaux.")
        elseif xPlayer.getAccount('bank').money >= montant then
            xPlayer.removeAccountMoney('bank', montant)
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
                account.addMoney(montant)
            end)
            xPlayer.showNotification("On vous a facturé ~g~$"..montant.."p our ~y~services médicaux.")
        end

    else
        local Player = QBCore.Functions.GetPlayer(_source)
        if playerDeath == false then
            montant = montant / 2
        end
        if Player.Functions.RemoveMoney("cash", montant) then
            TriggerEvent('qb-banking:server:DepositMoney', "ambulance", montant)
            TriggerClientEvent("QBCore:Notify", _source, "On vous a facturé $"..montant.." pour des services médicaux", "success")
        elseif Player.Functions.RemoveMoney("bank", montant) then
            TriggerEvent('qb-banking:server:DepositMoney', "ambulance", montant)
            TriggerClientEvent("QBCore:Notify", _source, "On vous a facturé $"..montant.." pour des services médicaux", "success")
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
