--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register('z-phone:server:GetEmails', function(source)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then return false end
    
   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")
    local query = [[
        SELECT 
            id,
            institution,
            citizenid,
            subject,
            content,
            is_read,
            DATE_FORMAT(created_at, '%d %b %Y %H:%i') as created_at
        FROM zp_emails WHERE citizenid = ? ORDER BY id DESC LIMIT 100
    ]]
    local result = MySQL.query.await(query, {citizenid})

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
