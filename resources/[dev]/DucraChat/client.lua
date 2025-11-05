--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local isOpen = false

RegisterCommand('ducrachat', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open" })
    isOpen = true
end, false)

RegisterKeyMapping('ducrachat', 'Ouvrir DucraChat', 'keyboard', 'F1')

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    isOpen = false
    cb('ok')
end)

RegisterNUICallback('getOrCreateId', function(data, cb)
    lib.callback('ducrachat:getOrCreateId', false, function(id)
        cb(id)
    end)
end)


RegisterNUICallback('getConversations', function(_, cb)
    lib.callback('ducrachat:getConversations', false, function(conv)
        cb(conv)
    end)
end)

RegisterNUICallback('getMessages', function(data, cb)
    lib.callback('ducrachat:getMessages', false, function(messages)
        cb(messages)
    end, data)
end)

RegisterNUICallback('sendMessage', function(data, cb)
    TriggerServerEvent('ducrachat:sendMessage', data)
    cb('ok')
end)

RegisterNUICallback('buyOption', function(data, cb)
    print('[NUI DEBUG] buyOption reçu:', data.option, data.value)
    TriggerServerEvent('ducrachat:buyOption', data.option, data.value)
    cb('ok')
end)

RegisterNUICallback('searchId', function(data, cb)
    lib.callback('ducrachat:searchId', false, function(identifier)
        cb(identifier)
    end, data.searchId)
end)

RegisterNetEvent('ducrachat:popupInvalidId', function()
    SendNUIMessage({ action = "invalidId" })
end)

RegisterNetEvent('ducrachat:changedId', function(newid)
    SendNUIMessage({ action = "changedId", newid = newid })
end)

RegisterNetEvent('ducrachat:messageSent', function(delay)
    SendNUIMessage({ action = "messageSent", delay = delay })
end)


RegisterNUICallback('getOptions', function(data, cb)
    lib.callback('ducrachat:getOptions', false, function(result)
        cb(result or {})
    end)
end)

RegisterNetEvent('ducrachat:showNotif', function(msg, type)
    SendNUIMessage({ action = "showNotif", message = msg, type = type or "info" })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
