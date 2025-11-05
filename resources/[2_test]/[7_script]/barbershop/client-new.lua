--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local ox_target = exports.ox_target
local disableUI = false
local started = false
local viewangle = false
local price = 250 -- Prix par défaut

local barberShops = {
    {coords = vec3(133.55, -1708.86, 29.29), heading = 237.22},
    {coords = vec3(-814.3, -183.8, 37.6), heading = 131.0},
    {coords = vec3(136.8, -1708.4, 29.3), heading = 138.5},
    -- Ajoute ici d'autres barbiers si tu veux
}
local coords_barbe = vec3(133.55, -1708.86, 29.29)
local heading_barbe = 237.22
local cam = nil

RegisterNetEvent('barbershop:cancel', function()
    started = false
    disableUI = false
    viewangle = false
    destroyCam()
    FreezeEntityPosition(PlayerPedId(), false)
    ESX.UI.Menu.CloseAll()
    ClearPedTasksImmediately(PlayerPedId())
    SetEntityCoords(PlayerPedId(), 133.55, -1708.86, 28.29)
    SetEntityHeading(PlayerPedId(), 237.22)
    cost = 0
end)

function createCam()
    if cam then
        DestroyCam(cam, true)
    end
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, GetEntityCoords(PlayerPedId()) + vector3(0, 2, 0.5))
    PointCamAtEntity(cam, PlayerPedId())
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
end

function destroyCam()
    if cam then
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 0, true, true)
        cam = nil
    end
end

RegisterNetEvent('barbershop:cancel', function()
    started = false
    disableUI = false
    viewangle = false
    destroyCam()
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(PlayerPedId())
    SetEntityCoords(PlayerPedId(), coords_barbe)
    SetEntityHeading(PlayerPedId(), heading_barbe)
    exports['ox_lib']:notify({
        title = "Barbier",
        description = "Transaction annulée.",
        type = "error"
    })
end)

local function openBarberMenu()
    lib.registerContext({
        id = 'barber_menu',
        title = 'Barbier',
        options = {
            {
                title = 'Changer de coupe',
                description = 'Nouvelle coupe de cheveux',
                icon = 'scissors',
                onSelect = function()
                    -- Ouvre le menu des cheveux uniquement
                    TriggerEvent('esx_skin:openSaveableMenu', 'hair', price)  -- Filtre pour les cheveux uniquement
                end,
            },
            {
                title = 'Changer la barbe',
                description = 'Nouvelle barbe stylée',
                icon = 'user',
                onSelect = function()
                    -- Ouvre le menu de barbe uniquement
                    TriggerEvent('esx_skin:openSaveableMenu', 'beard', price)  -- Filtre pour la barbe uniquement
                end,
            },
            {
                title = 'Changer les sourcils',
                description = 'Refaire les sourcils',
                icon = 'eye',
                onSelect = function()
                    -- Ouvre le menu des sourcils uniquement
                    TriggerEvent('esx_skin:openSaveableMenu', 'eyebrow', price)  -- Filtre pour les sourcils uniquement
                end,
            }
        }
    })

    lib.showContext('barber_menu')
end

-- Interaction zone avec ox_target
CreateThread(function()
    for i, shop in pairs(barberShops) do
        ox_target:addBoxZone({
            coords = shop.coords,
            size = vec3(1.5, 1.5, 2),
            rotation = 45,
            options = {
                {
                    name = 'barbershop_'..i,
                    icon = 'fas fa-scissors',
                    label = 'Se faire couper les cheveux',
                    onSelect = function()
                        ESX.TriggerServerCallback('barbershop:checkposition', function(canUse)
                            if canUse then
                                started = true
                                FreezeEntityPosition(PlayerPedId(), true)
                                SetEntityHeading(PlayerPedId(), shop.heading)
                                SetEntityCoords(PlayerPedId(), shop.coords)
                                createCam()
                                openBarberMenu()
                            else
                                exports['ox_lib']:notify({
                                    title = "Barbier",
                                    description = "Quelqu'un est déjà en train de se faire couper les cheveux !",
                                    type = "error"
                                })
                            end
                        end)                        
                    end
                }
            }
        })
    end
end)

-- Quand il ferme le menu
AddEventHandler('esx_skin:save', function()
    if started then
        TriggerServerEvent('barbershop:pay', price)
        started = false
        destroyCam()
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerServerEvent('barbershop:removeposition')
    end
end)

AddEventHandler('esx_skin:cancel', function()
    if started then
        started = false
        destroyCam()
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerServerEvent('barbershop:removeposition')
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
