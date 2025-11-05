--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("pv-pager:pager:received")
AddEventHandler("pv-pager:pager:received", function(text)
    SendNUIMessage({
        text = text,
        action = "pagerReceived"
    })
end)

RegisterCommand("dismisspager", function(source, args, rawCommand)
    SendNUIMessage({
        action = "pagerElapsed"
    })
end, false)

RegisterKeyMapping('dismisspager', 'Dismiss a pager', 'keyboard', 'x')

RegisterNetEvent('notification:triggerPagerOnClient')
AddEventHandler('notification:triggerPagerOnClient', function(channel, message, coords)
    -- Here you can send the message to the NUI instead of using ESX notification
    SendNUIMessage({
        text = "[" .. channel .. "] " .. message,
        action = "pagerReceived"
    })

    -- Create a blip on the map
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 1) -- Set sprite type (1 = marker)
    SetBlipColour(blip, 2) -- Set colour (2 = red)
    SetBlipScale(blip, 0.8) -- Set size

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Pager Notification")
    EndTextCommandSetBlipName(blip)

    -- Optionally, remove the blip after a certain time (e.g., 10 seconds)
    Citizen.SetTimeout(10000, function()
        RemoveBlip(blip)
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
