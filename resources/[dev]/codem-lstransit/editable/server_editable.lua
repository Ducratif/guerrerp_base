--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
bot_Token = "TOKEN_BOT_DISCORD"
bot_logo = "https://i.imgur.com/LDWuek5.png"
bot_name = "LSTRANSIT"

discord_webhook = {
    ['jobfinish'] =
    "TON_WEBHOOK_DUCRATIF",
}

local playerKeys = {}
local usedNonces = {}
activePlayerJobMoney = {}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while Core == nil do
        Citizen.Wait(0)
    end
    RegisterCallback('codem-busjob:getKey', function(source, cb)
        if not playerKeys[source] then
            playerKeys[source] = "CODEM" ..
                math.random(10000, 999999999) .. "LSTRANSIT" .. math.random(10000, 999999999) .. os.time()
        end
        cb(playerKeys[source])
    end)
    RegisterCallback('codem-busjob:getJobMoney', function(source, cb)
        local src = source
        local money = activePlayerJobMoney[src] or 0
        cb(money)
    end)
end)

RegisterServerEvent('codem-busjob:updateJobMoney', function(money, cheater)
    local src = source
    local money = tonumber(money) or 0
    if money then
        if not activePlayerJobMoney[src] then
            activePlayerJobMoney[src] = 0
        end
        activePlayerJobMoney[src] = money
    end
    if cheater then
        local historyData = {
            ['routename'] = "Cheater Detected",
            ['abbreviation'] = "Cheater Detected",
            ['passenger'] = money,
            ['money'] = activePlayerJobMoney[src],
            ['time'] = os.date("%m-%d-%Y %H:%M")
        }
        local discordlog = discordloghistoryData(src, historyData)
        sendDiscordLogHistory(discordlog)
        print('[Ducratif] Busjob Cheater Detected1')
        --DropPlayer(src, 'Codem Busjob Cheater.')
    end
end)


RegisterServerEvent('codem-busjob:finishJob', function(clientkey, money, npccount, stopname, totalstopNumber)
    local totalstopNumber = tonumber(totalstopNumber) - 1
    local src = source
    local identifier = GetIdentifier(src)

    if playerKeys[src] ~= clientkey or usedNonces[clientkey] then
        -- DropPlayer(src, 'Codem Busjob Event Trigger.')
        print('[Ducratif] Busjob Cheater Detected 2')
        return
    end
    usedNonces[clientkey] = true
    local totalStops = 0
    for k, v in pairs(Config.BusjobSettings['busStops']) do
        if k == stopname then
            totalStops = #v
            break
        end
    end

    if tonumber(totalstopNumber) ~= tonumber(totalStops) then
        local historyData = {
            ['routename'] = "Cheater Detecte",
            ['abbreviation'] = "Cheater Detecte",
            ['passenger'] = money,
            ['money'] = activePlayerJobMoney[src],
            ['time'] = os.date("%m-%d-%Y %H:%M")
        }
        local discordlog = discordloghistoryData(src, historyData)
        sendDiscordLogHistory(discordlog)
        -- DropPlayer(src, 'Codem Busjob Cheater.')
        print('[Ducratif] Busjob Cheater Detected 3')
        return
    end

    local maxEarnings = 0

    for _, v in pairs(Config.BusjobSettings['busStops'][stopname]) do
        if tonumber(v.npcPrice) and tonumber(v.npcCount) then
            maxEarnings = maxEarnings + (v.npcPrice * v.npcCount)
        end
    end    
    
    print(money, maxEarnings)
    if tonumber(money) ~= tonumber(maxEarnings) then
        local historyData = {
            ['routename'] = "Cheater Detecte",
            ['abbreviation'] = "Cheater Detecte",
            ['passenger'] = money,
            ['money'] = activePlayerJobMoney[src],
            ['time'] = os.date("%m-%d-%Y %H:%M")
        }
        local discordlog = discordloghistoryData(src, historyData)
        sendDiscordLogHistory(discordlog)
        print('[Ducratif] Busjob Cheater Detected 4')
        -- DropPlayer(src, 'Codem Busjob Cheater.')
        return
    end 

    for k, v in pairs(Config.BusjobSettings['busRouteSettings']) do
        if v.name == stopname then
            local data = playerJobData[GetIdentifier(src)]
            if not data then
                return
            end

            if tonumber(activePlayerJobMoney[src]) ~= tonumber(money) then
                local historyData = {
                    ['routename'] = "Cheater Detecte",
                    ['abbreviation'] = "Cheater Detecte",
                    ['passenger'] = money,
                    ['money'] = activePlayerJobMoney[src],
                    ['time'] = os.date("%m-%d-%Y %H:%M")
                }
                local discordlog = discordloghistoryData(src, historyData)
                sendDiscordLogHistory(discordlog)
                print('[Ducratif] Busjob Cheater Detected4')
                -- DropPlayer(src, 'Codem Busjob Cheater.')
                return
            end

            AddMoney(src, 'cash', tonumber(money))
            AddXPBusJob(src, tonumber(v.xp))
            data.profiledata.completejobs = data.profiledata.completejobs + 1
            data.profiledata.totalearnings = data.profiledata.totalearnings + tonumber(money)
            data.profiledata.passenger = data.profiledata.passenger + tonumber(npccount)
            local historyData = {
                ['routename'] = v.label,
                ['abbreviation'] = v.abbreviation,
                ['passenger'] = npccount,
                ['money'] = money,
                ['time'] = os.date("%m-%d-%Y %H:%M")
            }
            table.insert(data.historydata, historyData)
            local discordlog = discordloghistoryData(src, historyData)
            sendDiscordLogHistory(discordlog)

            local function updateDailyMission(missionType, increment)
                for _, missionConfig in pairs(Config.BusjobSettings['dailyMission']) do
                    if missionConfig.name == missionType and not data.dailymission[missionType].complete then
                        data.dailymission[missionType].count = data.dailymission[missionType].count + increment
                        if data.dailymission[missionType].count >= missionConfig.count then
                            data.dailymission[missionType].complete = true
                            AddXPBusJob(src, tonumber(missionConfig.xp))
                            Config.Notification(
                                string.format(Config.NotificationText['completedailymission'].text, missionConfig.xp),
                                Config.NotificationText['completedailymission'].type, true, src)
                        end
                    end
                end
            end

            for missionType, _ in pairs(data.dailymission) do
                if missionType == 'transportpassenger' then
                    updateDailyMission(missionType, npccount)
                elseif missionType == 'completeoneroute' then
                    updateDailyMission(missionType, 1)
                elseif missionType == 'earninoneroute' then
                    updateDailyMission(missionType, money)
                end
            end

            savePlayerData(src)
        end
    end

    playerKeys[src] = "CODEM" ..
        math.random(10000, 999999999) .. "LSTRANSIT" .. math.random(10000, 999999999) .. os.time()
end)


function discordloghistoryData(source, data)
    local src = source
    local identifier = GetIdentifier(src)
    local dataInfo = {
        identifier = identifier,
        avatar = GetDiscordAvatar(src) or Config.ExampleProfilePicture,
        name = GetName(src),
        id = src,
        routename = data.routename,
        abbreviation = data.abbreviation,
        passenger = data.passenger,
        money = data.money,
    }
    return dataInfo
end

function sendDiscordLogHistory(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'LSTRANSIT FINI',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Nom du Joueur", value = data.name or false, inline = true },
                    { name = "ID Du joueur",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Job Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Route",   value = data.routename or false,                 inline = true },
                    { name = "Abbreviation", value = data.abbreviation or 'undefined',        inline = true },
                    { name = "Passage",    value = tonumber(data.passenger) or 'undefined', inline = true },
                    { name = "Job Prix",    value = tonumber(data.money) or 'undefined',     inline = true },

                },
                footer = {
                    text = "LSTRANSIT JOB | Ducratif - https://discord.gg/kpD8pQBBWm",
                    icon_url = bot_logo
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['jobfinish'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

Citizen.CreateThread(function()
    print('[Ducratif] Script OK ;)')
    --local resource_name = 'codem_lstransit'
    --local current_version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
    --PerformHttpRequest('https://raw.githubusercontent.com/Aiakos232/versionchecker/main/version.json',
    --    function(error, result, headers)
    --        if not result then
    --            print('^1Version check disabled because github is down.^0')
    --            return
    --        end
    --        local result = json.decode(result)
    --        if tonumber(result[resource_name]) ~= nil then
    --            if tonumber(result[resource_name]) > tonumber(current_version) then
    --                print('\n')
    --                print('^1======================================================================^0')
    --                print('^1' .. resource_name ..
    --                    ' is outdated, new version is available: ' .. result[resource_name] .. '^0')
    --                print('^1======================================================================^0')
    --                print('\n')
    --            elseif tonumber(result[resource_name]) == tonumber(current_version) then
    --                print('^2' .. resource_name .. ' is up to date! -  ^4 Thanks for choose CodeM ^4 ^0')
    --            elseif tonumber(result[resource_name]) < tonumber(current_version) then
    --                print('^3' .. resource_name .. ' is a higher version than the official version!^0')
    --            end
    --        else
    --            print('^1' .. resource_name .. ' is not in the version database^0')
    --        end
    --    end, 'GET')
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
