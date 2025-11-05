--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterCommand('arevive', function(src, args)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local grp = xPlayer.getGroup()
    if not grp or (grp ~= 'admin' and grp ~= 'mod' and grp ~= 'superadmin') then
        TriggerClientEvent('chat:addMessage', src, { args = { '^1Erreur', 'Permission refusée' } })
        return
    end

    local target = src
    if args[1] and tostring(args[1]):lower() ~= 'me' then
        local id = tonumber(args[1])
        if id and GetPlayerPing(id) > 0 then target = id end
    end
    TriggerClientEvent('ducratif_revive:do', target)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
