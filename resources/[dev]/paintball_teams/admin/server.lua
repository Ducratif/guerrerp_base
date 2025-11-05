--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin


RegisterNetEvent('paintball_admin:openMenuRequest', function(timestamp)
    local src = source
    print("📥 Requête menu reçue de :", src, timestamp)

    if not IsPlayerAdmin(src) then
        print("⛔ Refusé : pas admin")
        return
    end

    print("✅ Autorisé : on envoie le menu")
    TriggerClientEvent('paintball_admin:openMenu', src)
end)

-----------------------

--Protection anti-cheat
local IsPlayerAdmin = require 'admin.modules.permission'.IsPlayerAdmin

RegisterNetEvent('paintball_admin:openMenuRequest', function(timestamp)
    local src = source
    if not src or type(src) ~= "number" then return end

    local identifiers = GetPlayerIdentifiers(src)
    local name = GetPlayerName(src)

    local function getId(type)
        for _, v in ipairs(identifiers) do
            if string.sub(v, 1, #type) == type then return v end
        end
        return "Non trouvé"
    end

    local license = getId("license:")
    local discord = getId("discord:")
    local steam = getId("steam:")

    if not timestamp or type(timestamp) ~= "number" or timestamp < 1000 then
        LogToDiscord("🚨 Tentative suspecte (timestamp invalide)", (string.format(
            "**Nom**: %s\n**License**: %s\n**Steam**: %s\n**Discord**: %s\n**Cause**: Timestamp manquant/invalide",
            name, license, steam, discord
        )), 16711680)
        DropPlayer(src, "Tentative d'accès non autorisée au menu admin")
        return
    end

    if not IsPlayerAdmin(src) then
        LogToDiscord("❌ Tentative d'accès admin refusée", (string.format(
            "**Nom**: %s\n**License**: %s\n**Steam**: %s\n**Discord**: %s\n**Cause**: Non whitelisté",
            name, license, steam, discord
        )), 16744192)
        DropPlayer(src, "Tu n'as pas l'autorisation d'utiliser ce menu.")
        return
    end

    TriggerClientEvent('paintball_admin:openMenu', src)
end)


----Webhook anti-cheat
local function LogToDiscord(title, description, color)
    local config = require 'admin.config'

    if not config.AdminConfig.WebhookURL or config.AdminConfig.WebhookURL == "" then return end

    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color or 16711680,
            ["footer"] = {
                ["text"] = "Paintball Admin – GuerreRP",
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(config.AdminConfig.WebhookURL, function(err, text, headers) end, "POST", json.encode({
        username = "🛡️ Paintball Anticheat",
        embeds = embed
    }), { ["Content-Type"] = "application/json" })
end
---------------------------------------------------

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
