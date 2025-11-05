--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()

    -- Register Usable Items for ESX
    for itemType, _ in pairs(Config) do
        ESX.RegisterUsableItem(itemType, function(source)
            TriggerClientEvent('clothesitems:' .. string.lower(itemType), source)
        end)
    end
end

if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()

    -- Register Usable Items for QBCore
    for itemType, _ in pairs(Config) do
        QBCore.Functions.CreateUseableItem(itemType, function(source)
            TriggerClientEvent('clothesitems:' .. string.lower(itemType), source)
        end)
    end
end

if Config.RefreshSkin.UseItem then
    if Config.Framework == 'esx' then
        ESX = exports["es_extended"]:getSharedObject()

        ESX.RegisterUsableItem('refreshskin', function(source)
            TriggerClientEvent('clothesitems:refreshskin', source)
        end)
    end

    if Config.Framework == 'qbcore' then
        QBCore = exports['qb-core']:GetCoreObject()

        QBCore.Functions.CreateUseableItem('refreshskin', function(source)
            TriggerClientEvent('clothesitems:refreshskin', source)
        end)
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
