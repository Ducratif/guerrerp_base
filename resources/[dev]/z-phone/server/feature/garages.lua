--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register('z-phone:server:GetVehicles', function(source, body)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then return {} end

   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")
    local query = xCore.queryPlayerVehicles()
    local result = MySQL.query.await(query, {
        citizenid
    })

    if not result then
        return {}
    end
    return result
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
