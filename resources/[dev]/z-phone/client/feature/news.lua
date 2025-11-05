--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNUICallback('get-news', function(_, cb)
    lib.callback('z-phone:server:GetNews', false, function(news)
        cb(news)
    end)
end)

RegisterNUICallback('create-news', function(body, cb)
    lib.callback('z-phone:server:CreateNews', false, function(news)
        cb(news)
    end, body)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
