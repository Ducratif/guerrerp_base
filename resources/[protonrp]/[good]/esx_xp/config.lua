--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Locale       = 'en'

Config.Enabled      = true  -- enable / disable the resource
Config.Width        = 532   -- Sets the width of the XP bar in px
Config.Timeout      = 5000 -- Sets the interval in ms that the XP bar is shown before fading out
Config.BarSegments  = 10    -- Sets the number of segments the XP bar has. Native GTA:O is 10
Config.UIKey        = 20    -- The key that toggles the UI - default is "Z"
Config.XpToWin      = 250   -- XP que l'on gagne a chaque fois
Config.TimeToWait   = 300000 -- Temps Avant de Gagné l'EXP (en ms)


Config.Leaderboard = {
    Enabled     = false,    -- Enable / Disable the leaderboard
    ShowPing    = false,     -- Show player pings on the leaderboard
    Order       = "rank",   -- Order the player list by "name", "rank" or "id"
    PerPage     = 12        -- Max players to show per page
}

--Donner de l'xp a un joueur pour d'autre script:
--ExecuteCommand(('esxp_give %s %d'):format(source, 100))

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
