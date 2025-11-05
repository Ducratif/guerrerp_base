--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNetEvent('ledjo_paint:server:setLocationBusy', function(pos, value)
    TriggerClientEvent('ledjo_paint:client:setLocationBusy', -1, pos, value)
end)

RegisterNetEvent('ledjo_paint:server:initalizePaint', function(id, vehicle, color, isPrimary)
    TriggerClientEvent('ledjo_paint:client:initalizePaint', -1, id, vehicle, color, isPrimary)
end)

RegisterNetEvent('ledjo_paint:server:stopPaint', function(id)
    TriggerClientEvent('ledjo_paint:client:stopPaint', -1, id)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
