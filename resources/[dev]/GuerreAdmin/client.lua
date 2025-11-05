--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterCommand("adminmenu", function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = "open"})
end, false)


--RegisterKeyMapping('adminmenu', 'Ouvrir le menu admin', 'keyboard', 'F10')

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('adminAction', function(data, cb)
    local action = data.action
    lib.callback(action, data.payload, function(result)
        cb(result)
    end)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
