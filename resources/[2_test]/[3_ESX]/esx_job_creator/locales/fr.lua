--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
locales['en'] = {
    -- [[ Generic ]]
    ["interact"] = "Appuyez sur ~INPUT_CONTEXT~ pour interagir",
    ["billing_reason"] = "Raison de facturationn",
    ["billing_amount"] = "Montant de facturation",
    ["no_players_nearby"] = "Aucun joueur à proximité",
    ["no_vehicles_nearby"] = "Aucun véhicule à proximité",
    ["invoice_sent"] = "~g~$%s~s~ facture envoyée",
    ["too_far"] = "Loin",
    
    -- [[ Actions menu ]]
    ['open_actions_menu'] = "Ouvrir le menu des actions",
    ['actions_menu'] = "Menu d'action",
    ['actions_billing'] = "Montant",
    ['actions_search'] = "Chercher",
    ['actions_put_handcuffs'] = "Menotte",
    ['actions_start_dragging'] = "Traîner",
    ['actions_put_in_car'] = "Mettre en voiture",
    ['actions_take_from_car'] = "Prendre de la voiture",
    ['actions_menu_search'] = "Chercher un joueur",
    ['actions_lockpick_car'] = "crochetage de Voiture",
    ['no_car_found'] = "Aucune voiture proche trouvée",
    ['not_locked_vehicle'] = "Ce véhicule n'est pas verrouillé",
    ['you_need_lockpick'] = "Vous avez besoin d'un ~r~lockpick~s~",
    ['lockpick_used'] = "Vous avez utilisé un ~r~lockpick~s~",
    ['actions:lockpick:lockpickingVehicle'] = "Crochetage de Véhicule",
    ['actions_menu_search_took'] = "Tu à ~g~pris~s~ ~y~x%d %s~s~",
    ['actions_menu_search_stolen'] = "~y~x%d %s~s~ on ta ~r~voler~s~",
    ['actions_menu_search_took_money'] = "Tu ~g~a pris~s~ ~y~$%s %s~s~",
    ['actions_menu_search_stolen_money'] = "~y~$%s %s~s~ on ta ~r~pris~s~",
    ['actions_menu_search_doesnt_have_weapon'] = "Le joueur ~r~n'a pas~ cette arme",
    ['actions_menu_search_took_weapon'] = "Vous avez ~g~pris~ ~y~%s~s~ avec ~y~%d balles~s~",
    ['actions_menu_search_stolen_weapon'] = "~y~%s~s~ avec ~y~%d balles~s~ vous a été ~r~volé~s~",
    ['you_need_handcuffs'] = "Tu as besoin de ~r~menottes~s~",
    ['not_handcuffed'] = "La personne n'est pas ~r~menotte~s~",
    ['cant_while_dragging'] = "Vous ne pouvez pas faire cela en faisant glisser",
    ['search_inventory_empty'] = "Inventaire vide",
    ['actions_menu_being_searched'] = "Vous êtes recherché",
    ['actions:wash_vehicle'] = "Laver le véhicule",
    ['actions:washing_vehicle'] = "Lavage du Véhicule",
    ['actions:repair_vehicle'] = "Réparer Véhicule",
    ['actions:repairing_vehicle'] = "Réparation du véhicule",
    ['actions:no_vehicles_close'] = "Véhicule non vérouiller",
    ['actions:impound_vehicle'] = "Mettre en fourrière",
    ['actions:impounding_vehicle'] = "Mise en fourrière",
    ['actions:you_need'] = "Vous avez besoin ~y~%s~s~",
    ['actions:check_identity'] = "vérifier l'identité",
    ['actions:check_vehicle_owner'] = "Vérifier le propriétaire du véhicule",
    ['actions:checkVehicleOwner:owner'] = "Le véhicule appartient à ~y~%s~s~",
    ['actions:checkVehicleOwner:owner_not_found'] = "Propriétaire du véhicule introuvable",
    ['actions:checkVehicleOwner:car_not_found'] = "Véhicule non vérouiller",
    ['actions:checkIdentity:no_player_found'] = "Personne proche",
    ['actions:checkIdentity:player_found'] = "Nom du citoyen trouvé: ~y~%s~s~",
    ['actions:checkIdentity:somebody_checked_your_id'] = "~y~Somebody~s~ Regarde votre identité",

    -- [[ Stash stuff ]]
    ["open_stash"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la réserve",
    ["deposited"] = "Vous avez déposer ~b~x%d~s~ ~y~%s~s~",
    ["not_enough"] = "Pas assez ~y~%s~s~",
    ["no_space"] = "Vous n'avez pas de place",
    ["took"] = "tu as pris ~b~x%d~s~ ~y~%s~s~",
    ["impossible_take"] = "Impossible d'obtenir x%d %s",
    ["empty_inventory"] = "Votre inventaire est vide",
    ["empty_stash"] = "La réserve est vide",
    ['stash'] = "Planque",
    ['stash_take'] = "Cachette - Prendre",
    ['stash_deposit'] = "Cachette - Dépôt",
    ['quantity'] = "Quantité",
    ['invalid_quantity'] = "Quantité non valide",
    ['deposit'] = "Déposer",
    ['take'] = "Prendre",

    -- [[ Wardrobe stuff ]]
    ["open_wardrobe"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l'armoire",
    ['player_clothes'] = "Vos tenues",
    ['remove_cloth'] = "Supprimer la tenue",
    ['save_cloth'] = "Enregistrer la tenue actuelle",
    ['you_saved_outfit'] = "Tenue enregistrée",
    ['delete_outfit'] = "Tenue supprimé",
    ['clothes'] = "Vêtements",
    ['outfit_label_empty'] = "Le nom de la tenue ne peut pas être vide",
    ['outfit_name'] = "Le nom de votre tenue",
    ["wardrobe:empty"] = "La garde-robe est vide",
    ["wardrobe:delete"] = "%s - <span style='color:red'>Supprimer</span>",

    -- [[ Boss Stuff ]]
    ["open_boss"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu du gérant",
    ["not_boss"] = "Tu n'es pas le gérant",
    ["boss_menu"] = "Gérant menu",
    ["boss:society_money"] = "<span style='color:green'>L'argent de la société: $%s</span>",
    ["boss:withdraw"] = "<span style='color:green'>Retirer l'argent de la société</span>",
    ["boss:deposit"] = "<span style='color:green'>Déposer l'argent de la société</span>",
    ["boss:wash_money"] = "<span style='color:red'>Laver l'argent</span>",
    ["boss:grades"] = "<span style='color:blue'>Gérer les salaires</span>",
    ["boss:employees"] = "<span style='color:blue'>Gérer les employés</span>",
    ["boss:withdraw_amount"] = "Montant du retrait",
    ["boss:deposit_amount"] = "Montant du dépôt",
    ["boss:you_dont_have_enough_money"] = "Tu n'as pas assez d'argent",
    ["boss:invalid_amount"] = "Montant invalide",
    ["boss:withdrew_money"] = "Vous avez retiré~g~$%s~s~",
    ["boss:deposited_money"] = "Vous avez déposé ~g~$%s~s~",
    ["boss:rank_salary"] = "%s - <span style='color:green'>$%s</span>",
    ["boss:new_salary"] = "Nouveau salaire",
    ["boss:grade_salary_updated"] = "~y~Salaire~s~ ~g~mis à jour~s~",
    ["boss:grade_salary_not_updated"] = "~r~Impossible de mettre à jour~s~ ~y~salaire de grade~s~",
    ["boss:employees_list"] = "Liste Employer",
    ["boss:recruit"] = "Recruté",
    ["boss:employee"] = "%s %s - <span style='color:blue'>%s</span>",
    ["boss:fire"] = "<span style='color:red'>Feu</span>",
    ["boss:change_grade"] = "<span style='color:blue'>Change grade</span>",
    ["boss:are_you_sure"] = "Êtes vous sur ?",
    ["boss:cancel"] = "Annulé",
    ["boss:employee_fired"] = "Employer ~r~VIRER~s~",
    ["boss:you_got_hired"] = "Vous avez ~g~embauché~s~ dans ~b~%s~s~",
    ["boss:you_hired"] = "Vous ~g~embauché~s~ %s",
    ["boss:nobody_close"] = "Personne proche",
    ["boss:grade"] = "%d. %s - Salaire <span style='color:green'>$%s</span>",
    ["boss:changed_grade_successfully"] = "J'ai changé de note avec succès",
    ["boss:your_grade_changed_to"] = "Votre note a changé en ~b~%s~s~",
    ["boss:how_much_to_wash"] = "Combien d'argent veux-tu laver ?",
    ["boss:you_washed_money"] = "Vous avez lavé ~r~$%s~s~ et avez reçu ~g~$%s~s~",
    ["boss:not_enough_dirty_money"] = "Vous n'avez pas assez d'~r~argent~s~",
    ["boss:couldnt_wash_money"] = "Je n'ai pas pu laver l'argent",

    -- [[ Garage Stuff ]]
    ["open_garage"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le garage",
    ["garage"] = "Garage",
    ["take_vehicle"] = "Prendre un véhicule",
    ["park_vehicle"] = "Garer le véhicule",
    ["no_vehicle"] = "Il n'y a aucun véhicule dans ce garage",

    -- [[ Shop Stuff ]]
    ["open_shop"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la boutique",
    ["job_shop"] = "Boutique d'emploi",
    ['shop:item'] = "%s - <span style='color:%s;'>$%d</span>",
    ['not_enough_money'] = "Tu n'as pas assez d'argent",
    ['you_bought'] = "Vous avez acheté ~b~x%d~s~ ~y~%s~s~ pour ~%s~$%s~s~",
    ['shop_empty'] = "Cette boutique est vide",
    ['shop:you_already_have_that_weapon'] = "Vous avez déjà ~y~%s~s~",

    -- [[ Garage Buyable stuff ]]
    ['buyable_vehicle'] = "%s - <span style='color:green;'>$%s</span>",
    ['bought_vehicle'] = "You ~g~bought~s~ a vehicle",
    ['are_you_sure'] = "Are you sure to buy %s for $%s?",
    ['no_vehicles_in_garage'] = "There are no vehicles in this garage",
    ['vehicle_outside'] = "Vehicle is not in garage",
    ['buyable_vehicle:outside'] = "<span style='color:red'>%s</span>",
    ['permanent_garage:no_vehicle_to_buy'] = "There are no vehicles to buy",

    -- [[ Garage Owned stuff ]]
    ['garage_owned:press_to_open'] = "Press ~INPUT_CONTEXT~ to open garage",
	
    -- [[ Crafting Table Stuff ]]
    ['open_crafting_table'] = "Press ~INPUT_CONTEXT~ to open the crafting table",
    ['crafting_table'] = "Crafting Table",
    ['dont_have_ingredients'] = "You don't have all the ~r~required~s~ items",
    ['crafting'] = "Crafting %s",
    ['you_crafted'] = "You crafted ~b~x%d~s~ ~g~%s~s~",
    ['already_have'] = "You already have ~g~%s~s~",
    ['ingredient'] = "%s - <span style='color: %s'>%d/%d</span>",
    ['craft_item_label'] = "<span style='color: %s'>%s</span>",
    ['press_to_stop'] = "Press ~INPUT_CONTEXT~ to stop",
    ['you_stopped'] = "You'll stop when the crafting ends",

    -- [[ Armory stuff ]]
    ['open_armory'] = "Press ~INPUT_CONTEXT~ to open the armory",
    ['not_have_any_weapon'] = "You don't have any weapon",
    ['armory'] = "Armory",
    ['armory_take'] = "Armory - Take",
    ['armory_deposit'] = "Armory - Deposit",
    ['take_weapon'] = "Take weapon",
    ['deposit_weapon'] = "Deposit weapon",
    ['you_dont_have_weapon'] = "You ~r~don't~s~ have that weapon",
    ['no_weapons_in_armory'] = "There are no weapons here",
    ['you_deposited_weapon'] = "You have ~g~deposited~s~ %s",
    ['you_took_weapon'] = "You ~r~took~s~ %s",
    ['you_already_have_that_weapon'] = "You already have ~g~%s~s~",
    ['weapon_ammo'] = "Weapon ammo",
    ['weapon'] = "%s - x%d bullets",

    -- [[ Job outfit stuff ]]
    ['open_job_outfit'] = "Press ~INPUT_CONTEXT~ to open the job's outfits",
    ['job_outfit'] = "Job outfits",
    ['no_outfits'] = "No outfits available",
    ['civilian_outfit'] = "Civilian outfit",

    -- [[ Teleport Stuff ]]
    ['teleport'] = "Press ~INPUT_CONTEXT~ to teleport",
    ['teleport_to'] = "Press ~INPUT_CONTEXT~ to go to %s",

    -- [[ Safe Stuff ]]
    ['open_safe'] = "Press ~INPUT_CONTEXT~ to open the safe",
    ['account'] = "%s - <span style='color:%s;'>$%s</span>",
    ['safe'] = "Safe",
    ['empty_safe'] = "Safe is empty",
    ['nothing_to_deposit'] = "You have nothing to deposit here",
    ['withdrawn_safe'] = "You have withdrawn %s$%s %s~s~",
    ['deposited_safe'] = "You have deposited %s$%s %s~s~",
    ['cash'] = "Cash",
    ['withdraw'] = "Withdraw",

    -- [[ Market Stuff ]]
    ['open_market'] = "Press ~INPUT_CONTEXT~ to open market",
    ['market_item'] = "%s - <span style='color:%s;'>$%s</span>",
    ['market'] = "Market",
    ['not_enough_item'] = "You don't have enough %s",
    ['you_sold'] = "You sold ~b~x%d~s~ ~y~%s~s~ for %s$%s",
    ['nothing_can_be_sold_yet'] = "Nothing can be sold here yet",
    ['market:how_many_to_sell'] = "How many do you want to sell?",

    -- [[ Harvest Stuff ]]
    ['harvest'] = "Press ~INPUT_CONTEXT~ to harvest",
    ['harvest:harvesting'] = "Harvesting %s",
    ['harvest:press_to_stop'] = "Press ~INPUT_CONTEXT~ to stop",
    ['harvest:you_will_stop_on_finish'] = "You will stop on finish",
    ['harvest:you_need_tool_count'] = "You need ~b~x%d~s~ ~y~%s~s~",
    ['harvest:you_need_tool'] = "You need ~y~%s~s~",

    -- [[ Weapon upgrader ]]
    ['open_weapon_upgrader'] = "Press ~INPUT_CONTEXT~ to open weapon upgrader",
    ['weapon_upgrader'] = "Weapon Upgrader",
    ['owned_component'] = "%s - <span style='color:green;'>Owned</span>",
    ['buy_component'] = "%s - <span style='color:green;'>$%s</span>",
    ['tint_default'] = "Default",
    ['tint_green'] = "Green",
    ['tint_gold'] = "Gold",
    ['tint_pink'] = "Pink",
    ['tint_army'] = "Army",
    ['tint_lspd'] = "LSPD",
    ['tint_orange'] = "Orange",
    ['tint_platinum'] = "Platinum",
    ['components'] = "Components",
    ['tints'] = "Tints",
    ['already_have_tint'] = "You already have this tint",
    ['bought_tint'] = "You bought ~y~%s~s~ tint for ~g~%s~s~",
    ['bought_component'] = "You bought ~y~%s~s~ for ~g~%s~s~",
    ['removed_component'] = "You removed ~y~%s~s~ from ~g~%s~s~",

    -- [[ Duty Stuff]]
    ['go_on_duty'] = "Press ~INPUT_CONTEXT~ to go ~g~on duty~s~",
    ['go_off_duty'] = "Press ~INPUT_CONTEXT~ to go ~r~off duty~s~",

    -- [[ Job Shop Stuff ]]
    ['open_job_shop'] = "Press ~INPUT_CONTEXT~ to open the shop",
    ['job_owned_shop'] = "Job Shop",
    ['shop'] = "Shop",
    ['put_on_sale'] = "Put on sale",
    ['remove_from_sale'] = "Remove from sale",
    ['item_price'] = "Item price",
    ['invalid_price'] = "Invalid price",
    ['job_shop_item'] = "%s - x%d - <span style='color: green'>$%s</span>",
    ['job_shop_empty'] = "The shop is empty",
    ['job_shop_quantity'] = "Quantity - x%d -> <span style='color: green'>$%s</span>",
    ['job_shop_cant_afford'] = "You ~r~can't afford~s~ this",
    ['job_shop:bought_item'] = "You ~g~bought~s~ x%d ~y~%s~s~ for ~g~$%s~s~",
    ['job_shop:add_supplies'] = "Add supplies",
    ['job_shop:what_to_put_on_sale'] = "What would you like to put on sale?",
    ['job_shop:what_to_remove_from_sale'] = "What would you like to remove from sale?",
    ['job_shop:what_to_restock'] = "What would you like to restock?",
    ['job_shop:how_many_to_restock'] = "How many to add to stock?",
    ['job_shop:added_to_supplies'] = "Added ~b~x%d~s~ ~y~%s~s~ to supplies",
    ['job_shop:you_put_on_sale'] = "You put on sale ~b~x%d~s~ ~y~%s~s~ for ~g~$%s~s~",
    ['job_shop:you_removed_from_sale'] = "You removed from sale ~b~x%d~s~ ~y~%s~s~",
    ['job_shop:item'] = "<span style='color: blue'>x%d</span> - %s",
    ['job_shop:you_already_have_that_weapon'] = "You already have ~y~%s~s~",
    ['job_shop:nothing_to_sell'] = "You have nothing to sell",

    -- [[ Process stuff ]]
    ['process:press_to_process'] = "Press ~INPUT_CONTEXT~ to process",
    ['process:you_need'] = "You need ~b~x%d~s~ ~y~%s~s~",
    ['process:processing'] = "Processing %s",
    ['process:press_to_stop'] = "Press ~INPUT_CONTEXT~ to stop",
    ['process:you_will_stop_on_finish'] = "You will stop on finish",


    -- [[ Logs stuff ]]
    ['log_generic'] = "Nickname: %s\nIdentifier: %s\nJob name: %s\nJob grade: %d\n\n%s",

    ['log_deposited_stash'] = "Deposited item",
    ['log_deposited_stash_description'] = "Deposited x**%d** **%s** (**%s**) in marker ID **%d**",

    ['log_took_stash'] = "Took item",
    ['log_took_stash_description'] = "Took x**%d** **%s** (**%s**) from marker ID **%d**",

    ['log_deposited_weapon'] = "Deposited weapon",
    ['log_deposited_weapon_description'] = "Deposited **%s** (**%s**) with x**%d** ammo in marker ID **%d**",

    ['log_took_weapon'] = "Took weapon",
    ['log_took_weapon_description'] = "Took **%s** (**%s**) with x**%d** ammo in marker ID **%d**",

    ['log_deposited_money'] = "Deposited money",
    ['log_deposited_money_description'] = "Deposited $**%d** in society '**%s**'",

    ['log_withdrew_money'] = "Withdrew money",
    ['log_withdrew_money_description'] = "Withdrew $**%d** from society '**%s**'",

    ['log_updated_salary'] = "Updated salary",
    ['log_updated_salary_description'] = "Updated salary of grade **%d** to **$%s**",

    ['log_fired_employee'] = "Employee fired",
    ['log_fired_employee_description'] = "Fired player with identifier **%s**",

    ['log_recruited_employee'] = "Recruited employee",
    ['log_recruited_employee_description'] = "Recruited **%s** whose identifier is **%s**",

    ['log_changed_grade_employee'] = "Changed grade to employee",
    ['log_changed_grade_employee_description'] = "Changed grade to employee **%s** to **%d**",

    ['log_washed_money'] = "Washed money",
    ['log_washed_money_description'] = "Washed $**%s**",

    ['log_sold_item'] = "Sold item",
    ['log_sold_item_description'] = "Sold **x%d** **%s** for **$%s**",

    ['log_bought_item'] = "Bought item",
    ['log_bought_item_description'] = "Bought x%d **%s** (**%s**) from marker ID **%d**",

    ['log_not_existing_item'] = "Not existing item",
    ['log_not_existing_item_description'] = "Tried to buy '**%s**' from marker ID **%d**, but the item it's not in the shop",

    ['log_bought_vehicle'] = "Bought vehicle",
    ['log_bought_vehicle_description'] = "Bought '**%s**' for $**%d** from marker ID **%d**",

    ['log_not_existing_vehicle'] = "Not existing vehicle",
    ['log_not_existing_vehicle_description'] = "Tried to buy '**%s**' from marker ID **%d**, but the vehicle it's not in the garage",

    ['log_crafted_item'] = "Crafted item",
    ['log_crafted_item_description'] = "Crafted **x%d** **%s** (**%s**) in marker ID **%d**",

    ['log_deposited_safe'] = "Deposit in safe",
    ['log_deposited_safe_description'] = "Deposited $**%s** **%s** in marker ID **%d**",

    ['log_withdrew_safe'] = "Withdrew from safe",
    ['log_withdrew_safe_description'] = "Withdrew $**%s** **%s** from marker ID **%d**",

    ['log_harvested'] = "Harvested",
    ['log_harvested_description'] = "Harvested x**%d** **%s** from marker ID **%d**",

    ['log_bought_tint'] = "Bought tint",
    ['log_bought_tint_description'] = "Bought the **%s** '**%s**' tint for $**%d** from marker ID **%d**",

    ['log_removed_component'] = "Removed component",
    ['log_removed_component_description'] = "Removed **%s** from **%s** from marker ID **%d**",

    ['log_bought_component'] = "Bought component",
    ['log_bought_component_description'] = "Bought **%s** for **%s** from marker ID **%d**",

    ['log_not_allowed_marker'] = "Not allowed marker use",
    ['log_not_allowed_marker_description'] = "Tried to use marker ID %d but he's not allowed",

    ['logs:process:title'] = "Processed",
    ['logs:process:description'] = "Processed **x%d** **%s** to **x%d** **%s**",
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
