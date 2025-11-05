--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Framework = 'esx'  -- Change this to 'qbcore' or 'standalone' as needed.

Config.EnableChatWebhook = true
Config.ReportLog = true
Config.Webhook = 'TON_WEBHOOK_DUCRATIF'
Config.ReportWebhook = 'TON_WEBHOOK_DUCRATIF'
Config.WebhookImageURL = 'https://example.com/logo.png'

Config.AllowDo = true -- Do command
Config.AllowMe = true -- Me command
Config.AllowPme = true -- Me command shows above head
Config.AllowOOC = false -- OOC command
Config.AllowPM = true -- Private Message command
Config.AllowFlipCoin = true -- Flip a coin command
Config.AllowRoll20 = true -- D20 dice roll command
Config.AllowAdvertise = true -- Ad command
Config.Announcement = true --Admin can announce
Config.AdminChat = true -- Admins can talk between them
Config.AdminRoles = { "admin", "staff", "mod" } -- Define allowed roles here

Config.ColorMe = '201, 204, 255'   -- Color for 'me' command (rgb(201, 204, 255)) pastel blue
Config.ColorPme = '255,204,204'  -- Color for 'ame' command (rgb(255, 204, 204)) pastel pink
Config.ColorDo = '255,255,204'   -- Color for 'do' command (rgb(255, 255, 204)) pastel yellow

Config.AllowPoliceOnlyCommand = true
Config.AllowEMSOnlyCommand = true

Config.PoliceJobName = 'police'
Config.EMSJobName = 'ambulance'

-- Custom Jobs--
Config.CommandCustom1 = 'customjob1' -- Change this to what you want the command to be 
Config.CustomJob1Name = 'unemployed' -- Change this to what you want the job custom 1 command is to be 
Config.AllowCustomJob1Command = true

Config.CommandCustom2 = 'customcommand2' -- Change this to what you want the command to be 
Config.CustomJob2Name = 'mechanic' -- Change this to what you want the job custom 2 command is to be 
Config.AllowCustomJob2Command = true

Config.CommandCustom3 = 'customcommand3' -- Change this to what you want the command to be 
Config.CustomJob3Name = 'farmer' -- Change this to what you want the job custom 3 command is to be 
Config.AllowCustomJob3Command = true

-- _____                                           _     
-- /  __ \                                         | |    
-- | /  \/ ___  _ __ ___  _ __ ___   __ _ _ __   __| |___ 
-- | |    / _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __|
-- | \__/\ (_) | | | | | | | | | | | (_| | | | | (_| \__ \
--  \____/\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/

-- The text box automatically has / in it so you dont need to type it. And if you hit TAB it brings you down to the command
                                                                                                           
-- do 
-- me 
-- pme 
-- ooc 
-- pm
-- roll20
-- flipcoin
-- ad
-- policeonly
-- emsonly

-- Then you have the custom jobs that you can pick the command for

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
