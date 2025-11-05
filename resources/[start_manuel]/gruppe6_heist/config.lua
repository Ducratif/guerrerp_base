--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Copsneeded = 0

Config.Item = "weapon_crowbar" -- item needed to start robbing

Config.Timer = 60-- how long you want to rob for (progressbar / payout time)

Config.Timeout = 7200 -- Timeout before robbing another truck (1 hour Seconds)

Config.BlipTimer = 180 -- Blip timer  until removed (3 min in seconds)

Config.Payouts = {
    { chance = 33, items = { 'thermite', 'oxycutter', 'security_card_01', 'security_card_03' }, amount = { math.random(1,3), math.random(1,3), 1, 1 } },
    { chance = 41, items = { 'thermite', 'oxycutter', 'security_card_03' }, amount = { math.random(1,3), math.random(1,3), 1 } },
    { chance = 26, items = { 'thermite', 'oxycutter', 'secure_card', 'security_card_04', 'security_card_01' }, amount = { math.random(1,3), math.random(1,3), 1, 1, 1 } },
    { chance = 5, items = { 'thermite', 'oxycutter', 'secure_card', 'security_card_02', 'security_card_04', 'laserdrill' }, amount = { math.random(1,3), math.random(1,3), 3, 1, 1, 1 } },
}

Config.MoneyPayout = { min = 40, max = 80 }  -- Min and Max amounts for black money  per loot (every timer second)

Config.Webhook = 'TON_WEBHOOK_DUCRATIF'  -- Replace with your actual Discord Webhook URL

-- If you wish to add your own police notification script, change line 81 server side. At the moment it is a pager system.

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
