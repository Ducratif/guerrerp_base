--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Locales["en"] = {
    UI = {
        modal = {
            save = {
                title = "Enregistrer la personnalisation",
                description = "Tu resteras moche"
            },
            exit = {
                title = "Quitter la personnalisation",
                description = "Aucun changement ne sera enregistré"
            },
            accept = "Oui",
            decline = "Non"
        },
        ped = {
            title = "Ped",
            model = "Modèle"
        },
        headBlend = {
            title = "Hérédité",
            shape = {
                title = "Visage",
                firstOption = "Père",
                secondOption = "Mère",
                mix = "Mélange"
            },
            skin = {
                title = "Peau",
                firstOption = "Père",
                secondOption = "Mère",
                mix = "Mélange"
            },
            race = {
                title = "Race",
                shape = "Forme",
                skin = "Peau",
                mix = "Mélange"
            }
        },
        faceFeatures = {
            title = "Traits du visage",
            nose = {
                title = "Nez",
                width = "Largeur",
                height = "Hauteur",
                size = "Taille",
                boneHeight = "Hauteur de l’os",
                boneTwist = "Torsion de l’os",
                peakHeight = "Hauteur du sommet"
            },
            eyebrows = {
                title = "Sourcils",
                height = "Hauteur",
                depth = "Profondeur"
            },
            cheeks = {
                title = "Joues",
                boneHeight = "Hauteur de l’os",
                boneWidth = "Largeur de l’os",
                width = "Largeur"
            },
            eyesAndMouth = {
                title = "Yeux et bouche",
                eyesOpening = "Ouverture des yeux",
                lipsThickness = "Épaisseur des lèvres"
            },
            jaw = {
                title = "Mâchoire",
                width = "Largeur",
                size = "Taille"
            },
            chin = {
                title = "Menton",
                lowering = "Abaissement",
                length = "Longueur",
                size = "Taille",
                hole = "Taille de la fossette"
            },
            neck = {
                title = "Cou",
                thickness = "Épaisseur"
            }
        },
        headOverlays = {
            title = "Apparence",
            hair = {
                title = "Cheveux",
                style = "Style",
                color = "Couleur",
                highlight = "Mèches",
                texture = "Texture",
                fade = "Dégradé"
            },
            opacity = "Opacité",
            style = "Style",
            color = "Couleur",
            secondColor = "Couleur secondaire",
            blemishes = "Imperfections",
            beard = "Barbe",
            eyebrows = "Sourcils",
            ageing = "Vieillissement",
            makeUp = "Maquillage",
            blush = "Blush",
            complexion = "Teint",
            sunDamage = "Dommages du soleil",
            lipstick = "Rouge à lèvres",
            moleAndFreckles = "Grains de beauté et taches de rousseur",
            chestHair = "Poils de torse",
            bodyBlemishes = "Imperfections du corps",
            eyeColor = "Couleur des yeux"
        },
        components = {
            title = "Vêtements",
            drawable = "Composant",
            texture = "Texture",
            mask = "Masque",
            upperBody = "Mains",
            lowerBody = "Jambes",
            bags = "Sacs et parachute",
            shoes = "Chaussures",
            scarfAndChains = "Écharpe et chaînes",
            shirt = "Chemise",
            bodyArmor = "Gilet pare-balles",
            decals = "Décalcos",
            jackets = "Vestes",
            head = "Tête"
        },
        props = {
            title = "Accessoires",
            drawable = "Composant",
            texture = "Texture",
            hats = "Chapeaux et casques",
            glasses = "Lunettes",
            ear = "Oreilles",
            watches = "Montres",
            bracelets = "Bracelets"
        },
        tattoos = {
            title = "Tatouages",
            items = {
                ZONE_TORSO = "Torse",
                ZONE_HEAD = "Tête",
                ZONE_LEFT_ARM = "Bras gauche",
                ZONE_RIGHT_ARM = "Bras droit",
                ZONE_LEFT_LEG = "Jambe gauche",
                ZONE_RIGHT_LEG = "Jambe droite"
            },
            apply = "Appliquer",
            delete = "Retirer",
            deleteAll = "Retirer tous les tatouages",
            opacity = "Opacité"
        }
    },
    outfitManagement = {
        title = "Gestion des tenues",
        jobText = "Gérer les tenues pour le métier",
        gangText = "Gérer les tenues pour le gang"
    },
    cancelled = {
        title = "Personnalisation annulée",
        description = "Personnalisation non enregistrée"
    },
    outfits = {
        import = {
            title = "Entrer le code de tenue",
            menuTitle = "Importer une tenue",
            description = "Importer une tenue à partir d’un code de partage",
            name = {
                label = "Nom de la tenue",
                placeholder = "Une belle tenue",
                default = "Tenue importée"
            },
            code = {
                label = "Code de tenue"
            },
            success = {
                title = "Tenue importée",
                description = "Vous pouvez maintenant changer de tenue via le menu des tenues"
            },
            failure = {
                title = "Échec de l’importation",
                description = "Code de tenue invalide"
            }
        },
        generate = {
            title = "Générer un code de tenue",
            description = "Générer un code de tenue à partager",
            failure = {
                title = "Une erreur est survenue",
                description = "Échec de génération du code pour la tenue"
            },
            success = {
                title = "Code de tenue généré",
                description = "Voici votre code de tenue"
            }
        },
        save = {
            menuTitle = "Enregistrer la tenue actuelle",
            menuDescription = "Enregistrer votre tenue actuelle comme tenue %s",
            description = "Enregistrer votre tenue actuelle",
            title = "Nommez votre tenue",
            managementTitle = "Détails de gestion de la tenue",
            name = {
                label = "Nom de la tenue",
                placeholder = "Tenue très stylée"
            },
            gender = {
                label = "Genre",
                male = "Homme",
                female = "Femme"
            },
            rank = {
                label = "Grade minimum"
            },
            failure = {
                title = "Échec de l’enregistrement",
                description = "Une tenue avec ce nom existe déjà"
            },
            success = {
                title = "Succès",
                description = "La tenue %s a été enregistrée"
            }
        },
        update = {
            title = "Mettre à jour la tenue",
            description = "Enregistrer vos vêtements actuels sur une tenue existante",
            failure = {
                title = "Échec de la mise à jour",
                description = "Cette tenue n’existe pas"
            },
            success = {
                title = "Succès",
                description = "La tenue %s a été mise à jour"
            }
        },
        change = {
            title = "Changer de tenue",
            description = "Choisissez parmi vos tenues %s enregistrées",
            pDescription = "Choisissez parmi vos tenues enregistrées",
            failure = {
                title = "Une erreur est survenue",
                description = "La tenue que vous essayez d’équiper n’a pas d’apparence de base"
            }
        },
        delete = {
            title = "Supprimer une tenue",
            description = "Supprimer une tenue %s enregistrée",
            mDescription = "Supprimer n’importe laquelle de vos tenues enregistrées",
            item = {
                title = "Supprimer \"%s\"",
                description = "Modèle : %s%s"
            },
            success = {
                title = "Succès",
                description = "Tenue supprimée"
            }
        },
        manage = {
            title = "👔 | Gérer les tenues %s"
        }
    },
    jobOutfits = {
        title = "Tenues de travail",
        description = "Choisissez parmi vos tenues de travail"
    },
    menu = {
        returnTitle = "Retour",
        title = "Vestiaire",
        outfitsTitle = "Tenues du joueur",
        clothingShopTitle = "Magasin de vêtements",
        barberShopTitle = "Barbier",
        tattooShopTitle = "Salon de tatouage",
        surgeonShopTitle = "Chirurgien esthétique"
    },
    clothing = {
        title = "Acheter des vêtements - $%d",
        titleNoPrice = "Changer de vêtements",
        options = {
            title = "👔 | Options du magasin de vêtements",
            description = "Choisissez parmi un large choix d’articles à porter"
        },
        outfits = {
            title = "👔 | Options de tenue",
            civilian = {
                title = "Tenue civile",
                description = "Remettez vos vêtements"
            }
        }
    },
    commands = {
        reloadskin = {
            title = "Recharge votre personnage",
            failure = {
                title = "Erreur",
                description = "Vous ne pouvez pas utiliser reloadskin maintenant"
            }
        },
        clearstuckprops = {
            title = "Retire tous les accessoires attachés à l’entité",
            failure = {
                title = "Erreur",
                description = "Vous ne pouvez pas utiliser clearstuckprops maintenant"
            }
        },
        pedmenu = {
            title = "Ouvrir / Donner le menu de vêtements",
            failure = {
                title = "Erreur",
                description = "Joueur hors ligne"
            }
        },
        joboutfits = {
            title = "Ouvre le menu des tenues de métier"
        },
        gangoutfits = {
            title = "Ouvre le menu des tenues de gang"
        },
        bossmanagedoutfits = {
            title = "Ouvre le menu des tenues gérées par le patron"
        }
    },
    textUI = {
        clothing = "Magasin de vêtements - Prix : $%d",
        barber = "Barbier - Prix : $%d",
        tattoo = "Salon de tatouage - Prix : $%d",
        surgeon = "Chirurgien esthétique - Prix : $%d",
        clothingRoom = "Vestiaire",
        playerOutfitRoom = "Tenues"
    },
    migrate = {
        success = {
            title = "Succès",
            description = "Migration terminée. %s skins migrés",
            descriptionSingle = "Skin migré"
        },
        skip = {
            title = "Information",
            description = "Skin ignoré"
        },
        typeError = {
            title = "Erreur",
            description = "Type invalide"
        }
    },
    purchase = {
        tattoo = {
            success = {
                title = "Succès",
                description = "Tatouage %s acheté pour %s$"
            },
            failure = {
                title = "Échec de l’application du tatouage",
                description = "Vous n’avez pas assez d’argent !"
            }
        },
        store = {
            success = {
                title = "Succès",
                description = "Donné $%s à %s !"
            },
            failure = {
                title = "Exploit !",
                description = "Vous n’aviez pas assez d’argent ! Tentative d’exploiter le système !"
            }
        }
    }
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
