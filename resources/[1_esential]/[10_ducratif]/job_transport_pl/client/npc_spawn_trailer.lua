--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Client.lua avec système de réservation de spot sécurisé

local trailerModels = {
    {model = "docktrailer", label = "Conteneur"},
    {model = "tanker", label = "Fuel"},
    {model = "tr4", label = "Voiture"},
    {model = "trailerlogs", label = "Bois"},
    {model = "trailers2", label = "Remorque Boutique"},
    {model = "trailers3", label = "Livraison"},
    {model = "tvtrailer", label = "Télévision"},
    {model = "tvtrailer2", label = "Sport"}
}

local trailerSpots = {
    vector4(-514.902, -2856.003, 5.136, 45.69),
    vector4(-508.849, -2852.764, 5.136, 42.99),
    vector4(-505.184, -2847.696, 5.137, 43.83),
    vector4(-501.139, -2842.647, 5.137, 46.99)
}

local currentTrailer = nil

function OpenTrailerMenu()
    local options = {}
    for i, trailer in ipairs(trailerModels) do
        table.insert(options, {
            title = trailer.label,
            description = "Choisir ce modèle de remorque",
            icon = "truck-loading",
            onSelect = function()
                lib.callback('job_transport_pl:requestFreeSpot', false, function(data)
                    if data then
                        local spot = data.spot
                        local index = data.index
                        ESX.Game.SpawnVehicle(trailer.model, vector3(spot.x, spot.y, spot.z), spot.w, function(vehicle)
                            currentTrailer = vehicle
                            lib.notify({
                                title = 'Remorque',
                                description = "Merci d'aller à la barrière pour valider votre bon de livraison !",
                                type = 'success'
                            })
                        end)
                    else
                        lib.notify({
                            title = 'Erreur',
                            description = "Aucun quai de chargement disponible. OU attendre 2 MINUTES",
                            type = 'error'
                        })
                    end
                end, trailerSpots)
            end
        })
    end

    lib.registerContext({
        id = 'trailer_menu',
        title = 'Sélectionnez une remorque',
        options = options
    })

    lib.showContext('trailer_menu')
end

-- PNJ
local npcCoords = vector3(-498.322, -2855.463, 7.295)
local npcModel = "s_m_m_trucker_01"

CreateThread(function()
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do Wait(1) end
    local npc = CreatePed(4, npcModel, npcCoords.x, npcCoords.y, npcCoords.z - 1.0, 39.74, false, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)

CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        if #(coords - npcCoords) < 2.0 then
            lib.showTextUI("Appuyez sur [E] pour prendre votre service")
            if IsControlJustReleased(0, 38) then
                lib.hideTextUI()
                OpenTrailerMenu()
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
