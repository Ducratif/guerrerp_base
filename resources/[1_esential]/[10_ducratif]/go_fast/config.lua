--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
-- FILE: config.lua
Config = Config or {}

-- First contact PNJ locations
Config.StartPNJLocations = {
    vec3(-440.6706, 329.7207, 104.8230),
    vec3(-2183.6953, 200.3277, 194.6015),
    vec3(-1240.6501, -488.1510, 48.4692),
}
--tp -440.6706 329.7207 104.8230
--tp -2183.6953 200.3277 194.6015
--tp -1240.6501 -488.1510 48.4692

-- Middle delivery PNJ locations
Config.DeliveryPNJLocations = {
    vec3(-546.6352, 4803.0581, 89.8344),
    vec3(101.4044, 6331.6641, 44.4949),
    vec3(-546.8133, 5316.7563, 81.6909),
}

--tp -546.6352 4803.0581 89.8344
--tp 101.4044 6331.6641 44.4949
--tp -546.8133 5316.7563 81.6909

-- Final drop PNJ locations
Config.FinalPNJLocations = {
    vec3(171.9978, 2221.0540, 90.7887),
    vec3(-1889.1069, -592.3545, 18.3310),
}

--tp 171.9978 2221.0540 90.7887
--tp -1889.1069 -592.3545 18.3310


-- Position du PNJ qui donne un indice pour le mot de passe
Config.HelpPasswordPNJLocation = {
    { x = 1539.8910, y = 818.9819, z = 78.6424, heading = 90.0 }
}
--tp 1539.8910 818.9819 78.6424

-- Gain configuration
Config.Reward = {
    min = 15000,
    max = 30000
}

-- Temps limite pour avoir 100% des gain
Config.FullRewardTime = 900 -- 15 minutes




-- Liste des mots pour le mot de passe et leur description associée
Config.PasswordHintWords = {
    ["panthere"] = "Un animal vif et noir",
    ["nuage"] = "C'est dans le ciel et ça flotte.",
    ["valise"] = "Utilisée pour voyager.",
    ["carotte"] = "Un légume orange, souvent mangé par les lapins.",
    ["telephone"] = "Un appareil utilisé pour communiquer.",
    ["lumiere"] = "Ce qui éclaire dans l'obscurité.",
    ["fusee"] = "Véhicule utilisé pour aller dans l'espace.",
    ["girafe"] = "Un animal avec un long cou.",
    ["montagne"] = "Un grand sommet rocheux.",
    ["dragon"] = "Une créature mythologique souvent associée au feu."
}

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
