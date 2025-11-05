--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- 


Config = Config or {}
Config.Locales = {
    ["SAFEZONE"] = "Vous êtes <span> dans une zone sécurisée</span>",

    ["QUICK"] = "Rapide",
    ["VEHICLE"] = "Véhicule",
    ["MAP"] = "Carte",
    ["MEDIA"] = "Média",
    ["SETTINGS"] = "Paramètres",
    ["NOW_PLAYING"] = "Lecture en cours...",
    ["PLAYLIST_AMOUNT"] = "{0} Playlist",
    ["LIKES"] = "{0} J'aime",
    ["LIKES_2"] = "J'aime",
    ["ENABLE_TOP_WIDGET"] = "Activer le widget supérieur",
    ["DISABLE_TOP_WIDGET"] = "Désactiver le widget supérieur",
    ["CREATE_PLAYLIST"] = "Créer une nouvelle playlist",
    ["PLAYLIST_NAME"] = "Nom de la playlist...",
    ["COVER_URL"] = "URL de l'image de couverture",
    ["SONG_URL"] = "URL de la chanson...",
    ["ADD_SONGS"] = "Ajouter des chansons",
    ["ADD_SONG"] = "Ajouter une chanson",
    ["PLAY_INFO"] = "Lancez une chanson via Rapide ou une playlist.",
    ["PLAYLIST_INFO"] = "Voici des playlists partagées par d'autres joueurs !",

    ["PLAY"] = "JOUER",
    ["HELLO"] = "Bonjour {0}",
    ["DELETE_PLAYLIST_CONFIRM"] = "Êtes-vous sûr de vouloir supprimer cette playlist ?",
    ["YES"] = "OUI",
    ["NO"] = "NON",
    ["LIKE_PLAYLIST"] = "Aimer pour ajouter cette playlist à votre bibliothèque",
    ["EDIT"] = "MODIFIER",
    ["SEARCH"] = "Rechercher une playlist...",
    ["SET_WAYPOINT"] = "Cliquez pour définir un point de passage.",
    ["BONNET"] = "Capot",
    ["SEAT_1"] = "Siège 1",
    ["SEAT_2"] = "Siège 2",
    ["SEAT_3"] = "Siège 3",
    ["SEAT_4"] = "Siège 4",
    ["TRUNK"] = "Coffre",
    ["ALL"] = "TOUT",
    ["FRONT"] = "AVANT",
    ["LEFT"] = "GAUCHE",
    ["RIGHT"] = "DROITE",
    ["REAR"] = "ARRIÈRE",
    ["PARTY"] = "FÊTE",
    ["FRONT_LEFT"] = "AVANT GAUCHE",
    ["FRONT_RIGHT"] = "AVANT DROITE",
    ["REAR_LEFT"] = "ARRIÈRE GAUCHE",
    ["REAR_RIGHT"] = "ARRIÈRE DROITE",

    ["SPORT_MODE"] = "MODE SPORT",
    ["NORMAL_MODE"] = "MODE NORMAL",
    ["DRIFT_MODE"] = "MODE DRIFT",
    ["HUD_SETTINGS"] = "PARAMÈTRES HUD",
    ["DRAG_DROP"] = "Faites glisser les éléments HUD où vous le souhaitez",
    ["CLOSE"] = "Appuyez sur « ÉCHAP » pour fermer cet écran",
    ["RESTORE"] = "Réinitialiser par défaut",
    ["CHANGE_SETTINGS"] = "Modifier vos paramètres",
    ["COMPASS_LOCATION_INGAME"] = "Boussole, emplacement et heure en jeu",
    ["STATUS_HUD"] = "HUD d'état",
    ["INFO_MONEY_COIN"] = "Infos, argent et pièces",
    ["HELPER_WIDGETS"] = "Widgets d’aide",
    ["SPEEDOMETER"] = "Compteur de vitesse",
    ["FREEFORM_EDIT"] = "Édition libre",
    ["HIDE_HUD"] = "Cacher le HUD",
    ["CINEMATIC_MODE"] = "Mode cinématique",
    ["STREAMER_MODE"] = "Mode streamer",
    ["ENABLE_STREAMER_MODE"] = "Activer le mode streamer",
    ["STREAMER_MODE_DESC"] = "En activant ce mode, votre ID en jeu sera caché et vous n’entendrez pas les chansons média pour éviter les problèmes de droits d’auteur. Vous pouvez activer ces sons ci-dessous si vous le souhaitez.",
    ["PLAY_MEDIA_SONGS"] = "Jouer les chansons média",
    ["SHOW_MY_ID"] = "Afficher mon ID joueur",
    ["GO_BACK"] = "Retour",
    ["DISPLAY_SETTINGS"] = "Paramètres d’affichage",
    ["CUSTOMIZATION"] = "Personnalisation",
    ["DISPLAY_MODES"] = "Modes d’affichage",
    ["ORIGINAL_MODE"] = "Mode original",
    ["TEXT_MODE"] = "Mode texte",
    ["CIRCLE_HEALTH_ARMOR"] = "Santé et armure en cercle",
    ["DISPLAY_ALL"] = "Afficher tout",
    ["HIDE_HEALTH"] = "Cacher la santé",
    ["HIDE_MAP_OVERLAY"] = "Cacher la superposition de carte",
    ["DOORS"] = "PORTES",
    ["NEONS"] = "NÉONS",

    ["HIDE_ARMOR"] = "Cacher l’armure",
    ["HIDE_HUNGER"] = "Cacher la faim",
    ["HIDE_THIRST"] = "Cacher la soif",
    ["HIDE_STRESS"] = "Cacher le stress",
    ["HIDE_DYNAMIC_STATUS"] = "Cacher le statut dynamique",
    ["DYNAMIC_HUD_INFO"] = "Le statut dynamique inclut l’endurance, l’oxygène et l’altitude en parachute. Le désactiver les enlèvera du HUD.",
    ["HIDE_MIC"] = "Cacher micro et rayon",
    ["HIDE_COMPASS"] = "Cacher la boussole",
    ["HIDE_LOCATION"] = "Cacher l’emplacement",
    ["HIDE_IG_TIME"] = "Cacher l’heure en jeu",
    ["COMPASS_BEHAVIOUR"] = "Comportement de la boussole",
    ["COMPASS_COLOR"] = "Couleur de la boussole",
    ["LOCATION_TEXT_COLOR"] = "Couleur du texte d’emplacement",
    ["IG_TIME_TEXT_COLOR"] = "Couleur du texte de l’heure en jeu",
    ["HIDE_SPEEDOMETER"] = "Cacher le compteur",
    ["HIDE_RPM"] = "Cacher le compte-tours",
    ["HIDE_NITRO"] = "Cacher le niveau de nitro",
    ["NITRO"] = "Niveau de Nitro",
    ["RPM"] = "Compteur RPM",

    ["MONOCHROME_COLOR"] = "Couleur monochrome",
    ["COLOR_DESC"] = "Cette option applique une seule couleur à tous les éléments du compteur.",
    ["OUTER_CIRCLE"] = "Cercle extérieur",
    ["NON_HIGHLIGHTED_GAUGE_LINES"] = "Lignes non mises en valeur",
    ["HIGHLIGHTED_GAUGE_LINES"] = "Lignes mises en valeur",
    ["NITRO_STATUS"] = "Statut de la nitro",
    ["NITRO_TEXT"] = "Texte de la nitro",
    ["NEEDLE"] = "Aiguille",
    ["NEEDLE_CIRCLE"] = "Cercle de l’aiguille",
    ["INNER_SMALL_RPM_LINES"] = "Petites lignes intérieures RPM",
    ["HIGHLIGHTED_RPM_INDICATORS"] = "Indicateurs RPM en surbrillance",
    ["BURNOUT_WARN"] = "Avertissement de burn-out",
    ["RPM_TEXT"] = "Texte RPM",
    ["INNER_SMALL_SPEEDO_LINES"] = "Petites lignes intérieures du compteur",
    ["NON_HIGHLIGHTED_SPEED_INDICATORS"] = "Indicateurs de vitesse non en surbrillance",
    ["HIGHLIGHTED_SPEED_INDICATORS"] = "Indicateurs de vitesse en surbrillance",
    ["SPEED_INDICATOR"] = "Indicateur de vitesse",

    ["DEFAULT_SPEEDOMETER_INFO"] = "Cette personnalisation est uniquement pour le <span>compteur de base</span>. Les autres ne seront pas affectés.",
    ["SIZE_SETTINGS"] = "Paramètres de taille",
    ["SPEEDOMETER_SIZE"] = "Taille du compteur de vitesse",
    ["REVERT"] = "Réinitialiser",
    ["RPM_GAUGE_SIZE"] = "Taille du compteur RPM",
    ["NITRO_GAUGE_SIZE"] = "Taille de la jauge de nitro",
    ["SIZE_DESC"] = "Si les éléments se chevauchent, vous pouvez les repositionner dans les paramètres <span>Édition libre</span>.",
    ["SPEED_CALCULATOR"] = "Calculateur de vitesse",
    ["REFRESH_RATE"] = "Taux de rafraîchissement",
    ["LOW"] = "FAIBLE",
    ["MEDIUM"] = "MOYEN",
    ["HIGH"] = "ÉLEVÉ",
    ["REAL_TIME"] = "TEMPS RÉEL",
    ["REFRESH_RATE_DESC"] = "Un taux de rafraîchissement plus élevé peut <span>utiliser plus de CPU</span> et entraîner une baisse de FPS.",

    ["HUD_COLOR_DESC"] = "Cette option applique une couleur unique à tous les éléments du HUD.",

    ["HEALTH_COLOR"] = "Couleur de la santé",
    ["ARMOR_COLOR"] = "Couleur de l’armure",
    ["HUNGER_COLOR"] = "Couleur de la faim",
    ["THIRST_COLOR"] = "Couleur de la soif",
    ["STRESS_COLOR"] = "Couleur du stress",
    ["STAMINA_COLOR"] = "Couleur de l’endurance",
    ["OXYGEN_COLOR"] = "Couleur de l’oxygène",
    ["ALTITUDE_COLOR"] = "Couleur de l’altitude",
    ["MOUSE_MOVEMENT"] = "Mouvement de la souris",
    ["PLAYER_LOOK"] = "Regard du joueur",

    ["COMPASS_BEHAVIOUR_DESC"] = "Affiche le comportement de la boussole quand vous bougez la souris.",
    ["HIDE_WEAPON_WIDGET"] = "Cacher le widget des armes",
    ["HIDE_M_DRIVE_CONTROLS_WIDGET"] = "Cacher le widget de contrôle mDrive",
    ["HIDE_ACTION_KEYS_WIDGET"] = "Cacher le widget des touches d’action",
    ["HIDE_SAFEZONE_NOTIFY"] = "Cacher la notification de zone sécurisée",

    ["HIDE_SERVER_INFO"] = "Cacher les infos serveur",
    ["HIDE_CHARACTER_INFO"] = "Cacher les infos personnage",
    ["HIDE_BANK_MONEY"] = "Cacher l'argent en banque",
    ["HIDE_CASH_MONEY"] = "Cacher l'argent liquide",
    ["HIDE_SOCIETY_MONEY"] = "Cacher l'argent de société",
    ["HIDE_BLACK_MONEY"] = "Cacher l'argent sale",
    ["HIDE_COIN"] = "Cacher les pièces",
    ["BRAKE"] = "FREIN",
    ["BANK"] = "BANQUE",
    ["GAS_STATION"] = "STATION-SERVICE",
    ["MARKET"] = "MARCHÉ",
    ["CLOTHING_SHOP"] = "MAGASIN DE VÊTEMENTS",
    ["BARBER_SHOP"] = "COIFFEUR",
    ["TATTOO_SHOP"] = "TATTOEUR",
}

Config.Notifications = {
    ["ENGINE_ON"] = {
       type = "success",
       message = "Moteur démarré",
    },
    ["ENGINE_OFF"] = {
        type = "error",
        message = "Moteur éteint",
    },
    ["YOU_DONT_HAVE_ITEM"] = {
        type = "error",
        message = "Vous n'avez pas %s",
    },
    ["CRUISE_ENABLED"] = {
        type = "success",
        message = "Régulateur de vitesse activé",
    },
    ["CRUISE_DISABLED"] = {
        type = "error",
        message = "Régulateur de vitesse désactivé",
    },
    ["SIT_DRIVER_SEAT"] = {
        type = "error",
        message = "Vous devez être au siège conducteur pour installer la nitro",
    },
    ["NOT_IN_VEHICLE"] = {
        type = "error",
        message = "Vous n'êtes pas dans un véhicule",
    },
    ["HAS_ALREADY_NITRO"] = {
        type = "error",
        message = "Ce véhicule a déjà de la nitro",
    },
    ["INSTALLING_NITRO"] = {
        type = "info",
        message = "Installation de la nitro...",
    },
    ["NITRO_INSTALLED"] = {
        type = "success",
        message = "Nitro installée",
    },
    ["TOOK_SEATBELT"] = {
        type = "success",
        message = "Ceinture attachée",
    },
    ["TOOK_OFF_SEATBELT"] = {
        type = "error",
        message = "Ceinture détachée",
    },
    ["GETTING_STRESSED"] = {
        type = "error",
        message = "Montée de stress",
    },
    ["RELIEVED_STRESS"] = {
        type = "error",
        message = "Vous vous détendez",
    },
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
