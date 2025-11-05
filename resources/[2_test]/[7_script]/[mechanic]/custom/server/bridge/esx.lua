--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.locale()
local esx = GetResourceState('es_extended'):find('start')
if not esx then return end

local ESX = exports.es_extended:getSharedObject()

--- @param amount number
lib.callback.register('ledjo_tuning:hasMoney', function(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    local hasMoney = false
    if SVConfig.EnableESXSocietyPayment == true then
        local job = xPlayer.job.name
        local societyName = ("society_%s"):format(job)
        TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
            if account.money >= amount then
                hasMoney = true
            end
        end)
    else
        local cash = xPlayer.getAccount("money")
        local bank = xPlayer.getAccount("bank")
        if cash.money >= amount then
            hasMoney = true
        elseif bank >= amount then
            hasMoney = true
        end
    end

    return hasMoney
end)

--- @param amount number
RegisterNetEvent("ledjo_tuning:payMods", function(amount, properties)
    local xPlayer = ESX.GetPlayerFromId(source)

    if SVConfig.EnableESXSocietyPayment == true then
        local job = xPlayer.job.name
        local societyName = ("society_%s"):format(job)
        TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
            if account.money >= amount then
                account.removeMoney(amount)
                TriggerClientEvent('esx:showNotification', xPlayer.source, locale("L'argent a était retirer sur le compte Entrepise", amount), "success", 6000)
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source, locale("Pas Assez D'argents sur le compte Entreprise"), "error", 6000)
                return
            end
        end)
    else
        local cash = xPlayer.getAccount("money")
        local bank = xPlayer.getAccount("bank")
        if cash.money >= amount then
            xPlayer.removeAccountMoney("money", amount)
            TriggerClientEvent('esx:showNotification', xPlayer.source, locale("Payement en espece avec succes", amount), "success", 6000)
        elseif bank >= amount then
            xPlayer.removeAccountMoney("bank", amount)
            TriggerClientEvent('esx:showNotification', xPlayer.source, locale("Payement en banque avec succes", amount), "success", 6000)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, locale("Pas assez D'argent", amount), "error", 6000)
            return
        end
    end

    local properties = properties
    local isVehicleOwned = MySQL.prepare.await('SELECT plate FROM owned_vehicles WHERE plate = ?', { properties.plate })

    if isVehicleOwned then
        MySQL.update('UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?',
            { json.encode(properties), properties.plate })
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
