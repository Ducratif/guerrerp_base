--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX.RegisterServerCallback('job_transport_pl:giveReward', function(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addAccountMoney('cash', amount)
        TriggerClientEvent('esx:showNotification', source, "Vous avez reçu ~g~" .. amount .. "€ ~s~en liquide.")
        --ExecuteCommand(('esxp_give %s %d'):format(source, 100))
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
