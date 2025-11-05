--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- ducratif_atmrob - Config
Config = {}

-- Activer la nécessité d'avoir un item pour braquer
Config.RequireItem = true
Config.RequiredItem = 'atm_kit' -- nom de l'item dans ox_inventory
Config.ConsumeItem = true       -- consommer 1 item en cas de réussite

-- Rang minimum requis (users.rp_rank)
Config.RequireRank = true
Config.MinRank = 10

-- ProgressBar (pré-hack)
Config.ProgressDuration = 15000 -- en ms
Config.ProgressLabel = '[GuerreRP] Bypass de sécurité de l\'ATM...'

-- Minijeu "liaison de câbles"
Config.Minigame = {
    TimeLimit = 20000, -- en ms
    Wires = 4          -- 4 couleurs: rouge, bleu, vert, jaune
}

-- Récompense (argent sale)
Config.RewardBlackMoney = 5000

-- Cooldown sur l'ATM en cas d'échec
Config.FailCooldownMinutes = 10

-- Cooldown si le braquage est réussi
Config.SuccessCooldownMinutes = 20


-- Animation pendant le bypass
-- type = 'scenario' ou 'anim'
-- Si 'anim', remplir dict/clip/flag
Config.Animation = {
    type = 'scenario',
    scenario = 'WORLD_HUMAN_WELDING',
    dict = 'mini@repair',
    clip = 'fixing_a_ped',
    flag = 49
}

-- Label du 3e oeil
Config.TargetLabel = "Braquer l'ATM"

-- Modèles d'ATM (modifiables)
Config.ATMModels = {
    'prop_atm_01',
    'prop_atm_02',
    'prop_atm_03',
    'prop_fleeca_atm'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
