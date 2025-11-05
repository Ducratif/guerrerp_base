--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

local activePNJs = {}
AddRelationshipGroup("GROUP_PNJ")

print("[Client] Script client chargé")

RegisterNetEvent("groupepnj:spawn")
AddEventHandler("groupepnj:spawn", function(group, data)
    print("[Client] Réception de l’événement de spawn pour le groupe :", group)
    local pos = data.position
    local spawned = {}

    -- Si le groupe est déjà actif, éviter de créer un autre spawn
    if activePNJs[group] then
        print("[Client] Le groupe est déjà actif, annulation du spawn.")
        return
    end

    for i = 1, data.pnj.count do
        local offset = vector3(
            math.random(-20, 20),
            math.random(-20, 20),
            0.0
        )
        local spawnPos = pos + offset
        local pedModel = GetHashKey(data.pnj.outfits[math.random(#data.pnj.outfits)])
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do Wait(10) end

        local ped = CreatePed(4, pedModel, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, false)
        GiveWeaponToPed(ped, GetHashKey(data.pnj.weapons[math.random(#data.pnj.weapons)]), 9999, false, true)
        SetPedAsEnemy(ped, false)
        SetRelationshipBetweenGroups(0, `GROUP_PNJ`, `GROUP_PNJ`)
        SetPedRelationshipGroupHash(ped, `GROUP_PNJ`)
        SetPedAccuracy(ped, 50)
        TaskCombatHatedTargetsAroundPed(ped, 50.0, 0)

        -- 🔁 Détection de la mort du PNJ et attribution du kill
        CreateThread(function()
            while true do
                Wait(300)
                if DoesEntityExist(ped) and IsPedDeadOrDying(ped, true) then
                   local killer = GetPedSourceOfDeath(ped)
                   if IsPedAPlayer(killer) then
                        local killerServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(killer))
                        if killerServerId then
                            print(("[Client] Le PNJ du groupe %s a été tué par le joueur %s"):format(group, killerServerId))
                            TriggerServerEvent("groupepnj:pnjMort", group, killerServerId)
                        end
                    end

                   break
               end

            end
        end)

        table.insert(spawned, ped)
    end

    activePNJs[group] = spawned

    -- 🔄 Thread de surveillance pour détecter la fin du groupe
    CreateThread(function()
        local running = true
        while running do
            Wait(1000)
            local alive = 0
            local spawnedPNJs = activePNJs[group]

            if not spawnedPNJs then
                print("[Client] ERREUR : Aucun PNJ actif pour le groupe", group)
                return
            end

            for _, ped in ipairs(spawnedPNJs) do
                if DoesEntityExist(ped) and not IsEntityDead(ped) then
                    alive = alive + 1
                end
            end

            if alive <= 0 then
                print("[Client] Tous les PNJ sont morts pour le groupe :", group)
                --TriggerServerEvent("groupepnj:resetGroup", group)
                activePNJs[group] = nil -- ✅ Libération du groupe pour permettre un respawn
                running = false
            end
        end
    end)

    TriggerServerEvent("groupepnj:confirmSpawn", group)

    
    --VERIFICATION DES JOUEURS DANS LA ZONE

        -- ✅ Surveillance de la présence du joueur dans la zone
    local zoneRadius = 100.0 -- distance de la zone d'engagement
    local isInsideZone = false

    CreateThread(function()
        while activePNJs[group] do
            Wait(1000)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            local dist = #(playerCoords - pos)
            if dist <= zoneRadius and not isInsideZone then
                isInsideZone = true
                print(("[ZONE] Le joueur est entré dans la zone du groupe %s."):format(group))
                TriggerServerEvent("groupepnj:playerInZone", group)
            elseif dist > zoneRadius and isInsideZone then
                isInsideZone = false
                print(("[ZONE] Le joueur a quitté la zone du groupe %s."):format(group))
                TriggerServerEvent("groupepnj:playerLeftZone", group)
            end
        end
    end)


    ---------------------------
    ---------------------------
end)

----------------------------------------------------------------------
----------------CREATION/MODIFICATION BLIPS----------------
----------------------------------------------------------------------


local groupBlips = {}

RegisterNetEvent('groupepnj:updateBlip', function(groupName, coords, etat)
    -- Supprime l'ancien blip si existant
    if groupBlips[groupName] then
        RemoveBlip(groupBlips[groupName])
        groupBlips[groupName] = nil
    end

    -- Crée un nouveau blip
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 161) -- par défaut, modifiable selon l’état
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)

    local label = "Évènement"

    if etat == "disponible" then
        SetBlipSprite(blip, 161) -- icône par défaut
        SetBlipColour(blip, 2) -- vert
        label = "[Disponible] Zone de puissance"
    elseif etat == "en_cours" then
        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 1) -- rouge
        label = "[EN COURS] Zone active"
    elseif etat == "cooldown" then
        SetBlipSprite(blip, 161)
        SetBlipColour(blip, 5) -- jaune
        label = "[Cooldown] Zone temporairement inactive"
    end

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    groupBlips[groupName] = blip
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
