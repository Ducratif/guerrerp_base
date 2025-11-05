--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

-- FILE: client.lua
local ox = exports.ox_lib
local finalPNJCoords = nil
local deliveryPNJ = nil -- Important d'avoir une variable globale côté client
local startPNJ = nil
local startPNJ, deliveryPNJ, finalPNJ, indicePNJ
local isInteracting = false

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
-----------------------------------
--DELAI ENTRE CHAQUE MISSION
----------------------------------
RegisterNetEvent('goFast:showCooldown', function(minutesRemaining)
    lib.notify({
        title = 'Cooldown',
        description = 'Il vous reste ' .. minutesRemaining .. ' minute(s) avant de pouvoir recommencer une mission Go-Fast.',
        type = 'error'
    })
end)


--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
-----------------------------------
--SPAWN DES PNJ
-----------------------------------
CreateThread(function()
    Wait(2000) -- attendre que tout soit bien chargé
    TriggerServerEvent('goFast:requestPNJSpawn')
end)

RegisterNetEvent('goFast:spawnPNJs', function(p1, p2, p3, p4)
    print("[GoFast] Réception des positions des PNJ")
    startPNJ = p1
    deliveryPNJ = p2
    finalPNJ = p3
    indicePNJ = p4
    SpawnPNJ(p1, 'start')
    SpawnPNJ(p2, 'delivery')
    SpawnPNJ(p3, 'final')
    SpawnPNJ(p4, 'indice')
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------------------------------
-- Fonction pour afficher le menu d'interaction avec le PNJ
----------------------------------------------------------------------
function ShowInteractionMenu()
    local elements = {
        {label = "Recevoir de l'argent", value = 'money'},
        {label = "Recevoir de la drogue", value = 'drug'},
        {label = "Recevoir une boîte à bijoux", value = 'jewelry'}
    }

    lib.registerContext({
        id = 'gofast_menu',
        title = 'Choisissez une option',
        options = {
            {
                title = 'Argent',
                description = 'Transporter un sac d\'argent sale',
                icon = 'money-bill',
                onSelect = function()
                    TriggerServerEvent('goFast:startMission', 'money')
                end
            },
            {
                title = 'Drogue',
                description = 'Transporter une mallette de drogue',
                icon = 'cannabis',
                onSelect = function()
                    TriggerServerEvent('goFast:startMission', 'drug')
                end
            },
            {
                title = 'Bijoux',
                description = 'Transporter une boîte à bijoux',
                icon = 'gem',
                onSelect = function()
                    TriggerServerEvent('goFast:startMission', 'jewels')
                end
            }
        }
    })
    
    lib.showContext('gofast_menu')
    
end

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
--------------------------------------------------------------------
--PLACEMENT DE PROXIMITER 2 PNJ
--------------------------------------------------------------------

RegisterNetEvent('goFast:setDeliveryHint', function(hintCoords)
    -- Stocke les coordonnées du vrai PNJ
    deliveryPNJ = hintCoords

    -- Ajoute la zone de recherche
    local blip = AddBlipForRadius(hintCoords.x, hintCoords.y, hintCoords.z, 100.0)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 5)
    SetBlipAlpha(blip, 128)

    SetNewWaypoint(hintCoords.x, hintCoords.y)

    lib.notify({
        title = 'Livraison',
        description = "La zone approximative a été marquée sur la carte.",
        type = 'inform'
    })
end)

RegisterNetEvent('goFast:setRealDeliveryPNJ', function(coords)
    deliveryPNJ = coords -- Ceci est la vraie coordonnée du PNJ
end)
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
---------------------------------------------------
--ACTION DU PNJ
---------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(0)

        if indicePNJ then
        -- Vérifie la position du PNJ
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - vector3(indicePNJ.x, indicePNJ.y, indicePNJ.z))

            if dist < 3.0 then
                -- Afficher l'invite de touche
                lib.showTextUI('[E] Demander un indice')

                if IsControlJustPressed(0, 38) then  -- Touche 'E'
                    TriggerServerEvent('goFast:getPasswordHint')  -- Demander un indice du mot de passe
                    lib.hideTextUI()  -- Cacher l'UI après avoir appuyé sur 'E'
                    Wait(1000) -- Pour éviter double appui
                end
            else
                lib.hideTextUI()  -- Cacher l'UI si le joueur s'éloigne du PNJ
            end
        end
    end
end)

-- Afficher l'indice du mot de passe reçu
RegisterNetEvent('goFast:showPasswordHint', function(passwordHint)
    lib.notify({
        title = 'Indice du mot de passe',
        description = "L'indice est: " .. passwordHint,
        type = 'success'
    })
end)



--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------------------------------
-- Fonction pour vérifier si le joueur est proche du PNJ et interagir
----------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if startPNJ then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - startPNJ)

            if dist < 3.0 then
                if not isInteracting then
                    -- Afficher un message d'interaction
                    DrawText3D(startPNJ.x, startPNJ.y, startPNJ.z, "[~g~E~w~] Tu veux quoi toi?!")
                    
                    if IsControlJustPressed(0, 38) then -- Touche 'E' pour interagir
                        isInteracting = true
                        ShowInteractionMenu()
                    end
                end
            elseif dist > 5.0 and isInteracting then
                isInteracting = false
            end
        end
    end
end)
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------------------------------
-- Fonction pour afficher du texte en 3D
----------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(true)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
----------------------------------------------------------------------
----------------------------------------------------------------------
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------------------------------
-- SPAWN DES PNJ
----------------------------------------------------------------------
function SpawnPNJ(coords, type)
    local model = `s_m_y_dealer_01`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local heading = 0.0
    if type == 'start' then heading = 180.0
    elseif type == 'delivery' then heading = 90.0
    elseif type == 'final' then heading = 270.0
    elseif type == 'indice' then heading = 78.0
    end

    local ped = CreatePed(4, model, coords.x, coords.y, coords.z - 1.0, heading, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER", 0, true)

    -- Le PNJ regarde le joueur une seule fois s'il s'approche
    CreateThread(function()
        while true do
            Wait(1000)
            local player = PlayerPedId()
            if #(GetEntityCoords(player) - GetEntityCoords(ped)) < 5.0 then
                TaskLookAtEntity(ped, player, 3000, 0, 2)
                break -- on sort du thread après 3 secondes de regard
            end
        end
    end)
end
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if deliveryPNJ then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - vector3(deliveryPNJ.x, deliveryPNJ.y, deliveryPNJ.z))

            if dist < 2.0 then
                lib.showTextUI('[E] Donner le mot de passe')

                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('goFast:askPassword')
                    lib.hideTextUI()
                    Wait(1000) -- Pour éviter double appui
                end
            else
                lib.hideTextUI()
            end
        end
    end
end)



RegisterNetEvent('goFast:receiveDelivery', function(password, deliveryLocation)
    lib.registerContext({
        id = 'gofast_delivery_menu',
        title = 'Mission Go-Fast',
        options = {
            {
                title = 'Donner mot de passe',
                icon = 'key',
                onSelect = function()
                    local input = lib.inputDialog('Mot de passe', {
                        {
                            type = 'input',
                            label = 'Entrez le mot de passe',
                            placeholder = '',
                            required = true
                        }
                    })

                    if input and input[1] then
                        TriggerServerEvent('goFast:validatePassword', input[1], 2)
                    end
                end
            }
        }
    })

    lib.showContext('gofast_delivery_menu')
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
RegisterNetEvent('goFast:goToFinalPNJ', function(finalPNJ)
    finalPNJCoords = finalPNJ -- sauvegarde globale
    -- Affiche une notification que c'est la dernière étape
    lib.notify({
        title = 'Dernière étape',
        description = 'allez au prochain PNJ pour recevoir votre argent !',
        type = 'inform'
    })

    -- Marque l'endroit où le joueur doit se rendre
    SetNewWaypoint(finalPNJ.x, finalPNJ.y)

    -- Optionnel: Affiche un message dans le chat indiquant l'emplacement du PNJ final
    TriggerEvent('chat:addMessage', {
        args = { "Go-Fast", "Rendez-vous à la dernière étape pour recevoir votre argent." }
    })
end)


RegisterNetEvent('goFast:wrongPassword', function()
    -- Affiche une notification que le mot de passe est incorrect
    lib.notify({
        title = 'Erreur',
        description = 'Mot de passe incorrect, le PNJ s\'enfuit!',
        type = 'error'
    })

    -- Logic for PNJ to flee
    Citizen.CreateThread(function()
        -- Trouve le PNJ associé
        local ped = GetClosestPed(GetEntityCoords(PlayerPedId()), 5.0) -- Recherche le PNJ à proximité
        if ped and DoesEntityExist(ped) then
            -- Animation pour que le PNJ s'enfuie (ici on utilise un comportement simple, comme courir)
            TaskReactAndFleePed(ped, PlayerPedId())
            -- On peut aussi faire en sorte que le PNJ parte en voiture
            local vehicle = GetClosestVehicle(GetEntityCoords(ped), 10.0, 0, 70) -- Cherche un véhicule proche
            if vehicle and DoesEntityExist(vehicle) then
                TaskVehicleDriveWander(ped, vehicle, 30.0, 70) -- PNJ s'enfuit en voiture
            end
        end
    end)
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------
---FIN DE MISSION
----------------------------------------------
RegisterNetEvent('goFast:missionSuccess', function(gain)
    lib.notify({
        title = 'Mission réussie',
        description = "Vous avez gagné : " .. gain .. "€",
        type = 'success'
    })

    -- Le PNJ s’enfuit
    Citizen.CreateThread(function()
        local ped = GetClosestPed(GetEntityCoords(PlayerPedId()), 5.0)
        if ped and DoesEntityExist(ped) then
            DriveOffPNJ(GetEntityCoords(ped)) -- fait fuir le PNJ actuel
        end
    end)
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

-- Interaction avec E pour finaliser la mission
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if finalPNJCoords then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - vector3(finalPNJCoords.x, finalPNJCoords.y, finalPNJCoords.z))
            if dist < 2.0 then
                lib.showTextUI('[E] Parler au PNJ')

                if IsControlJustPressed(0, 38) then -- Touche E
                    TriggerServerEvent('goFast:completeFinalStep')
                    lib.hideTextUI()
                    finalPNJCoords = nil -- pour éviter répétition
                    break
                end
            else
                lib.hideTextUI()
            end
        end
    end
end)


function DriveOffPNJ(coords)
    local ped = GetClosestPed(coords.x, coords.y, coords.z)
    if ped then
        local vehicleModel = `adder`  -- remplacer le model du véhicule (ps: rare que cela ce produit)
        RequestModel(vehicleModel)
        while not HasModelLoaded(vehicleModel) do Wait(0) end

        local vehicle = CreateVehicle(vehicleModel, coords.x, coords.y, coords.z, 0.0, true, false)
        TaskWarpPedIntoVehicle(ped, vehicle, -1) -- Le pnj rentre dedans
        TaskVehicleDriveToCoord(ped, vehicle, coords.x + 100, coords.y + 100, coords.z, 60.0, 1, vehicleModel, 16777216, 1.0, true) -- Make the PNJ drive away
    end
end

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------------------------------------
---Mot de passe 2emes pnj
----------------------------------------------
RegisterNetEvent('goFast:askPassword', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = currentMissions[src]

    if not data then return end

    local hasItem = xPlayer.getInventoryItem(data.item).count >= 1
    if not hasItem then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Erreur',
            description = "Tu n'as pas l'objet requis pour continuer cette étape.",
            type = 'error'
        })
        return
    end

    -- Envoie au client l’UI pour taper le mot de passe
    TriggerClientEvent('goFast:receiveDelivery', src, data.password, deliveryPNJ)
end)


--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
