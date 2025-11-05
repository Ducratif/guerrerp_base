--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()
Config = Config or {}

-- Récupère les zones de la base de données
lib.callback.register('stimulants:getZones', function()
    local result = MySQL.query.await('SELECT x, y, z, radius as radius FROM territories')
    return result
end)


-- Enregistre les items comme utilisables via ox_inventory
for itemName, _ in pairs(Config.Stimulants) do
    -- Ajouter un événement pour chaque item
    RegisterServerEvent('ox_inventory:useItem')
    AddEventHandler('ox_inventory:useItem', function(itemName)
        local xPlayer = ESX.GetPlayerFromId(source)  -- Récupère l'instance du joueur
        if not xPlayer then
            --print("Erreur : joueur non trouvé")
            return
        end

        -- Vérifier si le joueur possède l'item
        local item = xPlayer.getInventoryItem(itemName)
        if not item then
            print("Erreur : l'item n'existe pas dans l'inventaire du joueur.")
            return
        end

        -- Vérifie si le joueur possède l'item
        if item.count < 1 then
            --print(("Le joueur %s ne possède pas cet item."):format(source))
            return
        end

        ---- Supprimer l'item de l'inventaire
        --xPlayer.removeInventoryItem(itemName, 1)
        --print(("Item %s retiré de l'inventaire du joueur %s"):format(itemName, source))  -- Débogage

        -- Envoyer l'événement au client pour appliquer l'effet
        TriggerClientEvent('stimulants:useItem', source, itemName)
    end)
end


RegisterServerEvent('stimulants:removeItem')
AddEventHandler('stimulants:removeItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.removeInventoryItem(itemName, 1)
        --print(("Item %s retiré de l'inventaire du joueur %s"):format(itemName, source))  -- Débogage
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
