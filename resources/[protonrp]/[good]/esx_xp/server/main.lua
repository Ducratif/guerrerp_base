--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

function GetPlayerLicense(id)
    local xPlayer = ESX.GetPlayerFromId(id)

    if xPlayer and xPlayer ~= nil then
        return xPlayer.identifier
    end

    return false
end

------
-- GetOnlinePlayers
--
-- @param playerId          - The player's id
-- @param players           - The list of players pulled from the DB
--
-- Fetches the online players from the list pulled form the DB
------
function GetOnlinePlayers(playerId, players)
    local Active = {}

    for _, playerId in ipairs(GetPlayers()) do
        local name = GetPlayerName(playerId)
        local license = GetPlayerLicense(playerId)

        for k, v in pairs(players) do
            if license == v.license or license == v.identifier then
                local Player = {
                    name = name,
                    id = playerId,
                    xp = v.rp_xp,
                    rank = v.rp_rank
                }

                -- Current player
                if GetPlayerLicense(playerId) == license then
                    Player.current = true
                end
                            
                if Config.Leaderboard.ShowPing then
                    Player.ping = GetPlayerPing(playerId)
                end
    
                table.insert(Active, Player)
                break
            end
        end
    end

    return Active 
end

------
-- UpdatePlayer
--
-- @param playerId          - The player's id
-- @param xp                - The player's current XP
-- @param rank              - The player's current rank
--
-- Fetches active players and initialises for current player
------
function FetchActivePlayers(playerId, xp, rank)
    MySQL.Async.fetchAll('SELECT * FROM users', {}, function(players)
        if #players > 0 then
            TriggerClientEvent("esx_xp:init", playerId, xp, rank, GetOnlinePlayers(playerId, players))
        end
    end)
end

------
-- UpdatePlayer
--
-- @param playerId          - The player's id
-- @param xp                - The XP value to set
--
-- Updates the given user's XP
------
function UpdatePlayer(playerId, xp)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xp == nil or not IsInt(xp) then
        TriggerClientEvent("esx_xp:print", playerId, _("err_type_check", "XP", "integer"))

        return
    end

    if xPlayer ~= nil then
        local goalXP = LimitXP(tonumber(xp))
        local goalRank = GetRankFromXP(goalXP)

        MySQL.Async.execute('UPDATE users SET rp_xp = @xp, rp_rank = @rank WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
            ['@xp'] = goalXP,
            ['@rank'] = goalRank
        }, function(result)
            xPlayer.set("xp", goalXP)
            xPlayer.set("rank", goalRank)

            -- Update the player's XP bar
            xPlayer.triggerEvent("esx_xp:update", goalXP, goalRank)
        end)
    end
end


------------------------------------------------------------
--                        EVENTS                          --
------------------------------------------------------------

RegisterNetEvent("esx_xp:load")
AddEventHandler("esx_xp:load", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            if #result > 0 then

                if result[1]["rp_xp"] == nil or result[1]["rp_rank"] == nil then
                    TriggerClientEvent("esx_xp:print", _source, _("err_db_columns"))
                else
                    local CurrentXP = tonumber(result[1]["rp_xp"])
                    local CurrentRank = tonumber(result[1]["rp_rank"])  

                    xPlayer.set("xp", CurrentXP)
                    xPlayer.set("rank", CurrentRank)       
                    
                    if Config.Leaderboard.Enabled then
                        FetchActivePlayers(_source, CurrentXP, CurrentRank)
                    else
                        TriggerClientEvent("esx_xp:init", _source, CurrentXP, CurrentRank, false)
                    end
                end
            else
                TriggerClientEvent("esx_xp:print", _source, _("err_db_user"))
            end
        end)
    end
end)

-- Set the current player XP
RegisterNetEvent("esx_xp:setXP")
AddEventHandler("esx_xp:setXP", function(xp)
    UpdatePlayer(source, xp)
end)

-- Fetch Players Data
RegisterNetEvent("esx_xp:getPlayerData")
AddEventHandler("esx_xp:getPlayerData", function()
    local _source = source
    MySQL.Async.fetchAll('SELECT * FROM users', {}, function(players)
        if #players > 0 then     
            TriggerClientEvent("esx_xp:setPlayerData", _source, GetOnlinePlayers(_source, players))
        end
    end) 
end)

RegisterNetEvent("esx_xp:setInitial")
AddEventHandler("esx_xp:setInitial", function(playerId, XPInit)
    if IsInt(XPInit) then
        UpdatePlayer(playerId, XPInit)
    end
end)

RegisterNetEvent("esx_xp:addXP")
AddEventHandler("esx_xp:addXP", function(playerId, XPAdd)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer ~= nil then
        if IsInt(XPAdd) then
            local NewXP = tonumber(xPlayer.get("xp")) + XPAdd
            UpdatePlayer(playerId, NewXP)
        end
    end
end)

RegisterNetEvent("esx_xp:removeXP")
AddEventHandler("esx_xp:removeXP", function(playerId, XPRemove) 
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer ~= nil then
        if IsInt(XPRemove) then
            local NewXP = tonumber(xPlayer.get("xp")) - XPRemove
            UpdatePlayer(playerId, NewXP)
        end
    end
end)

RegisterNetEvent("esx_xp:setRank")
AddEventHandler("esx_xp:setRank", function(playerId, Rank)
    local GoalRank = tonumber(Rank)

    if not GoalRank then
        --
    else
        if Config.Ranks[GoalRank] ~= nil then
            UpdatePlayer(playerId, tonumber(Config.Ranks[GoalRank].XP))
        end
    end
end)


------------------------------------------------------------
--                    ADMIN COMMANDS                      --
------------------------------------------------------------

function DisplayError(playerId, message)
    TriggerClientEvent('chat:addMessage', playerId, {
        color = { 255, 0, 0 },
        args = { "esx_xp", message }
    })    
end
 
RegisterCommand("esxp_give", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(playerId)
    
    if xPlayer == nil then
        return DisplayError(source, _('err_invalid_player'))
    end

    local xp = tonumber(args[2])

    if not xp then
        return DisplayError(source, _('err_invalid_type', "XP", 'integer'))
    end

    UpdatePlayer(playerId, tonumber(xPlayer.get("xp")) + xp)
end, true)

--[[
    RegisterCommand("esxp_take", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(playerId)
    
    if xPlayer == nil then
        return DisplayError(source, _('err_invalid_player'))
    end

    local xp = tonumber(args[2])

    if not xp then
        return DisplayError(source, _('err_invalid_type', "XP", 'integer'))
    end    
    
    UpdatePlayer(playerId, tonumber(xPlayer.get("xp")) - xp)
end, true) 

RegisterCommand("esxp_set", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(playerId)
    
    if xPlayer == nil then
        return DisplayError(source, _('err_invalid_player'))
    end

    local xp = tonumber(args[2])

    if not xp then
        return DisplayError(source, _('err_invalid_type', "XP", 'integer'))
    end  

    UpdatePlayer(playerId, xp)
end, true)
]]--

RegisterCommand("esxp_rank", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(playerId)
    
    if xPlayer == nil then
        return DisplayError(source, _('err_invalid_player'))
    end

    local goalRank = tonumber(args[2])

    if not goalRank then
        return DisplayError(source, _('err_invalid_type', "Rank", 'integer'))
    end

    if goalRank < 1 or goalRank > #Config.Ranks then
        return DisplayError(source, _('err_invalid_rank', #Config.Ranks))
    end

    local xp = Config.Ranks[goalRank].XP

    UpdatePlayer(playerId, xp)
end, true)


------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
--                        GIFT                            --
------------------------------------------------------------

-- Argent: xPlayer.addMoney(1000)
-- Item: exports.ox_inventory:AddItem(src, "weapon_pistol", 1)

--RegisterNetEvent("esx_xp:rankUpReward")
--AddEventHandler("esx_xp:rankUpReward", function(rank)
--    local src = source
--    local xPlayer = ESX.GetPlayerFromId(src)
--    if not xPlayer then return end
--
--    if rank == 2 then
--        xPlayer.addMoney(1000)
--        TriggerClientEvent('ox_lib:notify', src, {
--            title = '🎖️ Progression',
--            description = 'Rang 2 atteint : +1 000$',
--            type = 'success'
--        })
--
--    elseif rank == 3 then
--        exports.ox_inventory:AddItem(src, "weapon_pistol", 1)
--        TriggerClientEvent('ox_lib:notify', src, {
--            title = '🎖️ Progression',
--            description = 'Rang 3 atteint : tu reçois un Pistolet',
--            type = 'inform'
--        })
--
--    elseif rank == 67 then
--        xPlayer.addAccountMoney('black_money', 5000)
--        TriggerClientEvent('ox_lib:notify', src, {
--            title = '🎖️ Progression',
--            description = 'Rang 67 atteint : +5000$ argent sale',
--            type = 'warning'
--        })
--    end
--end)

RegisterNetEvent("esx_xp:rankUpReward")
AddEventHandler("esx_xp:rankUpReward", function(rank)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    if rank == 2 then
        xPlayer.addMoney(2000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 2 atteint : +2,000$',
            type = 'success'
        })

    elseif rank == 3 then
        xPlayer.addMoney(3000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 3 atteint : +3,000$',
            type = 'success'
        })

    elseif rank == 4 then
        xPlayer.addMoney(4000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 4 atteint : +4,000$',
            type = 'success'
        })

    elseif rank == 5 then
        xPlayer.addMoney(5000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 5 atteint : +5,000$',
            type = 'success'
        })

    elseif rank == 6 then
        xPlayer.addMoney(6000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 6 atteint : +6,000$',
            type = 'success'
        })

    elseif rank == 7 then
        xPlayer.addMoney(7000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 7 atteint : +7,000$',
            type = 'success'
        })

    elseif rank == 8 then
        xPlayer.addMoney(8000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 8 atteint : +8,000$',
            type = 'success'
        })

    elseif rank == 9 then
        xPlayer.addMoney(9000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 9 atteint : +9,000$',
            type = 'success'
        })

    elseif rank == 10 then
        xPlayer.addMoney(10000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 10 atteint : +10,000$',
            type = 'success'
        })

    elseif rank == 11 then
        xPlayer.addMoney(11000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 11 atteint : +11,000$',
            type = 'success'
        })

    elseif rank == 12 then
        xPlayer.addMoney(12000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 12 atteint : +12,000$',
            type = 'success'
        })

    elseif rank == 13 then
        xPlayer.addMoney(13000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 13 atteint : +13,000$',
            type = 'success'
        })

    elseif rank == 14 then
        xPlayer.addMoney(14000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 14 atteint : +14,000$',
            type = 'success'
        })

    elseif rank == 15 then
        xPlayer.addMoney(15000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 15 atteint : +15,000$',
            type = 'success'
        })

    elseif rank == 16 then
        xPlayer.addMoney(16000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 16 atteint : +16,000$',
            type = 'success'
        })

    elseif rank == 17 then
        xPlayer.addMoney(17000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 17 atteint : +17,000$',
            type = 'success'
        })

    elseif rank == 18 then
        xPlayer.addMoney(18000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 18 atteint : +18,000$',
            type = 'success'
        })

    elseif rank == 19 then
        xPlayer.addMoney(19000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 19 atteint : +19,000$',
            type = 'success'
        })

    elseif rank == 20 then
        xPlayer.addMoney(20000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 20 atteint : +20,000$',
            type = 'success'
        })

    elseif rank == 21 then
        xPlayer.addMoney(21000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 21 atteint : +21,000$',
            type = 'success'
        })

    elseif rank == 22 then
        xPlayer.addMoney(22000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 22 atteint : +22,000$',
            type = 'success'
        })

    elseif rank == 23 then
        xPlayer.addMoney(23000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 23 atteint : +23,000$',
            type = 'success'
        })

    elseif rank == 24 then
        xPlayer.addMoney(24000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 24 atteint : +24,000$',
            type = 'success'
        })

    elseif rank == 25 then
        xPlayer.addMoney(25000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 25 atteint : +25,000$',
            type = 'success'
        })

    elseif rank == 26 then
        xPlayer.addMoney(26000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 26 atteint : +26,000$',
            type = 'success'
        })

    elseif rank == 27 then
        xPlayer.addMoney(27000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 27 atteint : +27,000$',
            type = 'success'
        })

    elseif rank == 28 then
        xPlayer.addMoney(28000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 28 atteint : +28,000$',
            type = 'success'
        })

    elseif rank == 29 then
        xPlayer.addMoney(29000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 29 atteint : +29,000$',
            type = 'success'
        })

    elseif rank == 30 then
        xPlayer.addMoney(30000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 30 atteint : +30,000$',
            type = 'success'
        })

    elseif rank == 31 then
        xPlayer.addMoney(31000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 31 atteint : +31,000$',
            type = 'success'
        })

    elseif rank == 32 then
        xPlayer.addMoney(32000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 32 atteint : +32,000$',
            type = 'success'
        })

    elseif rank == 33 then
        xPlayer.addMoney(33000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 33 atteint : +33,000$',
            type = 'success'
        })

    elseif rank == 34 then
        xPlayer.addMoney(34000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 34 atteint : +34,000$',
            type = 'success'
        })

    elseif rank == 35 then
        xPlayer.addMoney(35000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 35 atteint : +35,000$',
            type = 'success'
        })

    elseif rank == 36 then
        xPlayer.addMoney(36000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 36 atteint : +36,000$',
            type = 'success'
        })

    elseif rank == 37 then
        xPlayer.addMoney(37000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 37 atteint : +37,000$',
            type = 'success'
        })

    elseif rank == 38 then
        xPlayer.addMoney(38000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 38 atteint : +38,000$',
            type = 'success'
        })

    elseif rank == 39 then
        xPlayer.addMoney(39000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 39 atteint : +39,000$',
            type = 'success'
        })

    elseif rank == 40 then
        xPlayer.addMoney(40000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 40 atteint : +40,000$',
            type = 'success'
        })

    elseif rank == 41 then
        xPlayer.addMoney(41000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 41 atteint : +41,000$',
            type = 'success'
        })

    elseif rank == 42 then
        xPlayer.addMoney(42000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 42 atteint : +42,000$',
            type = 'success'
        })

    elseif rank == 43 then
        xPlayer.addMoney(43000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 43 atteint : +43,000$',
            type = 'success'
        })

    elseif rank == 44 then
        xPlayer.addMoney(44000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 44 atteint : +44,000$',
            type = 'success'
        })

    elseif rank == 45 then
        xPlayer.addMoney(45000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 45 atteint : +45,000$',
            type = 'success'
        })

    elseif rank == 46 then
        xPlayer.addMoney(46000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 46 atteint : +46,000$',
            type = 'success'
        })

    elseif rank == 47 then
        xPlayer.addMoney(47000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 47 atteint : +47,000$',
            type = 'success'
        })

    elseif rank == 48 then
        xPlayer.addMoney(48000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 48 atteint : +48,000$',
            type = 'success'
        })

    elseif rank == 49 then
        xPlayer.addMoney(49000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 49 atteint : +49,000$',
            type = 'success'
        })

    elseif rank == 50 then
        xPlayer.addMoney(50000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 50 atteint : +50,000$',
            type = 'success'
        })

    elseif rank == 51 then
        xPlayer.addMoney(51000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 51 atteint : +51,000$',
            type = 'success'
        })

    elseif rank == 52 then
        xPlayer.addMoney(52000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 52 atteint : +52,000$',
            type = 'success'
        })

    elseif rank == 53 then
        xPlayer.addMoney(53000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 53 atteint : +53,000$',
            type = 'success'
        })

    elseif rank == 54 then
        xPlayer.addMoney(54000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 54 atteint : +54,000$',
            type = 'success'
        })

    elseif rank == 55 then
        xPlayer.addMoney(55000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 55 atteint : +55,000$',
            type = 'success'
        })

    elseif rank == 56 then
        xPlayer.addMoney(56000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 56 atteint : +56,000$',
            type = 'success'
        })

    elseif rank == 57 then
        xPlayer.addMoney(57000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 57 atteint : +57,000$',
            type = 'success'
        })

    elseif rank == 58 then
        xPlayer.addMoney(58000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 58 atteint : +58,000$',
            type = 'success'
        })

    elseif rank == 59 then
        xPlayer.addMoney(59000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 59 atteint : +59,000$',
            type = 'success'
        })

    elseif rank == 60 then
        xPlayer.addMoney(60000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 60 atteint : +60,000$',
            type = 'success'
        })

    elseif rank == 61 then
        xPlayer.addMoney(61000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 61 atteint : +61,000$',
            type = 'success'
        })

    elseif rank == 62 then
        xPlayer.addMoney(62000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 62 atteint : +62,000$',
            type = 'success'
        })

    elseif rank == 63 then
        xPlayer.addMoney(63000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 63 atteint : +63,000$',
            type = 'success'
        })

    elseif rank == 64 then
        xPlayer.addMoney(64000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 64 atteint : +64,000$',
            type = 'success'
        })

    elseif rank == 65 then
        xPlayer.addMoney(65000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 65 atteint : +65,000$',
            type = 'success'
        })

    elseif rank == 66 then
        xPlayer.addMoney(66000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 66 atteint : +66,000$',
            type = 'success'
        })

    elseif rank == 67 then
        xPlayer.addMoney(67000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 67 atteint : +67,000$',
            type = 'success'
        })

    elseif rank == 68 then
        xPlayer.addMoney(68000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 68 atteint : +68,000$',
            type = 'success'
        })

    elseif rank == 69 then
        xPlayer.addMoney(69000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 69 atteint : +69,000$',
            type = 'success'
        })

    elseif rank == 70 then
        xPlayer.addMoney(70000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 70 atteint : +70,000$',
            type = 'success'
        })

    elseif rank == 71 then
        xPlayer.addMoney(71000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 71 atteint : +71,000$',
            type = 'success'
        })

    elseif rank == 72 then
        xPlayer.addMoney(72000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 72 atteint : +72,000$',
            type = 'success'
        })

    elseif rank == 73 then
        xPlayer.addMoney(73000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 73 atteint : +73,000$',
            type = 'success'
        })

    elseif rank == 74 then
        xPlayer.addMoney(74000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 74 atteint : +74,000$',
            type = 'success'
        })

    elseif rank == 75 then
        xPlayer.addMoney(75000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 75 atteint : +75,000$',
            type = 'success'
        })

    elseif rank == 76 then
        xPlayer.addMoney(76000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 76 atteint : +76,000$',
            type = 'success'
        })

    elseif rank == 77 then
        xPlayer.addMoney(77000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 77 atteint : +77,000$',
            type = 'success'
        })

    elseif rank == 78 then
        xPlayer.addMoney(78000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 78 atteint : +78,000$',
            type = 'success'
        })

    elseif rank == 79 then
        xPlayer.addMoney(79000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 79 atteint : +79,000$',
            type = 'success'
        })

    elseif rank == 80 then
        xPlayer.addMoney(80000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 80 atteint : +80,000$',
            type = 'success'
        })

    elseif rank == 81 then
        xPlayer.addMoney(81000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 81 atteint : +81,000$',
            type = 'success'
        })

    elseif rank == 82 then
        xPlayer.addMoney(82000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 82 atteint : +82,000$',
            type = 'success'
        })

    elseif rank == 83 then
        xPlayer.addMoney(83000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 83 atteint : +83,000$',
            type = 'success'
        })

    elseif rank == 84 then
        xPlayer.addMoney(84000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 84 atteint : +84,000$',
            type = 'success'
        })

    elseif rank == 85 then
        xPlayer.addMoney(85000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 85 atteint : +85,000$',
            type = 'success'
        })

    elseif rank == 86 then
        xPlayer.addMoney(86000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 86 atteint : +86,000$',
            type = 'success'
        })

    elseif rank == 87 then
        xPlayer.addMoney(87000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 87 atteint : +87,000$',
            type = 'success'
        })

    elseif rank == 88 then
        xPlayer.addMoney(88000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 88 atteint : +88,000$',
            type = 'success'
        })

    elseif rank == 89 then
        xPlayer.addMoney(89000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 89 atteint : +89,000$',
            type = 'success'
        })

    elseif rank == 90 then
        xPlayer.addMoney(90000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 90 atteint : +90,000$',
            type = 'success'
        })

    elseif rank == 91 then
        xPlayer.addMoney(91000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 91 atteint : +91,000$',
            type = 'success'
        })

    elseif rank == 92 then
        xPlayer.addMoney(92000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 92 atteint : +92,000$',
            type = 'success'
        })

    elseif rank == 93 then
        xPlayer.addMoney(93000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 93 atteint : +93,000$',
            type = 'success'
        })

    elseif rank == 94 then
        xPlayer.addMoney(94000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 94 atteint : +94,000$',
            type = 'success'
        })

    elseif rank == 95 then
        xPlayer.addMoney(95000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 95 atteint : +95,000$',
            type = 'success'
        })

    elseif rank == 96 then
        xPlayer.addMoney(96000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 96 atteint : +96,000$',
            type = 'success'
        })

    elseif rank == 97 then
        xPlayer.addMoney(97000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 97 atteint : +97,000$',
            type = 'success'
        })

    elseif rank == 98 then
        xPlayer.addMoney(98000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 98 atteint : +98,000$',
            type = 'success'
        })

    elseif rank == 99 then
        xPlayer.addMoney(99000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 99 atteint : +99,000$',
            type = 'success'
        })

    elseif rank == 100 then
        xPlayer.addMoney(100000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = '🎖️ Progression',
            description = 'Rang 100 atteint : +100,000$',
            type = 'success'
        })

    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
