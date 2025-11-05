--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--local ESX = exports['es_extended']:getSharedObject()

-- Ouvre le market (F3 ou commande)
RegisterKeyMapping('openlbc', 'Marché Dynamique (LBC)', 'keyboard', 'F3')

RegisterCommand('openlbc', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'openMarket' })
end, false)

-- FERMER LA PAGE --
RegisterNUICallback('lbc:close', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

-- Notification native (utilise ox_lib)
RegisterNetEvent('lbc:notify', function(data)
    if lib and lib.notify then
        lib.notify(data)
    else
        -- fallback vanilla
        SetNotificationTextEntry("STRING")
        AddTextComponentString(data.title and (data.title.."\n") or "" .. (data.description or data.msg or ""))
        DrawNotification(false, false)
    end
end)
--------------------

RegisterNUICallback('createAnnonce', function(data, cb)
    TriggerServerEvent('market:createAnnonce', data)
    cb({})
end)
RegisterNetEvent('market:createAnnonceResult', function(res)
    SendNUIMessage({ action = 'createAnnonceResult', result = res })
end)

---------------------------------
-- En tout début du fichier client.lua :

local historiqueCallback = nil
local annoncesCallback = nil

RegisterNUICallback('getHistorique', function(_, cb)
    historiqueCallback = cb
    TriggerServerEvent('market:getHistorique')
end)

RegisterNetEvent('market:returnHistorique', function(list)
    if historiqueCallback then
        historiqueCallback(list)
        historiqueCallback = nil
    end
end)

RegisterNUICallback('getAnnonces', function(_, cb)
    annoncesCallback = cb
    TriggerServerEvent('market:getAnnonces')
end)

RegisterNetEvent('market:returnAnnonces', function(list)
    if annoncesCallback then
        annoncesCallback(list)
        annoncesCallback = nil
    end
end)


--Debug01
--RegisterNUICallback('getAnnonces', function(_, cb)
--    TriggerServerEvent('market:getAnnonces')
--    RegisterNetEvent('market:returnAnnonces', function(list)
--        cb(list)
--    end)
--end)




--Debug01
--RegisterNUICallback('getHistorique', function(_, cb)
--    TriggerServerEvent('market:getHistorique')
--    RegisterNetEvent('market:returnHistorique', function(list)
--        cb(list)
--    end)
--end)

RegisterNUICallback('buyAnnonce', function(data, cb)
    TriggerServerEvent('market:buyAnnonce', data)
    RegisterNetEvent('market:buyAnnonceResult', function(res)
        cb(res)
    end)
end)

RegisterNUICallback('getUserBadges', function(_, cb)
    TriggerServerEvent('market:getUserBadges')
    local handler
    handler = RegisterNetEvent('market:returnUserBadges', function(badges)
        cb(badges)
    end)
end)


RegisterNUICallback('getAllBadges', function(_, cb)
    TriggerServerEvent('market:getAllBadges')
    local handler
    handler = RegisterNetEvent('market:returnAllBadges', function(badges)
        cb(badges)
        RemoveEventHandler(handler)
    end)
end)

RegisterNUICallback('getBadgesForIdentifier', function(data, cb)
    TriggerServerEvent('market:getBadgesForIdentifier', data.identifier)
    local handler
    handler = RegisterNetEvent('market:returnBadgesForIdentifier', function(badges)
        cb(badges)
        RemoveEventHandler(handler)
    end)
end)

RegisterNUICallback('getActiveAnnonces', function(_, cb)
    TriggerServerEvent('market:getActiveAnnonces')
    RegisterNetEvent('market:returnActiveAnnonces', function(list)
        cb(list)
    end)
end)

-- Côté client.lua
RegisterNetEvent('market:returnPlayerIdentifier', function(identifier)
    -- Transmet au JS/NUI
    SendNUIMessage({ action = 'setPlayerIdentifier', identifier = identifier })
end)

RegisterNUICallback('getPlayerIdentifier', function(_, cb)
    TriggerServerEvent('market:getPlayerIdentifier')
    -- Le retour se fait côté JS via NUIMessage (voir plus bas)
    cb({})
end)


RegisterNUICallback('deleteAnnonce', function(data, cb)
    TriggerServerEvent('market:deleteAnnonce', data.annonce_id)
    cb(true)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
