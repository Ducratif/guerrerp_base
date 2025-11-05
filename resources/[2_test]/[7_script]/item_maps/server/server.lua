--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local Framework = "esx" -- Options: "esx", "qbcore", "standalone"

-- Initialize framework based on config
if Framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == "qbcore" then
    QBCore = exports['qb-core']:GetCoreObject()
end


-- Utility function to check player inventory for item
local function checkPlayerItem(itemName)
    local playerId = PlayerId()

    if Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            local item = xPlayer.getInventoryItem(itemName)
            return item and item.count > 0
        end

    elseif Framework == "qbcore" then
        local player = QBCore.Functions.GetPlayer(playerId)
        if player then
            local item = player.Functions.GetItemByName(itemName)
            return item ~= nil and item.amount > 0
        end

    elseif Framework == "standalone" then
        -- Standalone implementation: Replace with custom inventory logic
        print("[Standalone Mode] Logique d'inventaire personnalisée nécessaire pour l'article: " .. itemName)
        return false -- Default for standalone; must customize
    end

    return false
end

-- Event to check if player has a specific item
--RegisterNetEvent('checkPlayerMap')
--AddEventHandler('checkPlayerMap', function()
--    local hasItem = checkPlayerItem('map') -- Replace 'map' with your desired item name
--    if hasItem then
--        print("Le joueur a une carte.")
--    else
--        print("Le joueur n'a pas de carte.")
--    end
--end)

if Framework == "esx" then
    ESX.RegisterUsableItem("map", function(source)
        TriggerClientEvent("kurlie_untility:map", source)
    end)
elseif Framework == "qbcore" then
    QBCore.Functions.CreateUseableItem("map", function(source, item)
        TriggerClientEvent("kurlie_untility:map", source)
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
