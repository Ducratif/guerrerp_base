--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},
    
    ['jeton'] = {
    label = 'Jeton de boutique',
    weight = 0,
    stack = false,
    close = false,
    description = '(Menu ;)Ce jeton est la money du serveur, il permet des achats.',
},

------------------------------------------------------------
------------------------------------------------------------
-- === JG Mechanic items (OX Inventory) ===
["engine_oil"] = {
  label = "Huile moteur",
  weight = 1000,
},
["tyre_replacement"] = {
  label = "Remplacement de pneu",
  weight = 1000,
},
["clutch_replacement"] = {
  label = "Remplacement d'embrayage",
  weight = 1000,
},
["air_filter"] = {
  label = "Filtre à air",
  weight = 100,
},
["spark_plug"] = {
  label = "Bougie d'allumage",
  weight = 1000,
},
["brakepad_replacement"] = {
  label = "Remplacement des plaquettes de frein",
  weight = 1000,
},
["suspension_parts"] = {
  label = "Pièces de suspension",
  weight = 1000,
},
-- Engine Items
["i4_engine"] = {
  label = "Moteur I4",
  weight = 1000,
},
["v6_engine"] = {
  label = "Moteur V6",
  weight = 1000,
},
["v8_engine"] = {
  label = "Moteur V8",
  weight = 1000,
},
["v12_engine"] = {
  label = "Moteur V12",
  weight = 1000,
},
["turbocharger"] = {
  label = "Turbo",
  weight = 1000,
},
-- Electric Engines
["ev_motor"] = {
  label = "Moteur électrique",
  weight = 1000,
},
["ev_battery"] = {
  label = "Batterie EV",
  weight = 1000,
},
["ev_coolant"] = {
  label = "Liquide de refroidissement EV",
  weight = 1000,
},
-- Drivetrain Items
["awd_drivetrain"] = {
  label = "Transmission AWD",
  weight = 1000,
},
["rwd_drivetrain"] = {
  label = "Transmission RWD",
  weight = 1000,
},
["fwd_drivetrain"] = {
  label = "Transmission FWD",
  weight = 1000,
},
-- Tuning Items
["slick_tyres"] = {
  label = "Pneus slick",
  weight = 1000,
},
["semi_slick_tyres"] = {
  label = "Pneus semi-slick",
  weight = 1000,
},
["offroad_tyres"] = {
  label = "Pneus tout-terrain",
  weight = 1000,
},
["drift_tuning_kit"] = {
  label = "Kit drift",
  weight = 1000,
},
["ceramic_brakes"] = {
  label = "Freins céramiques",
  weight = 1000,
},
-- Cosmetic Items
["lighting_controller"] = {
  label = "Contrôleur d'éclairage",
  weight = 100,
  client = {
    event = "jg-mechanic:client:show-lighting-controller",
  }
},
["stancing_kit"] = {
  label = "Kit stance",
  weight = 100,
  client = {
    event = "jg-mechanic:client:show-stancer-kit",
  }
},
["cosmetic_part"] = {
  label = "Pièces cosmétiques",
  weight = 100,
},
["respray_kit"] = {
  label = "Kit peinture",
  weight = 1000,
},
["vehicle_wheels"] = {
  label = "Jeu de jantes",
  weight = 1000,
},
["tyre_smoke_kit"] = {
  label = "Kit fumée de pneus",
  weight = 1000,
},
["bulletproof_tyres"] = {
  label = "Pneus pare-balles",
  weight = 1000,
},
["extras_kit"] = {
  label = "Kit d'extras",
  weight = 1000,
},
-- Nitrous & Cleaning Items
["nitrous_bottle"] = {
  label = "Bouteille de nitro",
  weight = 1000,
  client = {
    event = "jg-mechanic:client:use-nitrous-bottle",
  }
},
["empty_nitrous_bottle"] = {
  label = "Bouteille de nitro vide",
  weight = 1000,
},
["nitrous_install_kit"] = {
  label = "Kit d'installation nitro",
  weight = 1000,
},
["cleaning_kit"] = {
  label = "Kit de nettoyage",
  weight = 1000,
  client = {
    event = "jg-mechanic:client:clean-vehicle",
  }
},
["repair_kit"] = {
  label = "Kit de réparation",
  weight = 1000,
  client = {
    event = "jg-mechanic:client:repair-vehicle",
  }
},
["duct_tape"] = {
  label = "Ruban adhésif",
  weight = 1000,
  client = {
    event = "jg-mechanic:client:use-duct-tape",
  }
},
-- Performance Item
["performance_part"] = {
  label = "Pièces performance",
  weight = 1000,
},
-- Mechanic Tablet Item
["mechanic_tablet"] = {
  label = "Tablette de mécanicien",
  weight = 1000,
  client = {
    event = "jg-mechanic:client:use-tablet",
  }
},
-- Gearbox
["manual_gearbox"] = {
  label = "Boîte manuelle",
  weight = 1000,
},
-------------------------------------------------------------
-------------------------------------------------------------


['petfood'] = {
    label = 'Croquettes',
    weight = 200, stack = true, close = true,
    description = 'Nourrit votre animal.',
    image = 'petfood.png'
},

['petthirst'] = {
    label = 'Eau pour animal',
    weight = 200, stack = true, close = true,
    description = 'Étanche la soif de votre animal.',
    image = 'petthirst.png' 
},

['pethealth'] = {
    label = 'Kit de soin animal',
    weight = 200, stack = true, close = true,
    description = 'Soigne et réanime si nécessaire.',
    image = 'pethealth.png'
},

['petball'] = {
    label = 'Balle',
    weight = 100, stack = true, close = true,
    description = 'À lancer pour jouer.',
    image = 'petball.png'
},

['petrope'] = {
    label = 'Laisse',
    weight = 100, stack = true, close = true,
    description = 'Attacher/détacher votre compagnon.',
    image = 'petrope.png'
},

['module_ia'] = {
    label = 'Module IA',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 100% une option IA au choix.',
    image = 'module_ia.png',
    client = { event = 'ducratif_ai:item:use', args = 'single' }
},
['module_ia_premium'] = {
    label = 'Module IA Premium',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 50% toutes les options IA.',
    image = 'module_ia_premium.png',
    client = { event = 'ducratif_ai:item:use', args = 'premium' }
},
['module_ia_platinum'] = {
    label = 'Module IA Platine',
    weight = 200,
    stack = true,
    close = true,
    description = 'Restaure à 100% toutes les options IA.',
    image = 'module_ia_platinum.png',
    client = { event = 'ducratif_ai:item:use', args = 'platinum' }
},


    
    ['atm_kit'] = {
        label = 'Kit de braquage ATM',
        weight = 500,       -- ajuste selon ton équilibrage
        stack = true,
        close = true,
        description = "Outils pour forcer l'accès d'un ATM."
    },

    ['cash_bundle'] = {
    label = 'Malette de billets',
    weight = 3000,
    stack = false,
    close = false,
    description = 'Une malette remplie de billets de banque. Peut être échangée contre de l’argent.',
},
    
    ['gold_bar'] = {
    label = 'Lingot d’or',
    weight = 1200, -- Un lingot d’or, c’est lourd ! Ajuste selon ton équilibre
    stack = true,
    close = false,
    description = 'Un lingot d’or pur, très recherché sur le marché noir.',
},
    
    ['argent_bar'] = {
    label = 'Lingot d’argent',
    weight = 900, -- Un lingot d’argent, c’est lourd ! Ajuste selon ton équilibre
    stack = true,
    close = false,
    description = 'Un lingot d’argent pur & dur, très recherché sur le marché noir.',
},
    
    ['bank_card_prepay'] = {
    label = 'Carte bancaire prépayée',
    weight = 300,
    stack = true,
    close = false,
    description = 'Une gentille personne ta donner une Carte bancaire prépayée',
},


    
    ['stimulant_debug'] = {
    label = 'Stimulant Développeur',
    weight = 100,
    stack = true,
    close = true,
    description = 'Vitesse +800%, invincibilité INFINI !',
    consume = 1, -- facultatif (0 = non supprimé, 1 = supprimé)
    client = {
        event = 'stimulants:useItem',
        args = 'stimulant_debug'
    }
},
    
    stimulant_combat = {
        label = "Stimulant de combat",
        weight = 100,
        stack = true,
        close = true,
        description = "Vitesse +25%, invincibilité 8s. Zones de guerre uniquement.",
        consume = 1, -- facultatif (0 = non supprimé, 1 = supprimé)
        client = {
            event = 'stimulants:useItem',
            args = 'stimulant_combat'
        }
    },
    stimulant_vitesse = {
        label = "Stimulant de vitesse",
        weight = 100,
        stack = true,
        close = true,
        description = "Vitesse +50% pendant 10s. Zones de guerre uniquement.",
        consume = 1, -- facultatif (0 = non supprimé, 1 = supprimé)
        client = {
            event = 'stimulants:useItem',
            args = 'stimulant_vitesse'
        }
    },
    stimulant_vie = {
        label = "Stimulant de vie",
        weight = 100,
        stack = true,
        close = true,
        description = "Invincibilité pendant 5s. Zones de guerre uniquement.",
        consume = 1, -- facultatif (0 = non supprimé, 1 = supprimé)
        client = {
            event = 'stimulants:useItem',
            args = 'stimulant_vie'
        }
    },
    
    
    ['anti_zombie'] = {
    label = 'Injection Anti-Zombie',
    weight = 100,
    stack = false,
    close = true,
    description = 'Protège temporairement des effets de la zone infectée.',
    client = {
        export = 'zone_infecter.useAntiZombie'
    },
    consume = 0 -- ne consomme pas tout de suite, c’est géré via le script
},
    
    ['cure_zombie'] = {
    label = 'Pilule Anti-Infection',
    weight = 50,
    stack = false,
    close = true,
    description = 'Soigne l’infection et restaure votre état normal.',
    client = {
        export = 'zone_infecter.useCurePill'
    },
    consume = 1
},


    ['key_zombie'] = {
    label = 'Clé Zombie',
    weight = 50,
    stack = true,
    close = false,
    description = 'Permet d’ouvrir un coffre de niveau 1.',
},

['key_zombie2'] = {
    label = 'Clé Zombie +',
    weight = 50,
    stack = true,
    close = false,
    description = 'Permet d’ouvrir un coffre de niveau 2.',
},

['key_zombie3'] = {
    label = 'Clé Zombie ++',
    weight = 50,
    stack = true,
    close = false,
    description = 'Permet d’ouvrir un coffre de niveau 3.',
},

['key_zombie_boss'] = {
    label = 'Clé Boss Zombie',
    weight = 100,
    stack = true,
    close = false,
    description = 'Permet d’ouvrir le coffre du boss.',
},

    
    ['gps'] = {
    label = 'GPS Portable',
    weight = 200,
    stack = false,
    close = true,
    description = 'Permet de suivre les alliés sur la même fréquence.',
    image = 'gps.png'
},
    
['velo'] = {
    label = 'Vélo de poche',
    weight = 1000,
    stack = false,
    close = true,
    description = 'Un vélo pliable dans ton sac.',
    client = {
        export = 'velo_poche.useVelo'
    }
},

    
    ['sponge'] = {
    label = 'Eponge',
    weight = 100,
    stack = false,
    close = true,
    description = 'Permet de laver les véhicules',
    client = {
        event = 'sponge:use'
    }
},
    
    ['gaze'] = {
    label = 'Gaze',
    weight = 50,
    stack = true,
    close = false,
    description = 'Compresses stériles utilisées pour couvrir les plaies.',
},
    
    ['chiffon'] = {
    label = 'Chiffon',
    weight = 50,
    stack = true,
    close = true,
    description = 'Permet de nettoyer',
},
    
    ['diag'] = {
    label = 'Balise diagnostic',
    weight = 20,
    stack = true,
    close = true,
    description = 'Permet de faire des analyses sur les véhicules',
},
    
    ['repairkit'] = {
    label = 'Trousse à outil',
    weight = 20,
    stack = true,
    close = true,
    description = 'Trousse remplit d\'outils',
},
    
    ['fish'] = {
    label = 'Petit poisson',
    weight = 20,
    stack = true,
    close = false,
    description = 'Petit poisson pecher en mer',
},
    
    ['argentb'] = {
    label = 'Pochette d\'argent',
    weight = 1000,
    stack = true,
    close = true
},

['male_drogue'] = {
    label = 'Malle de drogue',
    weight = 2000,
    stack = false,
    close = true
},

['boite_bijoux'] = {
    label = 'Boîte à bijoux',
    weight = 1500,
    stack = true,
    close = true
},


['fish1'] = {
    label = 'Petit poisson gentil',
    weight = 20,
    stack = true,
    close = false,
    description = 'Petit poisson pecher en mer',
},

['fish2'] = {
    label = 'Petit poisson délicieux',
    weight = 20,
    stack = true,
    close = false,
    description = 'Petit poisson pecher en mer',
},

['rod'] = {
    label = 'Canne a peche',
    weight = 70,
    stack = true,
    close = false,
    description = 'Pratique pour pecher askip',
},

['antiseptique'] = {
    label = 'Antiseptique',
    weight = 20,
    stack = true,
    close = false,
    description = 'Liquide désinfectant pour nettoyer les blessures.',
},

['ciseaux_medicaux'] = {
    label = 'Ciseaux Médicaux',
    weight = 200,
    stack = false,
    close = false,
    description = 'Ciseaux utilisés pour découper les bandages ou vêtements.',
},

['pochette_vide'] = {
    label = 'Pochette Vide',
    weight = 100,
    stack = true,
    close = false,
    description = 'Un petit sac vide, idéal pour contenir un medikit.',
},
    
    ['sparadrap'] = {
    label = 'Sparadrap',
    weight = 50,
    stack = true,
    close = false,
    description = 'Bande adhésive utilisée pour maintenir les pansements.',
},

['coton'] = {
    label = 'Coton',
    weight = 30,
    stack = true,
    close = false,
    description = 'Boule de coton stérile pour l\'application de soins.',
},

['gants'] = {
    label = 'Gants Médicaux',
    weight = 40,
    stack = true,
    close = false,
    description = 'Gants en latex pour assurer une hygiène lors des soins.',
},


	['bandage'] = {
		label = 'Bandage',
		weight = 100,
        stack = true,
    	close = false,
        description = 'Un bandage médical stérile pour les soins de base.',
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},
    
        ['id_card'] = {
        label = 'ID Card',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'idcard.png'}
    },
    ['driver_license'] = {
        label = 'Drivers License',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'driverlicense.png'}
    },
    ['carteidentite'] = {
		label = 'Carte d\'identité',
		weight = 80,
	},

	['drive'] = {
		label = 'Permis de conduire',
		weight = 80,
	},
    ['weaponlicense'] = {
        label = 'Weapon License',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'weaponlicense.png'}
    },
    ['lawyerpass'] = {
        label = 'Lawyer Pass',
        weight = 0,
        stack = false,
        close = true,
        description = "Your Description",
        client = {image = 'lawyerpass.png'}
    },
    

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

    ['gpsill'] = {
		label = 'Tracker GPS',
		client = {
			image = 'gpsill.png'
		}
	},
    
    ['speaker'] = {
		label = 'Boombox',
		client = {
			image = 'boombox.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},
    
    
    
    
    ['map'] = {
		label = 'Carte',
        description = 'Utilisation seulement dans un véhicule !',
		stack = false,
		weight = 100,
		--client = {
		--	image = 'map.png'
		--}
	},

    ['carkey'] = {
		label = 'Clé Voiture',
		stack = false,
		weight = 10,
		client = {
			image = 'carkey.png'
		}
	},

    ['keys'] = {
        label = "Clé de voiture",
        weight = 15,
        client = {
			image = 'carkey.png'
		}
    },

    ['key'] = {
        label = "Clé de voiture",
        weight = 15,
        client = {
			image = 'carkey.png'
		}
    },

    ['carkeys'] = {
        label = 'Clé Vehicules',
        weight = 5,
        stack = true
    },
    
    ['ganzua'] = {
        label = 'Outils de Crochetages',
        weight = 25,
        stack = true,
        client = {
            export = 'LeDjo_Garage.LockPick'
        }
    },
    
    ['alicates'] = {
        label = 'Pince Coupante',
        weight = 50,
        stack = true,
        client = {
            export = 'LeDjo_Garage.HotWire'
        }
    },
    ['plate'] = {
        label = 'Plaque',
        weight = 500,
        stack = true,
        client = {
            export = 'LeDjo_Garage.SetMatricula'
        }
    },

    ['trash_burger'] = {
		label = 'Boite Burger',
		stack = false,
		weight = 10,
		client = {
			image = 'trash_burger.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Trousse de Soins",
		weight = 500,
		stack = true,
		close = true,
        description = 'Un medikit complet pour soigner les blessures graves.',
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	['contract'] = {
		label = 'Contrat',
		weight = 100,
		stack = true
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
	},

	['radio'] = {
		label = 'Radio',
		weight = 100,
		stack = true,
		close = true,
		client = {
			export = 'ac_radio.openRadio',
			remove = function(total)
				-- Disconnets a player from the radio when all his radio items are removed.
				if total < 1 and GetConvar('radio:disconnectWithoutRadio', 'true') == 'true' then
					exports.ac_radio:leaveRadio()
				end
			end
		}
	},

	["jumelle"] = {
		label = "Jumelle",
		weight = 1,
		stack = true,
		close = true,
	},

	["cupcake"] = {
		label = "Cupcake",
		weight = 1,
		stack = true,
		close = true,
	},

	["snickers"] = {
		label = "Snickers",
		weight = 1,
		stack = true,
		close = true,
	},

	["cut_money"] = {
		label = "Counterfeit Cash - Cut",
		weight = 1,
		stack = true,
		close = true,
	},

	["sorted_money"] = {
		label = "Counterfeit Cash - Sorted",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine_cut"] = {
		label = "Cut Cocaine",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine_packaged"] = {
		label = "Packaged Cocaine",
		weight = 1,
		stack = true,
		close = true,
	},

	["cocaine_uncut"] = {
		label = "Uncut Cocaine",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_packaged"] = {
		label = "Packaged Weed",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_packaged"] = {
		label = "Packaged Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_raw"] = {
		label = "Raw Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_untrimmed"] = {
		label = "Untrimmed Weed",
		weight = 1,
		stack = true,
		close = true,
	},

	["gamepad"] = {
		label = "Gamepad",
		weight = 1,
		stack = true,
		close = true,
	},

	--DROGS / DRUGS
	["coke"] = {
        label = "Raw Cocaine",
        weight = 1000,
        stack =true,
        close = false,
        description = "Raw Cocaine",
        client = {
            image = "coke.png",
        }
    },
    ["cokebaggy"] = {
        label = "Bag Of Cocaine",
        weight = 1000,
        stack =true,
        close = false,
        description = "A Small Bag Of Weak Cocaine",
        client = {
            image = "coke.png",
        }
    },
    ["empty_weed_bag"] = {
        label = "Empty Bag",
        weight = 1000,
        stack =true,
        close = false,
        description = "Empty Bag To Put Product In",
        client = {
            image = "weed_baggy_empty.png",
        }
    },
    ["coca_leaf"] = {
        label = "Cocaine leaves",
        weight = 1500,
        stack =true,
        close = false,
        description = "Cocaine leaves that must be processed !",
        client = {
            image = "coca_leaf.png",
        }
    },
    ["poppyresin"] = {
        label = "Poppy resin",
        weight = 2000,
        stack =true,
        close = false,
        description = "It sticks to your fingers when you handle it.",
        client = {
            image = "poppyresin.png",
        }
    },
    ["heroin"] = {
        label = "Weak Heroin Powder",
        weight = 500,
        stack =true,
        close = true,
        description = "Dragon Chasin?",
        client = {
            image = "loosecoke.png",
        }
    },
    ["bakingsoda"] = {
        label = "Baking Soda",
        weight = 300,
        stack =true,
        close = false,
        description = "Household Baking Soda!",
        client = {
            image = "bakingsoda.png",
        }
    },
    ["loosecoke"] = {
        label = "Loose Coke",
        weight = 100,
        stack =true,
        close = true,
        description = "Cut Cocaine",
        client = {
            image = "loosecoke.png",
        }
    },
    ["loosecokestagetwo"] = {
        label = "More Pure Loose Coke",
        weight = 100,
        stack =true,
        close = true,
        description = "Cut Cocaine",
        client = {
            image = "loosecokestagetwo.png",
        }
    },
    ["loosecokestagethree"] = {
        label = "Purest Loose Coke",
        weight = 100,
        stack =true,
        close = true,
        description = "Cut Cocaine",
        client = {
            image = "loosecokestagethree.png",
        }
    },
    ["cokebaggystagetwo"] = {
        label = "Bag of Good Coke",
        weight = 100,
        stack = true,
        close = true,
        description = "Bagged Cocaine",
        client = {
            image = "cocaine_baggystagetwo.png",
        }
    },
    ["cokebaggystagethree"] = {
        label = "Bag of Great Coke",
        weight = 100,
        stack = true,
        close = true,
        description = "Bagged Cocaine",
        client = {
            image = "cocaine_baggystagethree.png",
        }
    },
    ["cokestagetwo"] = {
        label = "Better Raw Cocaine",
        weight = 100,
        stack =true,
        close = false,
        description = "Raw cocaine",
        client = {
            image = "cokestagetwo.png",
        }
    },
    ["cokestagethree"] = {
        label = "Best Raw Cocaine",
        weight = 100,
        stack =true,
        close = false,
        description = "Raw cocaine",
        client = {
            image = "cokestagethree.png",
        }
    },
    ["lysergic_acid"] = {
        label = "Lysergic Acid",
        weight = 100,
        stack = true,
        close = true,
        description = "Acid to make acid?",
        client = {
            image = "lysergic_acid.png",
        }
    },
    ["diethylamide"] = {
        label = "Diethylamide",
        weight = 100,
        stack = true,
        close = true,
        description = "die? I sure hope not!",
        client = {
            image = "diethylamide.png",
        }
    },
    ["lsd_one_vial"] = {
        label = "Tier 1 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_one_vial.png",
        }
    },
    ["lsd_vial_two"] = {
        label = "Tier 2 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_vial_two.png",
        }
    },
    ["lsd_vial_three"] = {
        label = "Tier 3 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_vial_three.png",
        }
    },
    ["lsd_vial_four"] = {
        label = "Tier 4 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_vial_four.png",
        }
    },
    ["lsd_vial_five"] = {
        label = "Tier 5 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_vial_five.png",
        }
    },
    ["lsd_vial_six"] = {
        label = "Tier 6 LSD Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Vial Of LSD",
        client = {
            image = "lsd_vial_six.png",
        }
    },
    ["tab_paper"] = {
        label = "Tab Paper",
        weight = 100,
        stack = true,
        close = true,
        description = "Paper To Dip LSD On",
        client = {
            image = "tab_paper.png",
        }
    },
    ["smileyfacesheet"] = {
        label = "Smiley Face Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "You Are Cute When You Smile - Creepy Dudes",
        client = {
            image = "smileysheet.png",
        }
    },
    ["wildcherrysheet"] = {
        label = "Wild Cherry Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "Lets Get Wild",
        client = {
            image = "wildcherrysheet.png",
        }
    },
    ["yinyangsheet"] = {
        label = "Yin and Yang Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "All Together In Harmony",
        client = {
            image = "yinyangsheet.png",
        }
    },
    ["pineapplesheet"] = {
        label = "Pineapple Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "When You Hold It Upside It Means Something Different",
        client = {
            image = "pineapplesheet.png",
        }
    },
    ["bartsheet"] = {
        label = "Cluckin Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "A Cluckin Good Time",
        client = {
            image = "bartsheet.png",
        }
    },
    ["gratefuldeadsheet"] = {
        label = "Maze Sheet",
        weight = 100,
        stack = true,
        close = true,
        description = "I heard Its aMAZEing.. get it.. ill stop now",
        client = {
            image = "gratefuldeadsheet.png",
        }
    },
    ["smiley_tabs"] = {
        label = "Smiley Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "You Are Cute When You Smile - Creepy Dudes",
        client = {
            image = "smiley_tabs.png",
        }
    },
    ["wildcherry_tabs"] = {
        label = "Wild Cherry Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "Lets Get Wild",
        client = {
            image = "wildcherry_tabs.png",
        }
    },
    ["yinyang_tabs"] = {
        label = "Yin and Yang Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "All Together In Harmony",
        client = {
            image = "yinyang_tabs.png",
        }
    },
    ["pineapple_tabs"] = {
        label = "Pineapple Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "When You Hold It Upside It Means Something Different",
        client = {
            image = "pineapple_tabs.png",
        }
    },
    ["bart_tabs"] = {
        label = "Cluckin Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "A Cluckin Good Time",
        client = {
            image = "bart_tabs.png",
        }
    },
    ["gratefuldead_tabs"] = {
        label = "Maze Tabs",
        weight = 100,
        stack = true,
        close = true,
        description = "I heard Its aMAZEing.. get it.. ill stop now",
        client = {
            image = "gratefuldead_tabs.png",
        }
    },
    ["lsdlabkit"] = {
        label = "LSD Mixing Table",
        weight = 1000,
        stack = true,
        close = true,
        description = "How Can A Big Ass Table Fit In One Slot",
        client = {
            image = "labkit.png",
        }
    },
    ["heroinstagetwo"] = {
        label = "Better Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Raw Heroin",
        client = {
            image = "cokestagetwo.png",
        }
    },
    ["heroinstagethree"] = {
        label = "Best Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Raw Heroin",
        client = {
            image = "cokestagethree.png",
        }
    },
    ["heroincut"] = {
        label = "Cut Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Cut Heroin",
        client = {
            image = "loosecoke.png",
        }
    },
    ["heroincutstagetwo"] = {
        label = "Better Cut Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Cut Heroin",
        client = {
            image = "loosecokestagetwo.png",
        }
    },
    ["heroincutstagethree"] = {
        label = "Best Cut Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Cut Heroin",
        client = {
            image = "loosecokestagethree.png",
        }
    },
    ["heroinlabkit"] = {
        label = "Heroin Lab Kit",
        weight = 250,
        stack =true,
        close = false,
        description = "How Can A Big Ass Table Fit In One Slot",
        client = {
            image = "labkit.png",
        }
    },
    ["heroinvial"] = {
        label = "Vial Of Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Hmm, Maybe A Needle Can Help",
        client = {
            image = "heroin.png",
        }
    },
    ["heroinvialstagetwo"] = {
        label = "Better Vial of Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Hmm, Maybe A Needle Can Help",
        client = {
            image = "heroinstagetwo.png",
        }
    },
    ["heroinvialstagethree"] = {
        label = "Best Vial Of Heroin",
        weight = 250,
        stack =true,
        close = false,
        description = "Hmm, Maybe A Needle Can Help",
        client = {
            image = "heroinstagethree.png",
        }
    },
    ["heroin_ready"] = {
        label = "Heroin Syringe",
        weight = 250,
        stack = true,
        close = false,
        description = "Go On, Chase The Dragon",
        client = {
            image = "heroin_ready.png",
        }
    },
    ["heroin_readystagetwo"] = {
        label = "Heroin Syringe 2",
        weight = 250,
        stack = true,
        close = false,
        description = "Go On, Chase The Dragon",
        client = {
            image = "heroin_readystagetwo.png",
        }
    },
    ["heroin_readystagethree"] = {
        label = "Heroin Syringe 3",
        weight = 250,
        stack = true,
        close = false,
        description = "Go On, Chase The Dragon",
        client = {
            image = "heroin_readystagethree.png",
        }
    },
    ["emptyvial"] = {
        label = "Empty Vial",
        weight = 100,
        stack = true,
        close = true,
        description = "Hmm, What Can Go In This?",
        client = {
            image = "emptyvial.png",
        }
    },
    ["needle"] = {
        label = "Syringe",
        weight = 250,
        stack =true,
        close = false,
        description = "I Swear Officer, Its For Diabetes",
        client = {
            image = "syringe.png",
        }
    },
    ["crackrock"] = {
        label = "Crack Rock",
        weight = 250,
        stack =true,
        close = false,
        description = "This Isnt The Rock The Hippie Girl Told Me About",
        client = {
            image = "crackrock1.png",
        }
    },
    ["crackrockstagetwo"] = {
        label = "Better Crack Rock",
        weight = 250,
        stack =true,
        close = false,
        description = "This Rocks!",
        client = {
            image = "crackrock2.png",
        }
    },
    ["crackrockstagethree"] = {
        label = "Best Crack Rock",
        weight = 250,
        stack =true,
        close = false,
        description = "This Rocks!",
        client = {
            image = "crackrock3.png",
        }
    },
    ["baggedcracked"] = {
        label = "Bag Of Crack",
        weight = 250,
        stack = true,
        close = false,
        description = "Bags Of Crack",
        client = {
            image = "crackbag1.png",
        }
    },
    ["baggedcrackedstagetwo"] = {
        label = "Better Bag Of Crack",
        weight = 250,
        stack = true,
        close = false,
        description = "Bags Of Crack",
        client = {
            image = "crackbag2.png",
        }
    },
    ["baggedcrackedstagethree"] = {
        label = "Best Bag Of Crack",
        weight = 250,
        stack = true,
        close = false,
        description = "Bags Of Crack",
        client = {
            image = "crackbag3.png",
        }
    },
    ["shrooms"] = {
        label = "Shrooms",
        weight = 250,
        stack = true,
        close = false,
        description = "Holy Shit ake mushroom",
        client = {
            image = "shrooms.png",
        }
    },
    ["prescription_pad"] = {
        label = "Prescription Pad",
        weight = 10,
        stack = true,
        close = false,
        description = "Write Your Prescriptions here",
        client = {
            image = "prescriptionpad.png",
        }
    },
    ["vicodin_prescription"] = {
        label = "Vicie Prescription",
        weight = 250,
        stack =true,
        close = false,
        description = "If Only This Helped With The Pain inside",
        client = {
            image = "adderalprescription.png",
        }
    },
    ["adderal_prescription"] = {
        label = "Mdderal Prescription",
        weight = 250,
        stack =true,
        close = false,
        description = "I CAN DO EVERYTHING",
        client = {
            image = "adderalprescription.png",
        }
    },
    ["morphine_prescription"] = {
        label = "Morphin Prescription",
        weight = 250,
        stack =true,
        close = false,
        description = "I Cant Feel Anything",
        client = {
            image = "adderalprescription.png",
        }
    },
    ["xanax_prescription"] = {
        label = "Zany Prescription",
        weight = 250,
        stack =true,
        close = false,
        description = "Ahhh Sweet Comfort",
        client = {
            image = "adderalprescription.png",
        }
    },
    ["adderal"] = {
        label = "Madderal",
        weight = 100,
        stack = true,
        close = true,
        description = "If Only This Helped With The Pain inside",
        client = {
            image = "adderal.png",
        }
    },
    ["vicodin"] = {
        label = "Vicie",
        weight = 100,
        stack = true,
        close = true,
        description = "I CAN DO EVERYTHING",
        client = {
            image = "vicodin.png",
        }
    },
    ["morphine"] = {
        label = "Morphin",
        weight = 100,
        stack = true,
        close = true,
        description = "I Cant Feel Anything",
        client = {
            image = "morphine.png",
        }
    },
    ["xanax"] = {
        label = "Zany",
        weight = 100,
        stack = true,
        close = true,
        description = "Ahhh Sweet Comfort",
        client = {
            image = "xanax.png",
        }
    },
    ["adderalbottle"] = {
        label = "Madderal Bottle",
        weight = 100,
        stack = true,
        close = true,
        description = "Bottles Of Good Drugs",
        client = {
            image = "pillbottle.png",
        }
    },
    ["vicodinbottle"] = {
        label = "Vicie Bottle",
        weight = 100,
        stack = true,
        close = true,
        description = "Bottles Of Good Drugs",
        client = {
            image = "pillbottle.png",
        }
    },
    ["morphinebottle"] = {
        label = "Morphin Bottle",
        weight = 100,
        stack = true,
        close = true,
        description = "Bottles Of Good Drugs",
        client = {
            image = "pillbottle.png",
        }
    },
    ["xanaxbottle"] = {
        label = "Zany Bottle",
        weight = 100,
        stack = true,
        close = true,
        description = "Bottle Of Good Drugs",
        client = {
            image = "pillbottle.png",
        }
    },
    ["isosafrole"] = {
        label = "Isosafrole",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "isosafrole.png",
        }
    },
    ["mdp2p"] = {
        label = "MDP2P",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "mdp2p.png",
        }
    },
    ["raw_xtc"] = {
        label = "Raw XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "raw_xtc.png",
        }
    },
    ["singlepress"] = {
        label = "Single Pill Press",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "pillpress.png",
        }
    },
    ["white_xtc"] = {
        label = "1 Stack White XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedwhite.png",
        }
    },
    ["white_xtc2"] = {
        label = "2 Stack White XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedwhite.png",
        }
    },
    ["white_xtc3"] = {
        label = "3 Stack White XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedwhite.png",
        }
    },
    ["white_xtc4"] = {
        label = "4 Stack White XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedwhite.png",
        }
    },
    ["red_xtc"] = {
        label = "1 Stack Red XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedred.png",
        }
    },
    ["red_xtc2"] = {
        label = "2 Stack Red XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedred.png",
        }
    },
    ["red_xtc3"] = {
        label = "3 Stack Red XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedred.png",
        }
    },
    ["red_xtc4"] = {
        label = "4 Stack Red XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedred.png",
        }
    },
    ["orange_xtc"] = {
        label = "1 Stack Orange XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedorange.png",
        }
    },
    ["orange_xtc2"] = {
        label = "2 Stack Orange XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedorange.png",
        }
    },
    ["orange_xtc3"] = {
        label = "3 Stack Orange XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedorange.png",
        }
    },
    ["orange_xtc4"] = {
        label = "4 Stack Orange XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedorange.png",
        }
    },
    ["blue_xtc"] = {
        label = "1 Stack Blue XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedblue.png",
        }
    },
    ["blue_xtc2"] = {
        label = "2 Stack Blue XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedblue.png",
        }
    },
    ["blue_xtc3"] = {
        label = "3 Stack Blue XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedblue.png",
        }
    },
    ["blue_xtc4"] = {
        label = "4 Stack Blue XTC",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "unstampedblue.png",
        }
    },
    ["white_playboys"] = {
        label = "1 Stack White Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_white.png",
        }
    },
    ["white_playboys2"] = {
        label = "2 Stack White Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_white.png",
        }
    },
    ["white_playboys3"] = {
        label = "3 Stack White Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_white.png",
        }
    },
    ["white_playboys4"] = {
        label = "4 Stack White Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_white.png",
        }
    },
    ["blue_playboys"] = {
        label = "1 Stack Blue Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_blue.png",
        }
    },
    ["blue_playboys2"] = {
        label = "2 Stack Blue Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_blue.png",
        }
    },
    ["blue_playboys3"] = {
        label = "3 Stack Blue Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_blue.png",
        }
    },
    ["blue_playboys4"] = {
        label = "4 Stack Blue Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_blue.png",
        }
    },
    ["red_playboys"] = {
        label = "1 Stack Red Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_red.png",
        }
    },
    ["red_playboys2"] = {
        label = "2 Stack Red Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_red.png",
        }
    },
    ["red_playboys3"] = {
        label = "3 Stack Red Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_red.png",
        }
    },
    ["red_playboys4"] = {
        label = "4 Stack Red Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_red.png",
        }
    },
    ["orange_playboys"] = {
        label = "1 Stack Orange Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_orange.png",
        }
    },
    ["orange_playboys2"] = {
        label = "2 Stack Orange Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_orange.png",
        }
    },
    ["orange_playboys3"] = {
        label = "3 Stack Orange Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_orange.png",
        }
    },
    ["orange_playboys4"] = {
        label = "4 Stack Orange Fruit",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "playboy_orange.png",
        }
    },
    ["white_aliens"] = {
        label = "1 Stack White Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_white.png",
        }
    },
    ["white_aliens2"] = {
        label = "2 Stack White Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_white.png",
        }
    },
    ["white_aliens3"] = {
        label = "3 Stack White Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_white.png",
        }
    },
    ["white_aliens4"] = {
        label = "4 Stack White Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_white.png",
        }
    },
    ["blue_aliens"] = {
        label = "1 Stack Blue Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_blue.png",
        }
    },
    ["blue_aliens2"] = {
        label = "2 Stack Blue Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_blue.png",
        }
    },
    ["blue_aliens3"] = {
        label = "3 Stack Blue Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_blue.png",
        }
    },
    ["blue_aliens4"] = {
        label = "4 Stack Blue Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_blue.png",
        }
    },
    ["red_aliens"] = {
        label = "1 Stack Red Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_red.png",
        }
    },
    ["red_aliens2"] = {
        label = "2 Stack Red Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_red.png",
        }
    },
    ["red_aliens3"] = {
        label = "3 Stack Red Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_red.png",
        }
    },
    ["red_aliens4"] = {
        label = "4 Stack Red Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_red.png",
        }
    },
    ["orange_aliens"] = {
        label = "1 Stack Orange Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_orange.png",
        }
    },
    ["orange_aliens2"] = {
        label = "2 Stack Orange Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_orange.png",
        }
    },
    ["orange_aliens3"] = {
        label = "3 Stack Orange Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_orange.png",
        }
    },
    ["orange_aliens4"] = {
        label = "4 Stack Orange Aliens",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "alien_orange.png",
        }
    },
    ["white_pl"] = {
        label = "1 Stack White PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_white.png",
        }
    },
    ["white_pl2"] = {
        label = "2 Stack White PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_white.png",
        }
    },
    ["white_pl3"] = {
        label = "3 Stack White PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_white.png",
        }
    },
    ["white_pl4"] = {
        label = "4 Stack White PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_white.png",
        }
    },
    ["blue_pl"] = {
        label = "1 Stack Blue PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_blue.png",
        }
    },
    ["blue_pl2"] = {
        label = "2 Stack Blue PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_blue.png",
        }
    },
    ["blue_pl3"] = {
        label = "3 Stack Blue PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_blue.png",
        }
    },
    ["blue_pl4"] = {
        label = "4 Stack Blue PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_blue.png",
        }
    },
    ["red_pl"] = {
        label = "1 Stack Red PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_red.png",
        }
    },
    ["red_pl2"] = {
        label = "2 Stack Red PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_red.png",
        }
    },
    ["red_pl3"] = {
        label = "3 Stack Red PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_red.png",
        }
    },
    ["red_pl4"] = {
        label = "4 Stack Red PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_red.png",
        }
    },
    ["orange_pl"] = {
        label = "1 Stack Orange PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_orange.png",
        }
    },
    ["orange_pl2"] = {
        label = "2 Stack Orange PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_orange.png",
        }
    },
    ["orange_pl3"] = {
        label = "3 Stack Orange PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_orange.png",
        }
    },
    ["orange_pl4"] = {
        label = "4 Stack Orange PL",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "PL_orange.png",
        }
    },
    ["white_trolls"] = {
        label = "1 Stack White Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_white.png",
        }
    },
    ["white_trolls2"] = {
        label = "2 Stack White Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_white.png",
        }
    },
    ["white_trolls3"] = {
        label = "3 Stack White Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_white.png",
        }
    },
    ["white_trolls4"] = {
        label = "4 Stack White Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_white.png",
        }
    },
    ["blue_trolls"] = {
        label = "1 Stack Blue Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_blue.png",
        }
    },
    ["blue_trolls2"] = {
        label = "2 Stack Blue Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_blue.png",
        }
    },
    ["blue_trolls3"] = {
        label = "3 Stack Blue Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_blue.png",
        }
    },
    ["blue_trolls4"] = {
        label = "4 Stack Blue Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_blue.png",
        }
    },
    ["red_trolls"] = {
        label = "1 Stack Red Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_red.png",
        }
    },
    ["red_trolls2"] = {
        label = "2 Stack Red Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_red.png",
        }
    },
    ["red_trolls3"] = {
        label = "3 Stack Red Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_red.png",
        }
    },
    ["red_trolls4"] = {
        label = "4 Stack Red Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_red.png",
        }
    },
    ["orange_trolls"] = {
        label = "1 Stack Orange Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_orange.png",
        }
    },
    ["orange_trolls2"] = {
        label = "2 Stack Orange Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_orange.png",
        }
    },
    ["orange_trolls3"] = {
        label = "3 Stack Orange Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_orange.png",
        }
    },
    ["orange_trolls4"] = {
        label = "4 Stack Orange Trolls",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "troll_orange.png",
        }
    },
    ["white_cats"] = {
        label = "1 Stack White Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_white.png",
        }
    },
    ["white_cats2"] = {
        label = "2 Stack White Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_white.png",
        }
    },
    ["white_cats3"] = {
        label = "3 Stack White Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_white.png",
        }
    },
    ["white_cats4"] = {
        label = "4 Stack White Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_white.png",
        }
    },
    ["blue_cats"] = {
        label = "1 Stack Blue Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_blue.png",
        }
    },
    ["blue_cats2"] = {
        label = "2 Stack Blue Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_blue.png",
        }
    },
    ["blue_cats3"] = {
        label = "3 Stack Blue Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_blue.png",
        }
    },
    ["blue_cats4"] = {
        label = "4 Stack Blue Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_blue.png",
        }
    },
    ["red_cats"] = {
        label = "1 Stack Red Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_red.png",
        }
    },
    ["red_cats2"] = {
        label = "2 Stack Red Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_red.png",
        }
    },
    ["red_cats3"] = {
        label = "3 Stack Red Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_red.png",
        }
    },
    ["red_cats4"] = {
        label = "4 Stack Red Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_red.png",
        }
    },
    ["orange_cats"] = {
        label = "1 Stack Orange Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_orange.png",
        }
    },
    ["orange_cats2"] = {
        label = "2 Stack Orange Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_orange.png",
        }
    },
    ["orange_cats3"] = {
        label = "3 Stack Orange Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_orange.png",
        }
    },
    ["orange_cats4"] = {
        label = "4 Stack Orange Cats",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "kitty_orange.png",
        }
    },
    ["dualpress"] = {
        label = "Dual Pill Press",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "pillpress.png",
        }
    },
    ["triplepress"] = {
        label = "Triple Pill Press",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "pillpress.png",
        }
    },
    ["quadpress"] = {
        label = "Quad Pill Press",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "pillpress.png",
        }
    },
    ["spores"] = {
        label = "Spores",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "shrooms.png",
        }
    },
    ["cokeburner"] = {
        label = "Coke Burner",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "gta5phone.png",
        }
    },
    ["crackburner"] = {
        label = "Crack Burner",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "gta5phone.png",
        }
    },
    ["heroinburner"] = {
        label = "Heroin Burner",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "gta5phone.png",
        }
    },
    ["lsdburner"] = {
        label = "LSD Burner",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "gta5phone.png",
        }
    },
    ["cactusbulb"] = {
        label = "Cactus Bulb",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "cactusbulb.png",
        }
    },
    ["driedmescaline"] = {
        label = "Mescaline",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "driedmescaline.png",
        }
    },
    ["mdlean"] = {
        label = "Sizzurup",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "Sizzurup.png",
        }
    },
    ["mdreddextro"] = {
        label = "Red Dextro",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "reddextro.png",
        }
    },
    ["wetcannabis"] = {
        label = "Wet Cannabis",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "wetcannabis.png",
        }
    },
    ["drycannabis"] = {
        label = "Dry Cannabis",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "driedcannabis.png",
        }
    },
    ["weedgrinder"] = {
        label = "Weed Grinder",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "weedgrinder.png",
        }
    },
    ["mdbutter"] = {
        label = "Butter",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "butter.png",
        }
    },
    ["cannabutter"] = {
        label = "Canna-Butter",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "cannabutter.png",
        }
    },
    ["specialbrownie"] = {
        label = "Special Brownie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "chocolate.png",
        }
    },
    ["specialcookie"] = {
        label = "Special Cookie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "specialcookie.png",
        }
    },
    ["specialmuffin"] = {
        label = "Special Muffin",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "specialmuffin.png",
        }
    },
    ["specialchocolate"] = {
        label = "Special Chocolate",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "specialchocolate.png",
        }
    },
    ["grindedweed"] = {
        label = "Keef",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "keef.png",
        }
    },
    ["flour"] = {
        label = "Flour",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "flour.png",
        }
    },
    ["chocolate"] = {
        label = "Chocolate",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "chocolate.png",
        }
    },
    ["ephedrine"] = {
        label = "Ephedrine",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "ephedrine.png",
        }
    },
    ["acetone"] = {
        label = "Acetone",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "acetone.png",
        }
    },
    ["methbags"] = {
        label = "Meth",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "methbags.png",
        }
    },
    ["blunt"] = {
        label = "Blunts",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "blunt.png",
        }
    },
    ["butane"] = {
        label = "Butane",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "butane.png",
        }
    },
    ["butanetorch"] = {
        label = "Butane Torch",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "butanetorch.png",
        }
    },
    ["dabrig"] = {
        label = "Dab Rig",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "dabrig2.png",
        }
    },
    ["mdwoods"] = {
        label = "MDWOODS",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "mdwoods.png",
        }
    },
    ["ciggie"] = {
        label = "Ciggie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "ciggie.png",
        }
    },
    ["tobacco"] = {
        label = "Tobacco",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "tobacco.png",
        }
    },
    ["shatter"] = {
        label = "Shatter",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "shatter.png",
        }
    },
    ["bluntwrap"] = {
        label = "Blunt Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "bluntwrap.png",
        }
    },
    ["leanbluntwrap"] = {
        label = "Lean Blunt Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "leanbluntwrap.png",
        }
    },
    ["dextroblunt"] = {
        label = "Dextro Blunt Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "dextroblunt.png",
        }
    },
    ["leanblunts"] = {
        label = "Lean Blunts",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "leanblunts.png",
        }
    },
    ["dextroblunts"] = {
        label = "Dextro Blunts",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "dextroblunts.png",
        }
    },
    ["chewyblunt"] = {
        label = "Chewy",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "blunt.png",
        }
    },
    ["sprunk"] = {
        label = "Sprunk",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "sprunk.png",
        }
    },
    ["leancup"] = {
        label = "Empty Cup",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "leancup.png",
        }
    },
    ["cupoflean"] = {
        label = "Lean Cup",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "cupoflean.png",
        }
    },
    ["cupofdextro"] = {
        label = "Dextro Cup",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "cupofdextro.png",
        }
    },
    ["xtcburner"] = {
        label = "XTC Burner",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "gta5phone.png",
        }
		},
		 ["dextrobluntwrap"] = {
        label = "Dextro Blunt Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "dextrobluntwrap.png",
        }
    },

	["baking_soda"] = {
		label = "Baking Soda",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_access"] = {
		label = "Access card",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_box"] = {
		label = "Box with Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_figure"] = {
		label = "Action Figure",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_figurebroken"] = {
		label = "Pieces of Action Figure",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_figureempty"] = {
		label = "Action Figure",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_leaf"] = {
		label = "Coca Leaf",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_pure"] = {
		label = "Pure Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["coke_raw"] = {
		label = "Raw Coke",
		weight = 1,
		stack = true,
		close = true,
	},

	["crack"] = {
		label = "Crack",
		weight = 1,
		stack = true,
		close = true,
	},

	["crack_pipe"] = {
		label = "Crack Pipe",
		weight = 1,
		stack = true,
		close = true,
	},

	["ecstasy1"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["ecstasy2"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["ecstasy3"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["ecstasy4"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["ecstasy5"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["glue"] = {
		label = "Glue",
		weight = 1,
		stack = true,
		close = true,
	},

	["hammer"] = {
		label = "Hammer",
		weight = 1,
		stack = true,
		close = true,
	},

	["heroin_syringe"] = {
		label = "Heroin Syringe",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd1"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd2"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd3"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd4"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["lsd5"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["magicmushroom"] = {
		label = "Mushroom",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_access"] = {
		label = "Access card",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_amoniak"] = {
		label = "Ammonia",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_bag"] = {
		label = "Meth bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_emptysacid"] = {
		label = "Empty Canister",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_glass"] = {
		label = "Tray with meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_pipe"] = {
		label = "Meth Pipe",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_sacid"] = {
		label = "Sodium Benzoate Canister",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_sharp"] = {
		label = "Tray with smashed meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_wrap"] = {
		label = "Blunt wraps",
		weight = 1,
		stack = true,
		close = true,
	},

	["xanaxpack"] = {
		label = "Pack of Xanax",
		weight = 1,
		stack = true,
		close = true,
	},

	["xanaxpill"] = {
		label = "Xanax pill",
		weight = 1,
		stack = true,
		close = true,
	},

	["xanaxplate"] = {
		label = "Plate of Xanax",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastic_bag"] = {
		label = "Plastic bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["poppyplant"] = {
		label = "Poppy Plant",
		weight = 1,
		stack = true,
		close = true,
	},

	["scale"] = {
		label = "Scale",
		weight = 1,
		stack = true,
		close = true,
	},

	["scissors"] = {
		label = "Scissors",
		weight = 1,
		stack = true,
		close = true,
	},

	["syringe"] = {
		label = "Syringe",
		weight = 1,
		stack = true,
		close = true,
	},

	["trowel"] = {
		label = "Trowel",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_access"] = {
		label = "Access card",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_blunt"] = {
		label = "Blunt",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_bud"] = {
		label = "Weed Bud",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_budclean"] = {
		label = "Weed Bud",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_joint"] = {
		label = "Joint",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_package"] = {
		label = "Weed Bag",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_papers"] = {
		label = "Weed papers",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_syringe"] = {
		label = "Meth Syringe",
		weight = 1,
		stack = true,
		close = true,
	},

	["drink_sprite"] = {
		label = "Sprite",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_ecstasy"] = {
		label = "Ecstasy",
		weight = 1,
		stack = true,
		close = true,
	},

	["ammonium_nitrate"] = {
		label = "Ammonium nitrate",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lsd"] = {
		label = "LSD",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
	},

	["carbon"] = {
		label = "Carbon",
		weight = 1,
		stack = true,
		close = true,
	},

	["codeine"] = {
		label = "Codeine",
		weight = 1,
		stack = true,
		close = true,
	},

	["muriatic_acid"] = {
		label = "Muriatic Acid",
		weight = 1,
		stack = true,
		close = true,
	},

	["nitrogen"] = {
		label = "Nitrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["oxygen"] = {
		label = "Oxygen",
		weight = 1,
		stack = true,
		close = true,
	},

	["hydrogen"] = {
		label = "Hydrogen",
		weight = 1,
		stack = true,
		close = true,
	},

	["ice"] = {
		label = "Ice",
		weight = 1,
		stack = true,
		close = true,
	},

	["jolly_ranchers"] = {
		label = "Jolly Ranchers",
		weight = 1,
		stack = true,
		close = true,
	},

	["pseudoefedrine"] = {
		label = "Pseudoefedrine",
		weight = 1,
		stack = true,
		close = true,
	},

	["liquid_sulfur"] = {
		label = "Liquid Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["red_sulfur"] = {
		label = "Red Sulfur",
		weight = 1,
		stack = true,
		close = true,
	},

	["sodium_hydroxide"] = {
		label = "Sodium hydroxide",
		weight = 1,
		stack = true,
		close = true,
	},

	["drug_lean"] = {
		label = "Lean",
		weight = 1,
		stack = true,
		close = true,
	},

    ["wateringcan"] = {
        label = "Watering Can",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["raker"] = {
        label = "Raker",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["shovel"] = {
        label = "Shovel",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["melonseed"] = {
        label = "Melon Seed",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pumpkinseed"] = {
        label = "Pumpkin Seed",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["wheatseed"] = {
        label = "Wheat Seed",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["churn"] = {
        label = "Churn",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["milkbottle"] = {
        label = "Milk Bottle",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["melon"] = {
        label = "Cutted Melon",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pumpkin"] = {
        label = "Cutted Pumpkin",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["wheat"] = {
        label = "Wheat",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    --END

	["apple"] = {
		label = "Pomme",
		weight = 3,
		stack = true,
		close = true,
	},

	["applejuice"] = {
		label = "Jus de pomme",
		weight = 2,
		stack = true,
		close = true,
	},

	["green_phone"] = {
		label = "Telephone Vert",
		weight = 1,
		stack = true,
		close = true,
	},

	["blue_phone"] = {
		label = "Telephone bleu",
		weight = 1,
		stack = true,
		close = true,
	},

	["white_phone"] = {
		label = "Telephone Blanc",
		weight = 1,
		stack = true,
		close = true,
	},
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
