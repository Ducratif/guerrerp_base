--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- client/main.lua

local blips = {}

RegisterNetEvent("ducratif_territoire:updateMap")
AddEventHandler("ducratif_territoire:updateMap", function(territoryData)
    -- Supprimer les anciens blips et cercles
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end
    blips = {}

    -- Créer les nouveaux blips et cercles
    for _, data in pairs(territoryData) do
        -- Créer le blip
        local blip = AddBlipForCoord(data.x, data.y, data.z)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, data.color)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(data.job)
        EndTextCommandSetBlipName(blip)

        -- Créer le cercle autour du blip
        local zone = AddBlipForRadius(data.x, data.y, data.z, data.radius + 0.0)
        SetBlipAlpha(zone, 100)
        SetBlipColour(zone, data.color)

        -- Ajouter à la liste des blips
        table.insert(blips, blip)
        table.insert(blips, zone)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
