--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local discordList = {}

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    Wait(0)

    deferrals.update("[Ducratif] Vérification de ton Discord...")

    local discord
    local identifiers = GetPlayerIdentifiers(src)

    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "discord:" then
            discord = id:gsub("discord:", "")
            break
        end
    end

    if not discord then
        deferrals.done("[Ducratif] ❌ Tu dois ouvrir Discord pour rejoindre le serveur.")
        CancelEvent()
        return
    end

    discordList[src] = discord

    Wait(100)

    local license
    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "license:" then
            --license = id
            license = id:gsub("license:", "")
            break
        end
    end

    if not license then
        deferrals.done("[Ducratif] ❌ Impossible de récupérer ton identifiant.")
        CancelEvent()
        return
    end

    -- Recherche si le discord est banni ou lié
    local result = MySQL.query.await('SELECT * FROM discord_users WHERE discord_id = ?', { discord })

    if result[1] then
        local existing = result[1]

        if existing.banned == 1 then
            deferrals.done("[Ducratif] ❌ Ton compte Discord est banni du serveur.")
            CancelEvent()
            return
        end

        if existing.identifier ~= license then
            deferrals.done("[Ducratif] ❌ Ce Discord est déjà lié à un autre personnage.\nContacte un admin.")
            CancelEvent()
            return
        end
    else
        -- Enregistrement de l'association
        MySQL.update('REPLACE INTO discord_users (discord_id, identifier) VALUES (?, ?)', {
            discord, license
        }, function(rowsChanged)
            print(('[Discord] Lien établi : %s → %s'):format(discord, license))
        end)
    end

    deferrals.done()
end)

AddEventHandler('playerDropped', function(reason)
    discordList[source] = nil
end)

-- Export pour accéder à l'ID Discord
exports('getDiscord', function(source)
    return discordList[source]
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
