--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()

-- Debug function to log messages
local function debugLog(message)
    print("[DEBUG] " .. message)
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function sendToDiscord(url, title, text, content, src)
    local embed = {
        {
            ["color"] = 10038562,
            ["title"] = "Pager - " .. title,
            ["description"] = text,
        }
    }

    -- Always include player information (even for non-admins)
    local discord = ""

    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        end
    end

    discord = string.gsub(discord, "discord:", "")

    embed[1].fields = {
        {
            ["name"] = "Envoyer par",
            ["value"] = "<@" .. discord .. ">"
        }
    }

    -- Make the HTTP request and log any errors
    PerformHttpRequest(url, function(err, text, headers)
        if err ~= 200 then
           -- print("Error sending to Discord webhook: " .. tostring(err)) -- Log the error code
        else
           -- print("Successfully sent message to Discord webhook.") -- Log successful webhook call
        end
    end, 'POST', json.encode({username = "Pager", embeds = embed, content = content}), { ['Content-Type'] = 'application/json' })
end



local function page(tune, text, src)
    local pagerTune = Config.Pager[tune]

    if pagerTune == nil then
        TriggerClientEvent('esx:showNotification', src, "Le channel de cette page est inconnu!")
        return false
    end

    local xPlayer = ESX.GetPlayerFromId(src)
    local authorized = false

    if pagerTune.jobPermissions ~= nil then
        for _, v in ipairs(pagerTune.jobPermissions) do
            if (xPlayer.job.name == v) then
                authorized = true
                break
            end
        end

        if not authorized then
            TriggerClientEvent('esx:showNotification', src, "Vous n'êtes pas authentifié pour diffuser sur le canal paginé.")
            return false
        end
    end

    if pagerTune.discordPermissions ~= nil then
        authorized = exports["pv-discord-uac"]:doesUserHaveAnyRole(src, pagerTune.discordPermissions)

        if not authorized then
            TriggerClientEvent('esx:showNotification', src, "Vous n'êtes pas authentifié pour diffuser sur le canal paginé.")
            return false
        end
    end

    if pagerTune.jobPermissions == nil and pagerTune.discordPermissions == nil then authorized = true end

    if authorized then
        local players = ESX.GetPlayers()
        for _, playerId in ipairs(players) do
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if pagerTune.broadcastToJobs[targetPlayer.job.name] then
                if pagerTune.broadcastToRoles ~= nil then
                    if exports["pv-discord-uac"]:doesUserHaveAnyRole(playerId, pagerTune.broadcastToRoles) then
                        TriggerClientEvent("pv-pager:pager:received", playerId, text)
                    end
                else
                    TriggerClientEvent("pv-pager:pager:received", playerId, text)
                end
            end
        end
    end

    for k, v in ipairs(pagerTune.webhooks) do
        sendToDiscord(k, pagerTune.title, text, v)
    end

    sendToDiscord(Config.LogWebhook, pagerTune.title, text, "Nouvelle page", src, true)
end

local function SendPagerNotification(channel, message)
    local players = ESX.GetPlayers()

    -- Loop through all players and send the notification to the appropriate jobs
    for _, playerId in ipairs(players) do
        local Player = ESX.GetPlayerFromId(playerId)
        if Player and Player.job and table.contains(Config.Jobs, Player.job.name) then
            -- Send pager notification in-game
            TriggerClientEvent("pv-pager:pager:received", playerId, message)


            local characterName = Player.getName()  
            local logMessage = string.format("Pager message from %s: %s", characterName, message)
            sendToDiscord(Config.LogWebhook, "Pager Notification", logMessage, message, playerId)
        end
    end
end



-- ESX.RegisterCommand("page", "user", function(xPlayer, args, showError)
--     local pagerTune = args[1]
--     table.remove(args, 1)

--     local text = table.concat(args, " ")
--     page(pagerTune, text, xPlayer.source)
-- end, false)

-- Register the export
exports('SendPagerNotification', SendPagerNotification)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
