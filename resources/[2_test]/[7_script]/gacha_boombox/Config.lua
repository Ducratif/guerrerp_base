--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = Config or {}
Config.framework = 'esx' --(qbcore/esx/custom)
Config.useItem = false
Config.fixSpeakersCommand = "fixSpeakers" --If speakers dont load use this command to reload all the speakers
Config.itemName = 'speaker' --You need to had this item created in your config or database
Config.timeZone = "Europe/Madrid" --IMPORTANT to set what time zone is your server in
Config.KeyAccessUi = 38
Config.KeyDeleteSpeaker = 194
Config.KeyToMove = 311
Config.KeyToPlaceSpeaker = 191
Config.KeyToChangeAnim = 311

Config.Translations = {
    notEnoughDistance = 'Vous devez réserver un peu plus de distance par rapport à l\'autre haut-parleur à proximité.',
    helpNotify = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au haut-parleur, ~INPUT_FRONTEND_RRIGHT~ pour le supprimer ou ~INPUT_REPLAY_SHOWHOTKEY~ pour tenir le boombox',
    libraryLabel = 'Votre bibliothèque - GuerreRP',
    newPlaylistLabel = 'Créer une nouvelle playlist',
    importPlaylistLabel = 'Importer une playlist existante',
    newPlaylist = 'Nouvelle playlist',
    playlistName = 'Nom de la playlist',
    addSong = 'Ajouter une chanson',
    deletePlaylist = 'Supprimer la playlist',
    unkown = 'Inconnu',
    titleFirstMessage = "Vous n'avez pas encore de playlist ?",
    secondFirstMessage = "Créez une playlist",
    holdingBoombox = 'Appuyez sur ~INPUT_FRONTEND_RDOWN~ pour poser le haut-parleur ou ~INPUT_REPLAY_SHOWHOTKEY~ pour changer l\'animation'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
