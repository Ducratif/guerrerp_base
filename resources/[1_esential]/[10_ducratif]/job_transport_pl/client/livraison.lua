--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        if not handle or handle == -1 then
            return
        end
        local success
        repeat
            coroutine.yield(vehicle)
            success, vehicle = FindNextVehicle(handle)
        until not success
        EndFindVehicle(handle)
    end)
end


local deliveryNPC = nil
local npcCoords = vector4(-378.2488, -2770.6555, 6.04537, 46.07542)
local deliveryPoint = nil
local deliveryPNJ = nil
local deliveryBlip = nil
local reward = 0
local xp_rank = 0

local authorizedTrucks = {
    [`hauler`] = true,
    [`phantom`] = true,
    [`phantom3`] = true,
    [`phantom4`] = true
}

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

local elements = {
    --{label = "Debug", value = "debug"},
    {label = "Livraison en Ville", value = "ville"},
    {label = "Entre Deux", value = "entreDeux"},
    {label = "Nord de Ducratif", value = "nordDucratif"},
}

local deliveryLocations = {
    --debug = {
    --    {x = -346.7269, y = -2739.0227, z = 6.1001, reward = 1500, xp_rank = 30000},
    --},
    ville = {
        {x = -694.80, y = -2454.77, z = 13.86, reward = 1500, xp_rank = 100},
        {x = -887.51, y = -3004.30, z = 13.08, reward = 1900, xp_rank = 200},
        {x = -394.6833, y = -1881.3000, z = 20.5278, reward = 2000, xp_rank = 300},
        {x = -344.53, y = -1520.52, z = 26.87, reward = 2000, xp_rank = 400},
        {x = -724.1375, y = -910.6776, z = 19.2611, reward = 2150, xp_rank = 500},
        {x = -835.79, y = -809.48, z = 18.62, reward = 2130, xp_rank = 600},
        {x = -1049.7200, y = -245.7793, z = 37.8620, reward = 3000, xp_rank = 700},
        {x = -1376.0159, y = 52.7372, z = 53.8757, reward = 3150, xp_rank = 800},
        {x = -1432.2523, y = -253.3820, z = 46.4571, reward = 3300, xp_rank = 900},
        {x = -1509.5367, y = -419.3514, z = 35.5919, reward = 3500, xp_rank = 1000},
        {x = -1670.1669, y = -536.6038, z = 35.6090, reward = 3460, xp_rank = 1100}
    },
    entreDeux = {
        {x = -2965.3237, y = 66.7357, z = 11.6085, reward = 7500, xp_rank = 1500},
        {x = -2964.6028, y = 377.1682, z = 15.0061, reward = 7800, xp_rank = 1800},
        {x = -3250.3313, y = 996.5156, z = 12.4883, reward = 7900, xp_rank = 2000},
        {x = -2552.9216, y = 2318.0405, z = 33.2155, reward = 8300, xp_rank = 2500}
    },
    nordDucratif = {
        {x = -2194.9980, y = 3309.1926, z = 32.8245, reward = 10000, xp_rank = 3000},
        {x = -1570.6627, y = 5159.0288, z = 19.7187, reward = 13000, xp_rank = 3500},
        {x = 40.64, y = 3682.99, z = 38.70, reward = 15000, xp_rank = 4000},
        {x = 388.73, y = 3591.79, z = 32.42, reward = 14000, xp_rank = 4500},
        {x = 1532.4221, y = 3772.6279, z = 34.5116, reward = 16000, xp_rank = 5000}
    },

}

function SpawnDeliveryPNJ(location)
    RequestModel("s_m_m_trucker_01")
    while not HasModelLoaded("s_m_m_trucker_01") do
        Wait(100)
    end
    deliveryPNJ = CreatePed(4, "s_m_m_trucker_01", location.x, location.y, location.z - 1.0, 0.0, false, true)
    SetEntityInvincible(deliveryPNJ, true)
    FreezeEntityPosition(deliveryPNJ, true)
    SetBlockingOfNonTemporaryEvents(deliveryPNJ, true)
end

function ValidateFinalDelivery()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local truck, trailer = GetNearbyTruckAndTrailer()

    if not trailer or #(GetEntityCoords(trailer) - vector3(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)) > 20.0 then
        ESX.ShowNotification("Votre remorque n'est pas à moins de 20m du PNJ de livraison.")
        return
    end

    if #(playerCoords - vector3(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)) > 2.0 then
        ESX.ShowNotification("Vous devez être proche du PNJ de livraison.")
        return
    end

    DeleteEntity(trailer)
    RemoveBlip(deliveryBlip)
    deliveryPoint = nil

    -- Envoi au serveur pour ajouter l'argent
    TriggerServerEvent("job_transport_pl:giveMoney", reward, xp_rank)

    ESX.ShowNotification("Livraison effectuée, vous avez gagné " .. reward .. "€ en liquide.")
end




-- PNJ DE DEPART DE LIVRAISON

Citizen.CreateThread(function()
    RequestModel("s_m_m_trucker_01")
    while not HasModelLoaded("s_m_m_trucker_01") do
        Wait(100)
    end
    deliveryNPC = CreatePed(4, "s_m_m_trucker_01", npcCoords.x, npcCoords.y, npcCoords.z - 1.0, npcCoords.w, false, true)
    SetEntityInvincible(deliveryNPC, true)
    FreezeEntityPosition(deliveryNPC, true)
    SetBlockingOfNonTemporaryEvents(deliveryNPC, true)
end)

function GetNearbyTruckAndTrailer()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local truck, trailer = nil, nil

    for vehicle in EnumerateVehicles() do
        local model = GetEntityModel(vehicle)

        -- Vérifie si c'est un camion
        if authorizedTrucks[model] and #(playerCoords - GetEntityCoords(vehicle)) < 10.0 then
            truck = vehicle
        end

        -- Vérifie si c'est une remorque
        if authorizedTrailers[model] and #(playerCoords - GetEntityCoords(vehicle)) < 10.0 then
            trailer = vehicle
        end

        -- Si on a trouvé les deux, on arrête la recherche
        if truck and trailer then
            break
        end
    end

    return truck, trailer
end


function ValidateDelivery()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local truck, trailer = GetNearbyTruckAndTrailer()
    
    if not truck then
        --ShowMessage("Vous n'avez pas de camion proche.")
        --ESX.ShowNotification("Vous n'avez pas de camion proche.")
        lib.notify({
            title = 'Camion',
            description = '🔗 Vous n\'avez pas de camion proche!',
            type = 'error'
        })
        return false
    end
    
    if not trailer then
        lib.notify({
            title = 'Remorque',
            description = '🔗 Vous n\'avez pas de remorque proche!',
            type = 'error'
        })
        --ESX.ShowNotification("Vous n'avez pas de remorque proche.")
        return false
    end
    
    if #(playerCoords - vector3(npcCoords.x, npcCoords.y, npcCoords.z)) > 2.0 then
        lib.notify({
            title = 'Encore plus proche',
            description = '🔗 Vous devez être proche du PNJ de livraison!',
            type = 'error'
        })
        --ESX.ShowNotification("Vous devez être proche du PNJ de livraison.")
        return false
    end
    
    return true
end

function ShowMessage(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


-- Gestion du choix
RegisterNetEvent('ducratif:onDeliverySelected', function(category)
    if deliveryLocations[category] then
        deliveryPoint = deliveryLocations[category][math.random(#deliveryLocations[category])]
        reward = deliveryPoint.reward
        xp_rank = deliveryPoint.xp_rank or 0

        deliveryBlip = AddBlipForCoord(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)
        SetBlipRoute(deliveryBlip, true)

        SpawnDeliveryPNJ(deliveryPoint)

        lib.notify({
            title = 'Livraison',
            description = 'Livraison définie, direction : ' .. category,
            type = 'inform'
        })
    else
        lib.notify({
            title = 'Erreur',
            description = 'Destination invalide.',
            type = 'error'
        })
    end
end)


-- Vérifier si le joueur est sur l'un ou l'autre PNJ
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())



         --Vérification si le joueur est au point de livraison
        if deliveryPoint then
            if #(playerCoords - vector3(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)) < 2.0 then
                --ShowMessage("Appuyez sur ~INPUT_CONTEXT~ pour finaliser votre livraison.")
                lib.showTextUI('Appuyez sur [E] pour finaliser votre livraison')
                if IsControlJustPressed(0, 38) then
                    ValidateFinalDelivery()
                end
            end
        end

        -- Vérification si le joueur est proche du PNJ pour valider le bon de livraison
if npcCoords then
    if #(playerCoords - vector3(npcCoords.x, npcCoords.y, npcCoords.z)) < 2.0 then
        --lib.showTextUI('Appuyez sur [E] pour valider votre bon de livraison')

        if IsControlJustPressed(0, 38) then
            if ValidateDelivery() then
                lib.hideTextUI()

                -- Création dynamique du menu avec OX
                local options = {}
                for i = 1, #elements do
                    table.insert(options, {
                        title = elements[i].label,
                        description = 'Choisir cette destination',
                        icon = 'truck', -- tu peux changer l’icône ou le retirer
                        onSelect = function()
                            local category = elements[i].value
                            if deliveryLocations[category] then
                                deliveryPoint = deliveryLocations[category][math.random(#deliveryLocations[category])]
                                reward = deliveryPoint.reward
                                xp_rank = deliveryPoint.xp_rank or 0

                                deliveryBlip = AddBlipForCoord(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z)
                                SetBlipRoute(deliveryBlip, true)

                                SpawnDeliveryPNJ(deliveryPoint)

                                lib.notify({
                                    title = 'Livraison',
                                    description = 'Direction : ' .. category,
                                    type = 'success'
                                })
                            else
                                lib.notify({
                                    title = 'Erreur',
                                    description = 'Destination invalide.',
                                    type = 'error'
                                })
                            end
                        end
                    })
                end

                lib.registerContext({
                    id = 'delivery_menu',
                    title = 'Choisissez votre destination',
                    options = options
                })

                lib.showContext('delivery_menu')
            end
        end
    else
        lib.hideTextUI()
    end
end
    end
end)

-- ANNULER LA LIVRAISON, touche: A
function CancelDelivery()
    if not deliveryPoint then
       -- ESX.ShowNotification("Vous n'avez pas de livraison en cours.")
        return
    end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not vehicle or not authorizedTrucks[GetEntityModel(vehicle)] then
        ESX.ShowNotification("Vous devez être dans un camion pour annuler la livraison.")
        return
    end

    local elements = {
        {label = "Oui", value = "yes"},
        {label = "Non", value = "no"}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cancel_delivery_menu', {
        title = "Voulez-vous annuler la livraison ?",
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == "yes" then
            RemoveBlip(deliveryBlip)
            deliveryPoint = nil
            deliveryPNJ = nil
            ESX.ShowNotification("Livraison annulée ! Le client est averti.")
        else
            ESX.ShowNotification("La livraison continue !")
        end
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 74) then -- Touche A (QAZERTY) ou Gauche (AZERTY)
            CancelDelivery()
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
