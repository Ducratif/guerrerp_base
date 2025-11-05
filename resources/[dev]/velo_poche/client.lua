--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local spawnedBike = nil
local cooldown = false
local cooldownTime = 300 -- en secondes (5 minutes)

-- Fonction exportée pour ox_inventory
function useVelo()
    if cooldown then
        lib.notify({ title = 'Vélo de poche', description = 'Tu dois attendre un peu avant de sortir un nouveau vélo.', type = 'error' })
        return
    end

    lib.callback('ducratif:pocketbike:hasItem', false, function(hasItem)
        if not hasItem then
            lib.notify({ title = 'Vélo de poche', description = 'Tu n\'as pas de vélo dans ton inventaire.', type = 'error' })
            return
        end

        local ped = PlayerPedId()

        if spawnedBike and DoesEntityExist(spawnedBike) then
            DeleteEntity(spawnedBike)
            spawnedBike = nil
            lib.notify({ title = 'Vélo de poche', description = 'Vélo rangé.', type = 'info' })
            return
        end

        -- Animation d'apparition
        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
        Wait(4000)
        ClearPedTasks(ped)

        -- Spawn du vélo
        lib.requestModel('bmx')
        local pos = GetEntityCoords(ped)
        local fwd = GetEntityForwardVector(ped)
        local spawnPos = pos + (fwd * 2.0)

        spawnedBike = CreateVehicle('bmx', spawnPos.x, spawnPos.y, spawnPos.z, GetEntityHeading(ped), true, false)
        SetEntityAsMissionEntity(spawnedBike, true, true)

        lib.notify({ title = 'Vélo de poche', description = 'Ton vélo est prêt !', type = 'success' })

        cooldown = true
        SetTimeout(cooldownTime * 1000, function()
            cooldown = false
            lib.notify({ title = 'Vélo de poche', description = 'Tu peux à nouveau sortir ton vélo.', type = 'info' })
        end)
    end)
end

exports('useVelo', useVelo)

-- Commande alternative
--RegisterCommand('velopoche', function()
--    useVelo()
--end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
