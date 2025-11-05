--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local adminHex = {
    'steam:11000011799716e',
}
local afkPlayers = {}

RegisterNetEvent('tfg_afk:pleaseDontBlameMe')
AddEventHandler('tfg_afk:pleaseDontBlameMe', function()
    TriggerClientEvent('tfg_afk:butSomeoneIsActuallySellingThis', source, afkPlayers)
end)

RegisterCommand('afk', function(src, args)
    local argument = table.concat(args, " ", 1, #args) 
    if argument == '' then
        if afkPlayers[src] then
            afkPlayers[src] = nil
            TriggerClientEvent('tfg_afk:whyTwoEvents', src, false)
            TriggerClientEvent('tfg_afk:cringe', -1, 'remove', {sId = src})
        end
        return 
    end

    if args[1] ~= '' then
        if argument then
            afkPlayers[src] = argument

            local time = os.date("*t")
            TriggerClientEvent('tfg_afk:whyTwoEvents', src, true)
            TriggerClientEvent('tfg_afk:cringe', -1, 'add', {sId = src, text = '~b~- AFK -~w~\n~b~Depuis:~w~ '..time.hour..':'..time.min..'\n~b~Raison:~w~ '..argument})
        end
    end
end)

RegisterCommand('afkid', function(src, args)
    local plyId = tonumber(args[1])
    local argument = table.concat(args, " ", 2, #args)

    if not isAdmin(src) then return end

    if plyId == nil or GetPlayerPing(plyId) == 0 then
        -- add notify msg, mby?
        return 
    end

    if argument == '' then
        if afkPlayers[plyId] then
            afkPlayers[plyId] = nil
            TriggerClientEvent('tfg_afk:whyTwoEvents', plyId, false)
            TriggerClientEvent('tfg_afk:cringe', -1, 'remove', {sId = plyId})
        end
        return 
    end

    if args[1] ~= '' then
        if argument then
            afkPlayers[plyId] = argument

            local time = os.date("*t")
            TriggerClientEvent('tfg_afk:whyTwoEvents', plyId, true)
            TriggerClientEvent('tfg_afk:cringe', -1, 'add', {sId = plyId, text = '~b~- AFK -~w~\n~b~Temps:~w~ '..time.hour..':'..time.min..'\n~b~Raison:~w~ '..argument})
        end
    end
end, false)

function isAdmin(src)
    local srcSteam = GetPlayerIdentifiers(src)[1]
    local result = false
    for k, v in pairs(adminHex) do
        if v == srcSteam then
            result = true
            break
        end
    end
    return result
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
