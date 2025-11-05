--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}
Config.Locale = GetConvar("esx:locale", "fr")

-- [Config.EnableCommands]
-- Enables Commands Such As /char and /chardel
Config.EnableCommands = ESX.GetConfig().EnableDebug

-- These values are for the date format in the registration menu
-- Choices: DD/MM/YYYY | MM/DD/YYYY | YYYY/MM/DD
Config.DateFormat = "DD/MM/YYYY"

-- These values are for the second input validation in server/main.lua
Config.MaxNameLength = 20 -- Max Name Length.
Config.MinHeight = 120 -- 120 cm lowest height
Config.MaxHeight = 220 -- 220 cm max height.
Config.LowestYear = 1900 -- 112 years old is the oldest you can be.
Config.HighestYear = 2005 -- 18 years old is the youngest you can be.

Config.FullCharDelete = true -- Delete all reference to character.
Config.EnableDebugging = ESX.GetConfig().EnableDebug -- prints for debugging :)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
