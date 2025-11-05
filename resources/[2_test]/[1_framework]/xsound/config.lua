--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
config = {}

-- How much ofter the player position is updated ?
config.RefreshTime = 300

-- default sound format for interact
config.interact_sound_file = "ogg"

-- is emulator enabled ?
config.interact_sound_enable = true

-- how much close player has to be to the sound before starting updating position ?
config.distanceBeforeUpdatingPos = 40

-- Message list
config.Messages = {
    ["streamer_on"]  = "Le mode Streamer est activé. Désormais, vous n'entendrez plus de musique ni de son.",
    ["streamer_off"] = "Le mode Streamer est désactivé. Vous pourrez désormais écouter la musique diffusée par les joueurs.",

    ["no_permission"] = "Vous ne pouvez pas utiliser cette commande, vous n'avez pas les autorisations pour cela !",
}

-- Addon list
-- True/False enabled/disabled
config.AddonList = {
    crewPhone = true,
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
