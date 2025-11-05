--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

-- Liste des modules activables
Config.Modules = {
    player = true,
    vehicle = true,
    grades = true,
    staff = true,
    settings = true,
    reports = true
}

-- Liste des permissions dynamiques, à compléter si tu ajoutes des modules
Config.Permissions = {
    kick_player      = {label = "Kick un joueur"},
    ban_player       = {label = "Ban un joueur"},
    warn_player      = {label = "Warn un joueur"},
    jail_player      = {label = "Jail un joueur"},
    spectate_player  = {label = "Spectate un joueur"},
    give_item        = {label = "Give un item"},
    give_money       = {label = "Give de l'argent"},
    tp_to_player     = {label = "Se TP sur un joueur"},
    tp_player        = {label = "TP un joueur sur soi"},
    revive_player    = {label = "Revive un joueur"},
    heal_player      = {label = "Heal un joueur"},
    freeze_player    = {label = "Freeze un joueur"},
    setjob_player    = {label = "Changer le job d'un joueur"},
    see_inventory    = {label = "Voir l'inventaire d'un joueur"},
    clear_inventory  = {label = "Wipe l'inventaire d'un joueur"},
    manage_grades    = {label = "Gérer les grades"},
    manage_staff     = {label = "Gérer les membres staff"},
    vehicle_spawn    = {label = "Spawn un véhicule"},
    vehicle_give     = {label = "Give un véhicule"},
    vehicle_delete   = {label = "Supprimer un véhicule"},
    vehicle_repair   = {label = "Réparer un véhicule"},
    settings_access  = {label = "Accéder aux paramètres"},
    reports_access   = {label = "Accéder à la gestion des reports"}
}

-- Grade "ROI" par défaut (créé à l'install)
Config.ROIIdentifier = "cf872e2dbff1cf3152fff72b147ca07238315148" -- à remplacer par ton identifier ESX
Config.DefaultGrades = {
    {name = "roi", label = "ROI", color = "#ffcc00", permissions = "*"},
    {name = "admin", label = "Admin", color = "#007bff", permissions = {"kick_player","ban_player","warn_player","jail_player","spectate_player","give_item","give_money","tp_to_player","tp_player","revive_player","heal_player","freeze_player","setjob_player","see_inventory","clear_inventory","manage_staff","vehicle_spawn","vehicle_give","vehicle_delete","vehicle_repair","settings_access","reports_access"}}
    -- Tu rajoutes tes grades de base ici
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
