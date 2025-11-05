--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Spots réservés avec expiration automatique
local reservedSpots = {}

-- Liste fixe des spots de spawn
local trailerSpots = {
    vector4(-514.902, -2856.003, 5.136, 45.69),
    vector4(-508.849, -2852.764, 5.136, 42.99),
    vector4(-505.184, -2847.696, 5.137, 43.83),
    vector4(-501.139, -2842.647, 5.137, 46.99)
}

-- Callback appelé par le client pour demander un spot disponible
lib.callback.register('job_transport_pl:requestFreeSpot', function(source, _)
    local src = source

    for index, spot in ipairs(trailerSpots) do
        if not reservedSpots[index] then
            -- Spot libre : on le réserve
            reservedSpots[index] = src

            -- Libération automatique après 2 minutes
            SetTimeout(120000, function()
                if reservedSpots[index] == src then
                    reservedSpots[index] = nil
                end
            end)

            -- On retourne l'index et les coordonnées au client
            return {
                index = index,
                spot = {
                    x = spot.x,
                    y = spot.y,
                    z = spot.z,
                    w = spot.w
                }
            }
        end
    end

    -- Aucun spot libre
    return nil
end)

-- Optionnel : permet à un joueur de libérer manuellement son spot si tu veux
RegisterNetEvent('job_transport_pl:releaseSpot', function(index)
    local src = source
    if reservedSpots[index] == src then
        reservedSpots[index] = nil
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
