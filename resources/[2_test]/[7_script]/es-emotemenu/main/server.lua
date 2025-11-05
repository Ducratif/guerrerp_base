--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterServerEvent('syncAnimation')
AddEventHandler('syncAnimation', function(playerId, category, animArgs)
    print(GetCurrentResourceName(), playerId, category, animArgs)
    TriggerClientEvent('syncAnimationToClients', -1, playerId, category, animArgs) 
end)


RegisterServerEvent('requestStopAnimationForAll')
AddEventHandler('requestStopAnimationForAll', function()
    TriggerClientEvent('stopAnimationForAll', -1) 
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
