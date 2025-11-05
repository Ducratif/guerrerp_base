--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local zoneCenter = vector3(1691.2897, 2574.4712, 50.3542)
local zoneRadius = 200.0

CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - zoneCenter)

        -- Dessine un cercle au sol (marker)
        DrawMarker(1, zoneCenter.x, zoneCenter.y, zoneCenter.z - 1.0, 0, 0, 0, 0, 0, 0, zoneRadius * 2.0, zoneRadius * 2.0, 1.0, 255, 0, 0, 100, false, false, 2, false, nil, nil, false)

        -- (Optionnel) Notification si tu veux dire qu'on est dans la zone
        if dist < zoneRadius then
            -- lib.notify si tu veux
            -- exports['ox_lib']:notify({ title = "Zone", description = "Vous êtes dans la zone", type = "inform" })
        end
    end
end)


--Blips:
--CreateThread(function()
--    local blip = AddBlipForRadius(zoneCenter.x, zoneCenter.y, zoneCenter.z, zoneRadius)
--    SetBlipHighDetail(blip, true)
--    SetBlipColour(blip, 1) -- Rouge
--    SetBlipAlpha(blip, 128) -- Transparence
--end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
