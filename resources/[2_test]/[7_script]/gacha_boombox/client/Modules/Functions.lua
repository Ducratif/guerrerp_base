--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Cbs = {}

RegisterNetEvent('TriggerCallback', function(name, ...)
    if Cbs[name] then
        Cbs[name](...)
        Cbs[name] = nil
    end
end)

function TriggerCallback(name, cb, ...)
    Cbs[name] = cb
    TriggerServerEvent('TriggerCallback', name, ...)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
