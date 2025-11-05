--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterNUICallback('get-profile', function(_, cb)
    lib.callback('z-phone:server:GetProfile', false, function(profile)
        cb(profile)
    end)
end)

RegisterNUICallback('update-profile', function(body, cb)
    lib.callback('z-phone:server:UpdateProfile', false, function(isOk)
        if isOk then
            lib.callback('z-phone:server:GetProfile', false, function(profile)
                Profile = profile
                cb(profile)
            end)
        end
    end, body)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
