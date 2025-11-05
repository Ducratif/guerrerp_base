--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent("ducratif_territoire:updateMap")
AddEventHandler("ducratif_territoire:updateMap", function(territories)
    print("Mise à jour des territoires reçue :", json.encode(territories)) -- DEBUG

    for _, territory in pairs(territories) do
        local blip = AddBlipForCoord(territory.x, territory.y, territory.z)
        SetBlipSprite(blip, 378) -- Icône du blip
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, territory.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(territory.job)
        EndTextCommandSetBlipName(blip)

        -- Dessiner le cercle sur la carte
        local zone = AddBlipForRadius(territory.x, territory.y, territory.z, territory.radius)
        SetBlipAlpha(zone, 128) -- Transparence du cercle
        SetBlipColour(zone, territory.color)
    end
end)

-- Demander les territoires au serveur quand le client se charge
TriggerServerEvent("ducratif_territoire:requestTerritories")

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
