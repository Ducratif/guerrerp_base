--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}


-- Langage
Config.langage = {
    choix = "fr" -- ou "en"
}

Config.Distance = 50.0 --Distance pour délancher l'evenement
--ATTENTION:
--C'est aussi la zone dans laquel il faut rester pour combatre.

-- Items disponibles
Config.ItemList = {
    common  = {"burger", "water", "ciseaux_medicaux", "gants"},
    typical = {"money", "ammo-shotgun", "rod", "fish", "fish1", "fish2", "chiffon"},
    rare = {"ammo-9", "ammo-rifle", "medikit", "sponge"},
    legendary = {"WEAPON_PISTOL", "WEAPON_ADVANCEDRIFLE", "gpsill", "stimulant_vitesse"}
}



-- Configuration des groupes
Config.Groups = {
    facile = {
        spawnTime = 20, -- en minutes
        items = {
            common = { chance = 100 },--% de chance d'avoir ce genre d'item
            typical = { chance = 50 },
            rare = { chance = 0 },
            legendary = { chance = 0 }
        },
        pnj = {
            count = 10,--Nombre de pnj qui spawn
            weapons = {"WEAPON_PISTOL"},--Arme que les pnj auront
            outfits = {"a_m_m_eastsa_02"}--Tenu des pnj
        },
        ItemValeur = {--Quantité Minimum,maximum
            burger  = {"1", "3"},
            water = {"1", "2"},
            money = {"500", "800"}
        },
        position = vector3(-155.4622, -1080.6492, 30.1394)--Position du groupe
    },
    rude = {
        spawnTime = 40, -- en minutes
        items = {
            common = { chance = 100 },
            typical = { chance = 65 },
            rare = { chance = 10 },
            legendary = { chance = 1 }
        },
        pnj = {
            count = 15,
            weapons = {"WEAPON_MICROSMG"},
            outfits = { "a_m_m_hillbilly_01"}
        },
        ItemValeur = {
            burger  = {"1", "4"},--Quantité Minimum,maximum
            water = {"1", "3"},
            ciseaux_medicaux = {"1", "1"},
            gants = {"1", "1"},
            money = {"1000", "2500"},
            rod = {"1", "1"},
            fish = {"1", "5"},
            fish1 = {"1", "3"},
            --ammo-shotgun = {"1", "20"},
            sponge = {"1", "1"},
            WEAPON_PISTOL = {"1", "1"},
            gpsill = {"1", "1"}
        },
        position = vector3(-2306.3992, 393.1097, 175.0540)
    },
    ghost = {
        spawnTime = 100, -- en minutes
        items = {
            common = { chance = 100 },
            typical = { chance = 75 },
            rare = { chance = 30 },
            legendary = { chance = 15 }
        },
        pnj = {
            count = 20,
            weapons = {"WEAPON_BATTLERIFLE"},
            outfits = { "a_m_y_juggalo_01"}
        },
        ItemValeur = {
            money = {"2000", "3500"},
            WEAPON_PISTOL = {"1", "1"},
           -- ammo-9 = {"15", "30"},
            medikit = {"1", "1"}
        },
        position = vector3(837.7716, 2125.5190, 52.2955)
    },

    demon = {
        spawnTime = 120, -- en minutes
        items = {
            common = { chance = 0 },
            typical = { chance = 0 },
            rare = { chance = 0 },
            legendary = { chance = 100 }
        },
        pnj = {
            count = 40,
            weapons = {"WEAPON_RAILGUN"},
            outfits = { "g_m_y_mexgoon_01"}
        },
        ItemValeur = {
            money = {"50000", "100000"},
            WEAPON_ADVANCEDRIFLE = {"1", "1"},
            WEAPON_PISTOL = {"1", "1"},
            medikit = {"1", "5"},
            stimulant_vitesse  = {"1", "1"},
            gpsill  = {"1", "1"}
        },
        position = vector3(-1122.3669, 4928.1968, 218.7775)
    },
     --Tu peux ajouter d'autres groupes ici...
}


Config.fr = {
    langage_actuel = "Vous avez choisis Francais",
    inforamtion_distance = "[CHECK] Joueur %s est à %.2f mètres du groupe %s",
    log_erreur = "[LOG ERREUR] Impossible d'écrire dans le fichier",
    Sortie_de_zone = "Sortie de zone",
    Sortie_de_zone1 = "Tu as quitté la zone avant la fin du combat !",
    cooldown = "^1[COOLDOWN]^7 Groupe ^3%s^7 en cooldown pour ^6%.2f minutes^7",
    cooldown1 = "^2[READY]^7 Groupe ^3%s^7 prêt pour un nouveau spawn.",
    system_principal = "^6[Serveur]^7 Le groupe ",
    system_principals = " est en cooldown.",
    system_principal1 = "[ERREUR] Données manquantes pour le groupe",
    system_principal2 = "^2[SPAWN]^7 Groupe demandé pour spawn : ^3%s^7",
    system_principal3 = "^6[ACTIF]^7 Groupe ^3%s^7 encore actif, PNJ restants : ^2%d^7",
    resetGroup = "[RESET] Groupe",
    resetGroups = "non trouvé ou déjà libéré.",
    resetGroup_cooldown = "[COOLDOWN] Groupe %s en cooldown pendant %.2f minutes",
    resetGroup_spawn = "[READY] Groupe %s peut à nouveau être spawné.",
    confirmSpawn = "^3[CONFIRMATION]^7 Le groupe ^2%s^7 est maintenant ^2ACTIF^7 (confirmation client)",
    SpawnGroup = "[WARN] Groupe déjà actif ou en attente",
    SpawnGroup1 = "[Serveur] Spawn du groupe",
    pnjMort = "[SERVER] Le groupe",
    pnjMort1 = "n'existe pas ou a déjà été supprimé.",
    pnjMort2 = "[DEBUG] Joueur %s ajouté aux participants du groupe %s",
    pnjMort3 = "[INFO] Le joueur",
    pnjMort4 = "a été ajouté à la liste des participants.",
    pnjMort5 = "[SERVER] PNJ BIEN MORT pour le groupe :",
    pnjMort6 = "^6[MORT]^7 PNJ restants pour le groupe ^3%s^7 : ^2%d^7",
    pnjMort7 = "Ennemis Restants",
    pnjMort8 = "Restants",
    pnjMort9 = "[ERREUR] playersStillInZone est nil pour le groupe %s",
    pnjMort10 = "[INFO] Tous les PNJ du groupe ",
    pnjMorts10 = "sont morts, distribution des récompenses.",
    pnjMort11 = "[REWARD] Récompenses envoyées à %d joueur(s) dans la zone.",
    LogReward = "[%s] Groupe: %s | Joueur: %s [%s] | ID: %d a reçu une récompense.\n",
    RewardPlayer = "Récompense Annulée",
    RewardPlayer1 = "Tu avais quitté la zone !",
    RewardPlayer2 = "[REWARD] function RewardPlayer lancée pour joueur ID :",
    RewardPlayer3 = "[ERREUR] Données de récompense introuvables pour le groupe :",
    RewardPlayer4 = "[ERREUR] Impossible de trouver le joueur ESX avec l’ID :",
    RewardPlayer5 = "[GIVE] ^2%s^7 donné à ^3%s^7",
    RewardPlayer6 = "Récompense",
    RewardPlayer7 = "Tu as reçu : %s",
    rewardAll = "Récompense Annulée",
    rewardAll1 = "Tu avais quitté la zone !",
    CheckPlayersInZone = "[CHECK - Infos] Joueur %s est à %.2f mètres du groupe %s",
    notification_spawn = "Evenement de PUISSANCE",
    notification_spawn1 = "Le groupe %s a été déclenché !",
    enter_zone = "Attention",
    enter_zone1 = "Tu rentres dans une zone dangereuse !"
}

Config.en = {
    langage_actuel = "You have selected English",
    inforamtion_distance = "[CHECK] Player %s is %.2f meters from group %s",
    log_erreur = "[LOG ERROR] Unable to write to the file",
    Sortie_de_zone = "Left the zone",
    Sortie_de_zone1 = "You left the zone before the fight ended!",
    cooldown = "^1[COOLDOWN]^7 Group ^3%s^7 on cooldown for ^6%.2f minutes^7",
    cooldown1 = "^2[READY]^7 Group ^3%s^7 ready for a new spawn.",
    system_principal = "^6[Server]^7 The group ",
    system_principals = " is on cooldown.",
    system_principal1 = "[ERROR] Missing data for group",
    system_principal2 = "^2[SPAWN]^7 Requested spawn for group: ^3%s^7",
    system_principal3 = "^6[ACTIVE]^7 Group ^3%s^7 still active, NPCs remaining: ^2%d^7",
    resetGroup = "[RESET] Group",
    resetGroups = "not found or already released.",
    resetGroup_cooldown = "[COOLDOWN] Group %s on cooldown for %.2f minutes",
    resetGroup_spawn = "[READY] Group %s can now be spawned again.",
    confirmSpawn = "^3[CONFIRMATION]^7 Group ^2%s^7 is now ^2ACTIVE^7 (client confirmation)",
    SpawnGroup = "[WARN] Group already active or pending",
    SpawnGroup1 = "[Server] Spawning group",
    pnjMort = "[SERVER] Group",
    pnjMort1 = "does not exist or has already been removed.",
    pnjMort2 = "[DEBUG] Player %s added to participants of group %s",
    pnjMort3 = "[INFO] Player",
    pnjMort4 = "has been added to the participant list.",
    pnjMort5 = "[SERVER] NPC successfully killed for group:",
    pnjMort6 = "^6[DEAD]^7 NPCs remaining for group ^3%s^7: ^2%d^7",
    pnjMort7 = "Enemies Remaining",
    pnjMort8 = "Remaining",
    pnjMort9 = "[ERROR] playersStillInZone is nil for group %s",
    pnjMort10 = "[INFO] All NPCs of group ",
    pnjMorts10 = "are dead, distributing rewards.",
    pnjMort11 = "[REWARD] Rewards sent to %d player(s) in the zone.",
    LogReward = "[%s] Group: %s | Player: %s [%s] | ID: %d received a reward.\n",
    RewardPlayer = "Reward Canceled",
    RewardPlayer1 = "You had left the zone!",
    RewardPlayer2 = "[REWARD] RewardPlayer function called for player ID:",
    RewardPlayer3 = "[ERROR] Reward data not found for group:",
    RewardPlayer4 = "[ERROR] Could not find ESX player with ID:",
    RewardPlayer5 = "[GIVE] ^2%s^7 given to ^3%s^7",
    RewardPlayer6 = "Reward",
    RewardPlayer7 = "You received: %s",
    rewardAll = "Reward Canceled",
    rewardAll1 = "You had left the zone!",
    CheckPlayersInZone = "[CHECK - Info] Player %s is %.2f meters from group %s",
    notification_spawn = "Alert",
    notification_spawn1 = "The %s group has been triggered!",
    enter_zone = "WARNING",
    enter_zone1 = "You are entering a dangerous zone!"
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
