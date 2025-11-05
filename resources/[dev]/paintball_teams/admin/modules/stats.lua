--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

RegisterNetEvent('paintball_admin:viewTeamScores', function()
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local result = MySQL.query.await([[
        SELECT name, score FROM paintball_teams ORDER BY score DESC LIMIT 10
    ]])

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🏆 Top Équipes",
        description = table.concat(vim.tbl_map(function(t)
            return ('%s – %s pts'):format(t.name, t.score)
        end, result), '\n'),
        duration = 10000,
        type = "inform"
    })
end)
------------------------------
RegisterNetEvent('paintball_admin:viewTopPlayers', function()
    local src = source
    if not IsPlayerAdmin(source) then return nil end


    local result = MySQL.query.await([[
        SELECT users.firstname, pp.score, pp.total_kills
        FROM paintball_players pp
        JOIN users ON users.identifier = pp.identifier
        ORDER BY pp.score DESC LIMIT 5
    ]])

    TriggerClientEvent('ox_lib:notify', src, {
        title = "🎯 Top Joueurs",
        description = table.concat(vim.tbl_map(function(p)
            return ('%s – %s pts | %s kills'):format(p.firstname, p.score, p.total_kills)
        end, result), '\n'),
        duration = 10000,
        type = "inform"
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
