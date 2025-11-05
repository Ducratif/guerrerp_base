--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local WebHook = 'TON_WEBHOOK_DUCRATIF'

lib.callback.register('z-phone:server:HasPhone', function(source)
    return xCore.HasItemByName(source, 'phone')
end)

lib.callback.register('z-phone:server:GetWebhook', function(_)
    if WebHook ~= '' then
        return WebHook
    else
        print('Set your webhook to ensure that your camera will work!!!!!! Set this on line 10 of the server sided script!!!!!')
        return nil
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
