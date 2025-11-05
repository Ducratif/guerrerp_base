--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Citizen.CreateThread(function()
    local explosions = {
        vector3(1931.606, 2614.29, 48.0558),
        vector3(1922.7375, 2603.4868, 47.9689),
        vector3(1866.3452, 2622.4929, 47.5033),
        vector3(1804.425, 2614.0454, 45.5083),
    }

    local toxic = {
        vector3(1829.0151, 2604.1272, 45.8891),
        vector3(1781.3829, 2602.9521, 45.5649),
        vector3(1739.5768, 2606.9871, 46.6117),
    }

    local smokeCoords = {
        vector3(1947.7958, 2613.9050, 46.0434),
        vector3(1900.7709, 2609.8638, 45.7380),
        vector3(1849.5991, 2606.8257, 45.5776)
    }

    RequestNamedPtfxAsset("core")
    RequestNamedPtfxAsset("scr_agencyheistb")

    while not HasNamedPtfxAssetLoaded("core") or not HasNamedPtfxAssetLoaded("scr_agencyheistb") do
        Wait(10)
    end

    -- 🔥 Explosions visuelles
    for _, coords in ipairs(explosions) do
        CreateThread(function()
            local foundGround, groundZ = false, 0.0
            local tries = 0
            while not foundGround and tries < 20 do
                foundGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 10.0, 0.0)
                Wait(10)
                tries = tries + 1
            end
            local z = foundGround and groundZ + 0.1 or coords.z
            UseParticleFxAssetNextCall("core")
            StartParticleFxLoopedAtCoord("ent_ray_palmtree_exp", coords.x, coords.y, z, 0.0, 0.0, 0.0, 1.0, false, false, false)
        end)
    end

    -- 🧪 Fumée toxique
    for _, coords in ipairs(toxic) do
        CreateThread(function()
            local foundGround, groundZ = false, 0.0
            local tries = 0
            while not foundGround and tries < 20 do
                foundGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 10.0, 0.0)
                Wait(10)
                tries = tries + 1
            end
            local z = foundGround and groundZ + 0.1 or coords.z
            UseParticleFxAssetNextCall("scr_agencyheistb")
            StartParticleFxLoopedAtCoord("scr_agency3b_fire_gas", coords.x, coords.y, z, 0.0, 0.0, 0.0, 1.0, false, false, false)
        end)
    end

    -- 💨 Fumée rouge type flare
    for _, coords in ipairs(smokeCoords) do
        CreateThread(function()
            local foundGround, groundZ = false, 0.0
            local tries = 0
            while not foundGround and tries < 20 do
                foundGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 10.0, 0.0)
                Wait(10)
                tries = tries + 1
            end
            local z = foundGround and groundZ + 0.1 or coords.z
            UseParticleFxAssetNextCall("core")
            StartParticleFxLoopedAtCoord("exp_grd_flare", coords.x, coords.y, z, 0.0, 0.0, 0.0, 1.0, false, false, false)
        end)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
