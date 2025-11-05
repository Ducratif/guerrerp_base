--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

local nuiOpen = false

local OriginalSendNUIMessage = SendNUIMessage



--SendNUIMessage = function(data)
--    if data and data.action == 'openLootboxShopDucratifs' then
--        print('🔍 ATTENTION : Quelque chose a essayé d\'ouvrir la boutique !')
--        print('⛳ STACK :')
--        print(debug.traceback())
--
--        TriggerEvent('ox_lib:notify', {
--            title = 'ALERTE',
--            description = 'Quelque chose a ouvert la boutique automatiquement !',
--            type = 'error'
--        })
--    end
--
--    OriginalSendNUIMessage(data)
--end


RegisterNUICallback('debugLog', function(data, cb)
    print('[DEBUG NUI JS] ' .. data.info)
    cb({})
end)


AddEventHandler('onClientResourceStart', function(res)
    if res == GetCurrentResourceName() then
        print("⚠️ SCRIPT DEMARRÉ :", res)
    end
end)


-------------------------
--RegisterCommand('openAdminLootbox', function()
--    lib.callback('ducratif_lootbox:isAdmin', false, function(isAdmin)
--        if not isAdmin then
--            TriggerClientEvent('ox_lib:notify', src, {
--            title = "Accès refusé",
--            description = "Tu ne peux pas aller sur cette page !",
--            type = "error",
--            duration = 15000
--        })
--            return
--        end
--
--        SetNuiFocus(true, true)
--        SendNUIMessage({ action = 'openAdmin' })
--        -- charge directement admin.html
--        SetResourceKvp('ducratif_ui_page', 'admin')
--    end)
--end)

--========================================================================================
--=======MAINTENANT UN BOT DISCORD--===========
--RegisterCommand('openAdminLootbox', function()
--    lib.callback('ducratif_lootbox:isAdmin', false, function(isAdmin)
--        if not isAdmin then
--            TriggerEvent('ox_lib:notify', {
--                title = "Accès refusé",
--                description = "Tu ne peux pas aller sur cette page !",
--                type = "error",
--                duration = 5000
--            })
--            return
--        end
--
--        SetNuiFocus(true, true)
--        SendNUIMessage({ action = 'openAdmin' })
--    end)
--end)
--========================================================================================

RegisterNUICallback('refreshLootboxes', function(_, cb)
    lib.callback('ducratif_lootbox:getAllActiveBoxes', false, function(boxes)
        cb(boxes)
    end)
end)

RegisterNUICallback('disableNuiFocus', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)


-- Gestion basique pour NUI admin
RegisterNUICallback('closeAdmin', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

-------------------------

RegisterCommand('openLootboxShopDucratifs', function()
    --print('[CLIENT] Ouverture de la boutique manuellement')
    if nuiOpen then return end

    lib.callback('ducratif_lootbox:getAllActiveBoxes', false, function(data)
        SetNuiFocus(true, true)
        nuiOpen = true

        SendNUIMessage({
            action = 'openLootboxShopDucratifs',
            boxes = data
        })
    end)
end)

RegisterNUICallback('closeUI', function(_, cb)
    SetNuiFocus(false, false)
    nuiOpen = false
    cb({})
end)




-- Register la touche
RegisterKeyMapping('openLootboxShopDucratifs', 'Ouvrir le shop de caisses', 'keyboard', 'F5') -- tu peux changer "F10" par la touche "@" si bind correct

-- Fermeture depuis la NUI
RegisterNUICallback('closeLootboxShop', function(_, cb)
    SetNuiFocus(false, false)
    nuiOpen = false
    cb({})
end)


RegisterNUICallback('buyLootbox', function(data, cb)
    TriggerServerEvent('ducratif_lootbox:buyBox', data.boxId)
    cb({})
end)


--Reward list:
RegisterNUICallback('getRewards', function(_, cb)
    lib.callback('ducratif_lootbox:getRewards', false, function(rewards)
        cb(rewards)
    end)
end)

RegisterNUICallback('claimReward', function(data, cb)
    TriggerServerEvent('ducratif_lootbox:claimReward', data.rewardId)
    cb({})
end)


----------------------------
RegisterNUICallback('adminGetBoxes', function(_, cb)
    lib.callback('ducratif_lootbox:adminGetBoxes', false, cb)
end)


RegisterNUICallback('adminToggleBox', function(data, cb)
    lib.callback('ducratif_lootbox:adminToggleBox', false, function(res) cb(res) end, data)
end)

RegisterNUICallback('adminDeleteBox', function(data, cb)
    lib.callback('ducratif_lootbox:adminDeleteBox', false, function(res) cb(res) end, data)
end)

RegisterNUICallback('adminGetLogs', function(data, cb)
    lib.callback('ducratif_lootbox:adminGetLogs', false, cb, data)
end)

RegisterNUICallback('adminSaveBox', function(data, cb)
    lib.callback('ducratif_lootbox:adminSaveBox', false, function(res) cb(res) end, data)
end)

RegisterNUICallback('adminGetBoxDetails', function(data, cb)
    lib.callback('ducratif_lootbox:adminGetBoxDetails', false, cb, data)
end)

RegisterNUICallback('adminDuplicateBox', function(data, cb)
    lib.callback('ducratif_lootbox:adminDuplicateBox', false, cb, data)
end)

RegisterNUICallback('closeAdmin', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback('ducratif_lootbox:getLootboxHistory', function(data, cb)
    lib.callback('ducratif_lootbox:getLootboxHistory', false, function(results)
        cb(results)
    end, data)
end)

RegisterNUICallback('ducratif_lootbox:getTopBuyers', function(_, cb)
    lib.callback('ducratif_lootbox:getTopBuyers', false, function(results)
        cb(results)
    end)
end)

RegisterNUICallback('ducratif_lootbox:claimSaisonReward', function(data, cb)
    lib.callback('ducratif_lootbox:claimSaisonReward', false, function(success)
        cb(success)
    end, data)
end)


RegisterNUICallback('ducratif_lootbox:getSaisonPasse', function(data, cb)
    lib.callback('ducratif_lootbox:getSaisonPasse', false, function(result)
        cb(result)
    end, data)
end)


-----------------------
--Défi voiture et a pied en X km
local walk = 0.0
local drive = 0.0
local lastPos = nil

CreateThread(function()
    while true do
        Wait(2000)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if not lastPos then lastPos = pos end

        local dist = #(pos - lastPos)
        if dist > 0.5 then
            if IsPedInAnyVehicle(ped, false) then
                drive = drive + dist
            else
                walk = walk + dist
            end
            lastPos = pos
        end

        -- Envoie au serveur la progression actuelle
        TriggerServerEvent('caisse_shop:updateDistance', walk, drive)
    end
end)

------------------------
--------------------------
------------------------
---------------------------

--Défi monter dans X véhicule
local lastVeh = nil

CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= lastVeh then
                lastVeh = veh
                local model = GetEntityModel(veh)
                local carName = GetDisplayNameFromVehicleModel(model):lower()
                -- Envoie au serveur le nom du véhicule
                TriggerServerEvent('saisonpass:enteredVehicle', carName)
            end
        else
            lastVeh = nil
        end
    end
end)



----------------------
--Défi monter dans X véhicule et faire X mètre/km
local vehDistance = {}
local currentVehModel = nil
local lastPos = nil

CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            local model = GetEntityModel(veh)
            local carName = GetDisplayNameFromVehicleModel(model):lower()
            if currentVehModel ~= carName then
                -- Quand on change de véhicule, on reset la distance pour ce véhicule
                currentVehModel = carName
                lastPos = GetEntityCoords(ped)
                vehDistance[carName] = 0
            end

            local curPos = GetEntityCoords(ped)
            local dist = #(curPos - lastPos)
            if dist > 0.5 then
                vehDistance[carName] = (vehDistance[carName] or 0) + dist
            end
            lastPos = curPos

            -- Envoie la distance au serveur uniquement si > 0 (évite la validation immédiate)
            if vehDistance[carName] and vehDistance[carName] > 0 then
                TriggerServerEvent('saisonpass:vehicleDistance', carName, vehDistance[carName])
                --print("[SAISONPASS] J'ai parcouru", math.floor(vehDistance[carName]), "mètres avec", carName)
            end
        else
            currentVehModel = nil
            lastPos = nil
        end
    end
end)


------------------------------------------------------
--Défi: Parler à un PNJ spécial
-- 📜 TABLE DES PNJ SPÉCIAUX ET DIALOGUES
local PNJ_LIST = {
    {
        key = 'vieux_port',
        label = "Le Vieux du Port",
        coords = vector3(24.7870, -2808.3589, 5.7018), 
        heading = 73.5663,
        model = 'a_m_m_salton_01',
        dialogue = {
            intro = "Hé gamin, qu'est-ce que tu veux ?",
            playerOptions = {
                {
                    label = "Raconte-moi une histoire de marin.",
                    response = "Ah, les mers étaient déchaînées... J’ai survécu à tout ça moi !",
                    next = 2
                },
                {
                    label = "Tu veux un coup à boire ?",
                    response = "J’refuse jamais un petit remontant, ha ha !",
                    next = 3
                }
            },
            next = {
                [2] = {
                    player = "Ça fait peur, tu n’as jamais songé à partir ?",
                    pnj = "Jamais ! La mer, c’est toute ma vie, gamin.",
                },
                [3] = {
                    player = "Pas trop dur la retraite ici ?",
                    pnj = "La pêche me manque… mais j’suis content d’parler à quelqu’un.",
                }
            }
        }
    },
    {
        key = 'vendeur_armes',
        label = "Le Vendeur louche",
        coords = vector3(880.5463, -1045.6748, 33.0066),
        heading = 172.6534,
        model = 'g_m_y_mexgoon_01',
        dialogue = {
            intro = "Tu cherches quoi, amigo ?",
            playerOptions = {
                {
                    label = "T’as des armes rares ?",
                    response = "Chut… Pas ici. Reviens ce soir.",
                    next = 2
                },
                {
                    label = "Rien, je passe juste.",
                    response = "Alors passe ton chemin...",
                    next = 3
                }
            },
            next = {
                [2] = {
                    player = "Tu fais des prix ?",
                    pnj = "Pour les vrais clients, peut-être.",
                },
                [3] = {
                    player = "Ok, ok…",
                    pnj = "Bonne journée. Ou pas.",
                }
            }
        }
    }
}

---
local PNJ_HANDLES = {}

local PNJ_HANDLES = {}
local INTERACT_DIST = 2.0
local pressedRecently = {}

-- Spawn des PNJ
CreateThread(function()
    for _, pnj in ipairs(PNJ_LIST) do
        RequestModel(pnj.model)
        while not HasModelLoaded(pnj.model) do Wait(10) end
        local ped = CreatePed(4, pnj.model, pnj.coords.x, pnj.coords.y, pnj.coords.z - 1.0, pnj.heading, false, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        PNJ_HANDLES[pnj.key] = ped
    end
end)

-- Boucle d'interaction propre (anti-clignotement et anti-spam)
CreateThread(function()
    while true do
        local waitTime = 500
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local found = false

        for _, pnj in ipairs(PNJ_LIST) do
            local dist = #(coords - pnj.coords)
            if dist < INTERACT_DIST then
                found = true
                ESX.ShowHelpNotification(("Appuie sur ~INPUT_CONTEXT~ pour parler à %s"):format(pnj.label))
                waitTime = 0 -- on reste en boucle rapide pour la réactivité

                -- Anti-spam pour la touche E
                if IsControlJustReleased(0, 38) and not pressedRecently[pnj.key] then
                    pressedRecently[pnj.key] = true
                    TriggerEvent('saisonpass:startPnjDialogue', pnj.key)
                    -- Anti double trigger
                    CreateThread(function()
                        Wait(1500)
                        pressedRecently[pnj.key] = false
                    end)
                end
            end
        end

        if not found then
            waitTime = 350 -- on repasse en boucle lente si pas de pnj à côté
        end
        Wait(waitTime)
    end
end)


RegisterNetEvent('saisonpass:startPnjDialogue', function(pnjKey)
    local pnj = nil
    for _, v in ipairs(PNJ_LIST) do
        if v.key == pnjKey then pnj = v break end
    end
    if not pnj then return end

    -- Menu dialogue principal
    local opts = {}
    for i, opt in ipairs(pnj.dialogue.playerOptions) do
        table.insert(opts, {
            title = opt.label,
            description = "",
            onSelect = function()
                lib.notify({ title = pnj.label, description = opt.response, duration = 3500, type = 'info' })
                Wait(3500)
                -- Deuxième niveau de réponse (facultatif)
                local follow = pnj.dialogue.next and pnj.dialogue.next[opt.next]
                if follow then
                    lib.notify({ title = "Vous", description = follow.player, duration = 2500, type = 'inform' })
                    Wait(2500)
                    lib.notify({ title = pnj.label, description = follow.pnj, duration = 3500, type = 'info' })
                    Wait(3500)
                end
                -- Valider le défi une fois le dialogue complet (personnalisable)
                TriggerServerEvent('saisonpass:checkSpecialPnjChallenge', pnj.key)
            end
        })
    end

    lib.registerContext({
        id = 'saisonpass_dialogue_' .. pnj.key,
        title = pnj.label,
        options = opts
    })
    lib.showContext('saisonpass_dialogue_' .. pnj.key)
end)


------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

------------------------------------------------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
