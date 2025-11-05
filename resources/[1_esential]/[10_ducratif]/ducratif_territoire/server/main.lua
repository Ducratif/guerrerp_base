--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

local territories = {}

-- Fonction pour charger les territoires depuis la base de données
local function LoadTerritories()
    MySQL.Async.fetchAll("SELECT * FROM territories", {}, function(result)
        territories = result
        --print("Territoires chargés:", json.encode(territories))  -- Afficher les territoires pour le debug
        TriggerClientEvent("ducratif_territoire:updateMap", -1, territories) -- Envoi des territoires aux clients
    end)
end

-- Export pour récupérer les territoires
exports("GetTerritories", function()
    return territories
end)

-- Charger les territoires au démarrage du serveur
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        LoadTerritories()  -- Charger les territoires depuis la base de données
    end
end)

-- Commande admin pour recharger les territoires
RegisterCommand("reloadterritories", function(source)
    if source == 0 then -- Console uniquement
        LoadTerritories()
        print("Territoires rechargés.")
    else
        local xPlayer = ESX.GetPlayerFromId(source)
        LoadTerritories()
        TriggerClientEvent("esx:showNotification", source, "Les territoires ont été rechargés.")
        --if xPlayer and xPlayer.getGroup() == "admin" then
        --    LoadTerritories()
        --    TriggerClientEvent("esx:showNotification", source, "Les territoires ont été rechargés.")
        --else
        --    TriggerClientEvent("esx:showNotification", source, "Tu n'as pas la permission de faire ça.")
        --end
    end
end)

-- Commande admin pour ajouter un territoire
RegisterCommand("addterritory", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer or xPlayer.getGroup() ~= "admin" then
        TriggerClientEvent("esx:showNotification", source, "Tu n'as pas la permission d'ajouter un territoire.")
        return
    end

    if #args < 6 then
        TriggerClientEvent("esx:showNotification", source, "Usage: /addterritory [x] [y] [z] [rayon] [couleur] [job]")
        return
    end

    local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
    local radius = tonumber(args[4])
    local color = tonumber(args[5])
    local job = args[6]

    if not x or not y or not z or not radius or not color or not job then
        TriggerClientEvent("esx:showNotification", source, "Paramètres invalides.")
        return
    end

    -- Insérer dans la base de données
    MySQL.Async.execute("INSERT INTO territories (x, y, z, radius, color, job) VALUES (@x, @y, @z, @radius, @color, @job)", {
        ["@x"] = x,
        ["@y"] = y,
        ["@z"] = z,
        ["@radius"] = radius,
        ["@color"] = color,
        ["@job"] = job
    }, function(rowsChanged)
        if rowsChanged > 0 then
            LoadTerritories() -- Recharger les territoires
            TriggerClientEvent("esx:showNotification", source, "Territoire ajouté avec succès !")
        else
            TriggerClientEvent("esx:showNotification", source, "Erreur lors de l'ajout du territoire.")
        end
    end)
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
