--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local authorizedTrailers = {
    [`docktrailer`] = true,
    [`freighttrailer`] = true,
    [`tanker`] = true,
    [`tr4`] = true,
    [`trailerlogs`] = true,
    [`trailers2`] = true,
    [`trailers3`] = true,
    [`tvtrailer`] = true,
    [`tvtrailer2`] = true
}

local authorizedTrucks = {
    [`hauler`] = true,
    [`phantom`] = true,
    [`phantom3`] = true,
    [`phantom4`] = true
}

-- Fonction pour attacher une remorque
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle and authorizedTrucks[GetEntityModel(vehicle)] then
            local vehicleCoords = GetEntityCoords(vehicle)
            local trailerFound = nil

            -- Recherche une remorque proche
            for trailerModel, _ in pairs(authorizedTrailers) do
                local trailerHash = GetHashKey(trailerModel)
                local trailer = GetClosestVehicle(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 10.0, trailerHash, 70)

                if DoesEntityExist(trailer) then
                    trailerFound = trailer
                    break
                end
            end

            -- Si une remorque est trouvée, proposer l'attache
            if trailerFound then
                lib.showTextUI('[E] Attacher la remorque')

                if IsControlJustReleased(0, 56) then
                    AttachVehicleToTrailer(vehicle, trailerFound, 1.0)

                    lib.notify({
                        title = 'Remorque',
                        description = '🚛 Remorque attachée avec succès !',
                        type = 'success'
                    })
                end
            else
                lib.hideTextUI()
            end
        else
            lib.hideTextUI()
        end
    end
end)

-- Fonction pour détacher une remorque
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle and authorizedTrucks[GetEntityModel(vehicle)] then
            if IsVehicleAttachedToTrailer(vehicle) then
                
                --lib.showTextUI('[E] Détacher la remorque')

                if IsControlJustReleased(0, 56) then
                    DetachVehicleFromTrailer(vehicle)

                    lib.notify({
                        title = 'Remorque',
                        description = '🔗 Remorque détachée avec succès !',
                        type = 'success'
                    })
                end
            else
                lib.hideTextUI()
            end
        else
            lib.hideTextUI()
        end
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
