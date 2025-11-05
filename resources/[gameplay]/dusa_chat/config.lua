--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

--- @param -- Check https://lesimov.gitbook.io/dusa-docs for documentation
shared = {}
utils = {}
bridge = {}
core = nil

-- true => Show player's name in me, do, ooc
-- false => Name will not be shown 
Config.ShowName = true

--[[ 
    ME DO FPS CONFIGURATION
    1 is the most visual smooth option
    50 is optimum value
    100 is most optimization friendly value

    As the value decreases, performance loss occurs, but the image becomes smoother
    As the value increases, the image loses fluidity, but the performance increases.
]]
Config.MeDoSmoothness = 50

--[[ 
    QUICK COMMANDS
    Shortcut commands listed by default

]]
Config.UseQuickCommands = true
Config.QuickCommands = {
    "me",
    "do",
    "ooc",
    "revive me",
    "e sit",
}

Config.EnableOOC = true
Config.OOCCommand = 'ooc'
Config.EnableAnnouncement = true
Config.AnnounceCommand = 'announcement'

-- JOB CHAT
Config.JobChat = {
    ['police'] = 'police',
    ['ambulance'] = 'ambulance'
}

--[[ 
    LOGS
    Logs so you can keep track
]]
Config.LogBot = {
    webhook = "TON_WEBHOOK_DUCRATIF",
    color = 3092790,
    title = "GuerreRP Chat Logs",
    footerText = "Ducratif Log",
    footerIcon = "https://i.imgur.com/ZFTnNtr.png",
    botName = "Emote Log Bot",
    botAvatar = "https://i.imgur.com/ZFTnNtr.png",
}

Config.EnableAdminChat = true
Config.AdminChatCommand = "adminchat"
Config.AdminPerm = {
    "god",
    "admin",
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
