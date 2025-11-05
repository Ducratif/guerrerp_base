--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local territories = {}

-- Fonction pour charger les territoires depuis la base de données et les afficher sur la carte
function LoadTerritories()
    MySQL.Async.fetchAll("SELECT * FROM territories", {}, function(result)
        territories = result
        print("Territoires chargés au démarrage:", json.encode(territories))  -- DEBUG
        TriggerClientEvent("ducratif_territoire:updateMap", -1, territories) -- Envoi des territoires aux clients
    end)
end

-- Charger les territoires au démarrage du serveur
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        LoadTerritories()  -- Charger les territoires depuis la base de données
    end
end)

-- Export pour récupérer les territoires depuis un autre script
exports("GetTerritories", function()
    return territories
end)

-- Événement pour envoyer les territoires aux clients lorsqu'ils se connectent
RegisterNetEvent("ducratif_territoire:requestTerritories")
AddEventHandler("ducratif_territoire:requestTerritories", function()
    local src = source
    TriggerClientEvent("ducratif_territoire:updateMap", src, territories)
end)

-- Envoyer automatiquement les territoires quand un joueur rejoint
AddEventHandler("playerJoining", function()
    TriggerClientEvent("ducratif_territoire:updateMap", source, territories)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
