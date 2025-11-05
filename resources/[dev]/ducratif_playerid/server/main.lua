--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local function extractIdentifier(src, which)
    if which == 'identifier' then
        local xP = ESX.GetPlayerFromId(src)
        return xP and xP.identifier or ('serverid:'..src)
    end

    if which == 'serverid' then
        return ('serverid:'..src)
    end

    local ids = GetPlayerIdentifiers(src)
    for _, id in ipairs(ids) do
        if which == 'license' and id:find('license:', 1, true) then return id end
        if which == 'steam' and id:find('steam:', 1, true) then return id end
        if which == 'discord' and id:find('discord:', 1, true) then return id end
        if which == 'fivem' and id:find('fivem:', 1, true) then return id end
        if which == 'ip' and id:find('ip:', 1, true) then return id end
    end

    -- Fallback
    local xP = ESX.GetPlayerFromId(src)
    return (xP and xP.identifier) or ('serverid:'..src)
end

local function getNames(src, tgt)
    local xSrc = ESX.GetPlayerFromId(src)
    local xTgt = ESX.GetPlayerFromId(tgt)
    return (xSrc and xSrc.getName()) or ('ID '..src), (xTgt and xTgt.getName()) or ('ID '..tgt)
end

local lastUse = {}

local function rateLimited(src)
    local now = os.time()
    local last = lastUse[src] or 0
    if now - last < (Config.RateLimitSeconds or 5) then
        return true
    end
    lastUse[src] = now
    return false
end

lib.callback.register('ducratif_playerid:getUniqueForTarget', function(source, targetSid)
    local t = tonumber(targetSid or -1)
    if not t then return nil end
    local xT = ESX.GetPlayerFromId(t)
    if not xT then return nil end

    local unique = extractIdentifier(t, Config.UniqueIdSource)
    local sName, tName = getNames(source, t)

    return {
        unique = unique,
        tName = tName,
        sName = sName,
        tIdentifier = xT.identifier
    }
end)

RegisterNetEvent('ducratif_playerid:saveToDatabase', function(targetSid)
    local src = source
    if rateLimited(src) then
        TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Trop d\'actions, réessayez dans quelques secondes.')
        return
    end

    if not Config.Database.enabled then
        TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Sauvegarde DB désactivée.')
        return
    end

    local t = tonumber(targetSid or -1)
    if not t then return end
    local xSrc = ESX.GetPlayerFromId(src)
    local xTgt = ESX.GetPlayerFromId(t)
    if not xSrc or not xTgt then return end

    local unique = extractIdentifier(t, Config.UniqueIdSource)

    local ok = MySQL.insert.await([[
        INSERT INTO ducratif_identifications
        (requester_identifier, requester_name, requester_source, target_identifier, target_name, unique_id)
        VALUES (?, ?, ?, ?, ?, ?)
    ]], {
        xSrc.identifier, xSrc.getName(), src, xTgt.identifier, xTgt.getName(), unique
    })

    if ok then
        TriggerClientEvent('ducratif_playerid:notify', src, 'success', 'Identification sauvegardée en base.')
    else
        TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Échec de la sauvegarde en base.')
    end
end)

RegisterNetEvent('ducratif_playerid:sendToWebhook', function(targetSid)
    local src = source
    if rateLimited(src) then
        TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Trop d\'actions, réessayez dans quelques secondes.')
        return
    end

    if not Config.Webhook.enabled or not Config.Webhook.url or Config.Webhook.url == '' then
        TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Webhook désactivé.')
        return
    end

    local t = tonumber(targetSid or -1)
    if not t then return end

    local xSrc = ESX.GetPlayerFromId(src)
    local xTgt = ESX.GetPlayerFromId(t)
    if not xSrc or not xTgt then return end

    local unique = extractIdentifier(t, Config.UniqueIdSource)
    local mention = (Config.Webhook.mentionRoleId and Config.Webhook.mentionRoleId ~= '') and ('<@&'..Config.Webhook.mentionRoleId..'> ') or ''

    local payload = {
        username = Config.Webhook.username or 'Identification',
        avatar_url = Config.Webhook.avatar or nil,
        content = mention .. '**Nouvelle identification joueur**',
        embeds = {{
            title = 'ID Unique',
            description = ('**%s** → **%s**'):format(xSrc.getName(), xTgt.getName()),
            color = Config.Webhook.color or 16753920,
            fields = {
                { name = 'Unique ID', value = ('``%s``'):format(unique), inline = false },
                { name = 'Requester', value = ('%s\n`%s` (sid %s)'):format(xSrc.getName(), xSrc.identifier or 'n/a', src), inline = true },
                { name = 'Target', value = ('%s\n`%s` (sid %s)'):format(xTgt.getName(), xTgt.identifier or 'n/a', t), inline = true }
            },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
        }}
    }

    PerformHttpRequest(Config.Webhook.url, function(code, data, headers)
        if code >= 200 and code < 300 then
            TriggerClientEvent('ducratif_playerid:notify', src, 'success', 'Envoyé au staff.')
        else
            TriggerClientEvent('ducratif_playerid:notify', src, 'error', 'Envoi webhook échoué ('..tostring(code)..').')
        end
    end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
