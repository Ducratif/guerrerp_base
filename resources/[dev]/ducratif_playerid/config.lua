--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

-- Third eye option
Config.Target = {
    enabled = true,
    label = 'ID Unique',
    icon = 'fa-solid fa-id-card', -- requires ox_target with FontAwesome
    distance = 2.0
}

-- Which unique identifier to display for the target
-- Allowed: 'identifier' (ESX xPlayer.identifier), 'license', 'steam', 'discord', 'fivem', 'ip', 'serverid'
Config.UniqueIdSource = 'identifier'

-- UI / actions shown to the requesting player
Config.UI = {
    showCopy = true,        -- shows a "Copier" action (copies to clipboard via ox_lib)
    showWebhook = true,     -- shows "Envoyer au staff" action (only visible if Config.Webhook.enabled = true)
    showDatabase = true     -- shows "Enregistrer en base" action (only visible if Config.Database.enabled = true)
}

-- Discord webhook settings
Config.Webhook = {
    enabled = true,
    url = 'TON_WEBHOOK_DUCRATIF', -- put your webhook here
    username = 'GuerreRP • Identifications',
    avatar = 'https://i.imgur.com/yhQcL9A.png',
    mentionRoleId = '1370056598126329856',    -- optional role to mention, leave '' to disable
    color = 16753920       -- embed color (decimal)
}

-- Database logging
Config.Database = {
    enabled = true
}

-- Anti-spam: seconds between actions per player
Config.RateLimitSeconds = 5

-- Debug / testing helpers
Config.Debug = {
    allowSelfTarget = true, -- allow targeting yourself (useful when testing alone)
    registerTestCommand = true -- registers /idunique [serverId] on client
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
