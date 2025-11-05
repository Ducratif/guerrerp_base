--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

-- Liste des blips (tu peux en ajouter autant que tu veux)
Config.Blips = {
    {
        coords = vector3(-1368.35, 56.31, 53.7), -- Position
        sprite = 463,      -- Icône du blip (ex: 463 = Animal)
        colour = 43,        -- Couleur (43 = Light Green)
        scale = 0.8,       -- Taille
        shortRange = false, -- true = visible seulement à proximité
        label = "Animalerie" -- Nom affiché sur la map
    },
    -- Exemple pour un deuxième blip :
    -- {
    --     coords = vector3(-42.4, -1098.9, 26.4),
    --     sprite = 402,
    --     colour = 1,
    --     scale = 0.9,
    --     shortRange = false,
    --     label = "Concessionnaire"
    -- }
}


PET = {
    -- "/petinfo" to turn off the part that comes up when you approach pets.
    debugMode = false, -- Certain prints are turned on, if you don't understand this you don't need to turn it on at all, it's here to help us understand where the error is when the script has problems.
    -- 
    petInfoCommand = "petinfo", -- Command used to turn off the pet's on-screen infos
    showPetCommand = "showmyPets", -- Blip showing the location of the pet
    -- 
    DefaultPetIMG = "https://i.imgur.com/KgYQa3W.jpeg",
    DefaultPetName = "Animaux de compagnie", -- if the name is "", the system will automatically fill it with the one here.
    -- Pet Shop area
    petBuyCoords = vector3(732.6985, 2532.3401, 73.2098), -- purchase marker part of the pet
    petShowCoords = vector4(730.8358, 2532.7244, 74.2219, 227.1795),-- Where to spawn when in the pet purchase menu

    -- SQL 
    Mysql = "oxmysql",
    --NEEDS SYSETM

    --====================================
    --Ajouter les item ox_inventory
    petHealFillItem = "pethealth", -- the pad's full of health, hunger and thirst remain as they are.
    petHealFillAmount = 97, -- How much to fill when used --max 97

    petHungryFillItem = "petfood", -- item to fill pet's hunger
    petHungryFillAmount = 97,  -- How much to fill when used --max 97

    petThirstFillItem = "petthirst", -- item to fill pet's thirst
    petThirstFillAmount = 50, -- How much to fill when used --max 97
    --====================================

    -- DEADTH SIDE
    PermanentlyDie = false, -- if "true", the pet will be directly deleted when it dies and will never come back.
    -- UPTADES
    UpdateAnimInterval = 0, -- If the pad is going into animation, like dying, etc., how many seconds will it be checked?
    UpdateInterval = 1, -- "1minutes" will update all pets' death, hunger, thirst, location and many other updates every 1 minute (it will be good to do this in a short time to live without problems).
    UpdateXPInterval = 10, -- "1minutes" Every 1 minute all pets will gain a set amount of xp.
    LevelingDifficulty = 20,--% Indicates the health starvation value that the pet will have directly when you buy it the difficulty to level up in [ % ]  
    --
    lossOfLife_hungry = 3, -- Selects how many lives to take when Hunger drops to 0.
    lossOfLife_thirst = 1, -- Selects how many lives to take when Thirst drops to 0.
    --
    earnXPAmount = 10, -- "UpdateXPInterval" time during which all pets will gain +1 xp for the specified amount of time
    --
    NotificationInScript = true, -- If this is "true" you will use the script's own notify system.
    Notification = function(text, inform) -- You can put your own notify text here
        
    end,
    PetMiniMap = { showblip = true, sprite = 442, colour = 2, shortRange = false },
    -- ROPE SIDE
    ropeLength = 4, -- How long the towing rope should be (in meters) I highly recommend keeping it between 6 and 10 meters
    ropeItem = "petrope",
    -- Ball
    petBallItem = "petball",

    --Pet Attack
    chaseDistance = 50.0,
    chaseIndicator = true, -- huge marker on hunted target head
    petAttackKeyCode = 49, --https://docs.fivem.net/docs/game-references/controls/
    petAttackKeyCodeDisplay = "APPUI SUR ~g~F~w~ POUR ATTAQUER", --Displaying Text
    -- PET Interact
    petInteractKeyCode = 38, -- [ E ] https://docs.fivem.net/docs/game-references/controls/
    -- Random animations
    RandomAnim = {
        ["dog"] = {
            -- {
            --     animName = "creatures@rottweiler@amb@",
            --     animID = "hump_loop_chop" 
            -- },
            {
                animName = "creatures@rottweiler@amb@world_dog_sitting@idle_a",
                animID = "idle_b" 
            },
            {
                animName = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                animID = "idle_a" 
            },
            {
                animName = "creatures@rottweiler@amb@sleep_in_kennel@",
                animID = "sleep_in_kennel" 
            }, 
            
        },
        ["cat"] = {
            {
                animName = "creatures@cat@amb@world_cat_sleeping_ground@base",
                animID = "base" 
            }, 
            {
                animName = "creatures@cat@amb@world_cat_sleeping_ledge@base",
                animID = "base" 
            }, 
            -- {
            --     animName = "creatures@cat@step",
            --     animID = "step_lft" 
            -- }, 
            
        },
        ["bird"] = {
            {
                animName = "creatures@chickenhawk@amb@world_chickenhawk_feeding@base",
                animID = "base" 
            }, 
            {
                animName = "creatures@cormorant@amb@world_cormorant_standing@base",
                animID = "base" 
            },   
        },
        ["coguar"] = {
            { -- rest
                animName = "creatures@cougar@amb@world_cougar_rest@idle_a",
                animID = "idle_a" 
            }, 
            { -- getup
                animName = "creatures@cougar@getup",
                animID = "idle_a" 
            },   
        }  
    },
    --

    --[[ 
        petTexureID  => {
            Rottweiler => Hiç Rengi yok
            Shepherd => {
                [0] : Basic,
                [1] : White and black,
                [2] : Brown,
            } 
            Husky => {
                [0] : Basic,
                [1] : Gold Brown,
                [2] : White, 
            }
            Retriever => {
                [0] : Basic,
                [1] : Black,
                [2] : White Gold, 
                [3] : Brown, 
            }
            Cat => {
                [0] : Basic,
                [1] :  White And Black,
                [2] : Brown- like a redhead :D, 
            }
        }

    ]]
    
    AvailablePets = {
        {
            price = 1350000,
            hungryRatio = 30, --% When you buy the pet, it will directly indicate the health hunger value of the pet. 
            thirstRatio = 80, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 70, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 90, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
 
            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            petName = "Rottweiler",
            petLabel = "Le Rottweiler est l’une des plus anciennes races canines connues, datant de l’Empire romain. Grâce à ses qualités de berger et de gardien, il a aidé les humains dans de nombreux domaines. Il est même reconnu comme la race qui guidait les troupeaux des armées romaines franchissant les Alpes et protégeait les personnes du convoi.",
            petIMG = "https://docs.fivem.net/peds/a_c_rottweiler.webp",
            pedHash = "a_c_chop",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "F", -- Pet'in cinsiyeti "M ya da F" tarzında olacaktır M = male   F = female
            petLevel = 6, -- Pet'i satın aldığınız zaman otomatik olarak olacak olan leveli
            petBoughtAnim = true, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        },    
        {
            price = 1300000,
            hungryRatio = 30, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 80, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 70, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 90, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
 
            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            petName = "Popu",
            petLabel = "West Highland White Terrier (Westie) vif et courageux au pelage blanc. Curieux, alerte et affectueux, il prévient au moindre bruit et adore fouiller. Robuste malgré sa taille, parfait compagnon joueur et fidèle.",
            petIMG = "",
            pedHash = "a_c_westy",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "F",
            petLevel = 5,
            petBoughtAnim = false, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        }, 
        {
            price = 900000,
            hungryRatio = 10, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 20, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 50, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 98, --% When you buy the pet, it will directly indicate the health hunger value of the pet.

            hungryDecrase = 5, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 5, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            
            petName = "Golden Retriever",
            petLabel = "Golden Retriever, race de chien. Originaire d’Écosse vers le XIXᵉ siècle, il était alors utilisé comme aide pour les activités de chasse.",
            petIMG = "https://i.imgur.com/KgYQa3W.jpeg",
            pedHash = "a_c_retriever",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.s
            petGender = "M",
            petBoughtAnim = true, -- With or without a purchase animation?
            petLevel = 10,
            listOf = "dog", -- which list to be on
        },  
        {
            price = 1250000,
            hungryRatio = 30, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 80, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 70, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 90, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
 
            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            petName = "Carlin",
            petLabel = "Le Rottweiler est l’une des plus anciennes races canines connues, datant de l’Empire romain. Grâce à ses qualités de berger et de gardien, il a aidé les humains dans de nombreux domaines. Il est même reconnu comme la race qui guidait les troupeaux des armées romaines franchissant les Alpes et protégeait les personnes du convoi.",
            petIMG = "",
            pedHash = "a_c_pug",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "F",
            petLevel = 4,
            petBoughtAnim = false, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        },       
        {
            price = 1250000,
            hungryRatio = 30, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 80, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 70, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 90, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
 
            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            petName = "Caniche",
            petLabel = "The Rottweiler is one of the oldest known dog breeds,[1] dating back to the Roman Empire. With their herding and guarding characteristics, they have been the helpers of people in many matters. It is even recognized as the breed that led the herds of the Roman armies crossing the alpine mountains and protected the people in the caravan..",
            petIMG = "",
            pedHash = "a_c_poodle",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "F",
            petLevel = 4,
            petBoughtAnim = false, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        },     
        
        {
            price = 1350000,
            hungryRatio = 30, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 80, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 70, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 90, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
 
            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            petName = "Berger allemand",
            petLabel = "Chien de travail polyvalent, très intelligent et obéissant. Excellent gardien, attentif et courageux ; il apprend vite les ordres et protège naturellement son maître. Bon équilibre entre puissance, agilité et sang-froid.",
            petIMG = "",
            pedHash = "a_c_shepherd",
            petTexureID = 2, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "F",
            petLevel = 6,
            petBoughtAnim = true, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        },
        {
            price = 900000,
            hungryRatio = 10, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 20, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 50, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 98, --% When you buy the pet, it will directly indicate the health hunger value of the pet.

            hungryDecrase = 5, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 5, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20
            
            petName = "Rootti",
            petLabel = "Husky sibérien endurant au pelage épais, né pour la course et les climats froids. Joueur mais parfois têtu, il a besoin d’activité et reste très loyal. Excellente endurance et sens de l’orientation, avec une forte envie d’explorer.",
            petIMG = "",
            pedHash = "a_c_husky",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.
            petGender = "M",
            petLevel = 10,
            petBoughtAnim = true, -- With or without a purchase animation?
            listOf = "dog", -- which list to be on
        },    
        {
            price = 1050000,
            -- ped'i satın aldığınız zaman otomatik olarak gelecek olan değerler
            hungryRatio = 10, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            thirstRatio = 20, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            energyRatio = 50, --% When you buy the pet, it will directly indicate the health hunger value of the pet.
            healthRatio = 98, --% When you buy the pet, it will directly indicate the health hunger value of the pet.

            hungryDecrase = 1, -- When the pet is updated it will go " -1 ", example => Hunger level 40, "the number you specify" in the specified time interval - 40
            thirstDecrase = 1, -- When the pet is updated it will go " -1 ", example => Thirst level 20, At the set time interval "the number you specify" - 20

            petName = "Chat domestique",
            petLabel = "Chat domestique : petit mammifère carnivore généralement poilu et domestiqué. Souvent gardés comme animaux de compagnie, on les appelle chats domestiques, ou simplement chats lorsqu’il n’est pas nécessaire de les distinguer des autres félins. Les gens apprécient leur compagnie et leur capacité à chasser les nuisibles et parasites domestiques.",
            petIMG = "",
            pedHash = "a_c_cat_01",
            petTexureID = 0, -- Pet TexureID > decides what color your pet will be so that it doesn't change color all the time or can have different colors.s
            petGender = "M",
            petBoughtAnim = true, -- With or without a purchase animation?
            petLevel = 5,
            listOf = "cat", -- which list to be on
        },  
    },
    --ORDER
    Orders = { -- In this section you can edit the orders that come directly to the pet, you can add different commands if you want.

        -- DOG
        {
            label = "Suis moi",
            listOf = "dog", -- if he's a dog, his action
            args = "lab-pet:client:followOwner", -- In the 1st list of arguments that come with the content of the pet system, there is "Animal Type", i.e. cat or dog, and the 2nd argument is the networkID of the animal, so the first two functions will be filled with whatever you type here.
            level = 0, -- at what level it can be applied
        },
        {
            label = "Assis",
            listOf = "dog", -- if he's a dog, his action
            args = "lab-pet:client:sit",
            level = 10, -- at what level it can be applied
        },
        {
            label = "LÈVE-TOI",
            listOf = "dog", -- if he's a dog, his action
            args = "lab-pet:client:getup",
            level = 10, -- at what level it can be applied
        },
        {
            label = "Allonger",
            listOf = "dog", -- if he's a dog, his action
            args = "lab-pet:client:sleep",
            level = 15, -- at what level it can be applied
        },
        {
            label = "Attaque",
            listOf = "dog", -- if he's a dog, his action
            args = "lab-pet:client:attack",
            level = 30, -- at what level it can be applied
        },
        {
            label = "MONTE DANS LA VOITURE",
            listOf = "dog", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:getIntoCar",
            level = 20, -- at what level it can be applied
        },
        {
            label = "DESCENDS DE LA VOITURE",
            listOf = "dog", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:getOutCar",
            level = 20, -- at what level it can be applied
        },

        --Cat 
        {
            label = "Suis moi",
            listOf = "cat", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:followOwner",
            level = 0, -- at what level it can be applied
        },
        {
            label = "Assis",
            listOf = "cat", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:sit",
            level = 15, -- at what level it can be applied
        },
        {
            label = "LÈVE-TOI",
            listOf = "cat", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:getup",
            level = 15, -- at what level it can be applied
        },
        {
            label = "MONTE DANS LA VOITURE",
            listOf = "cat", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:getIntoCar",
            level = 25, -- at what level it can be applied
        },
        {
            label = "DESCENDS DE LA VOITURE",
            listOf = "cat", -- eğer ki kedi ise yapacağı eylem
            args = "lab-pet:client:getOutCar",
            level = 25, -- at what level it can be applied
        },
    },
    OrderAnim = {
        ["dog"] = {
            ["sex"] = {
                animName = "creatures@rottweiler@amb@",
                animID = "hump_loop_chop" 
            },
            ["sit"] = {
                animName = "creatures@rottweiler@amb@world_dog_sitting@idle_a",
                animID = "idle_b" 
            },
            ["bark"] = {
                animName = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                animID = "idle_a" 
            },
            ["sleep"] = {
                animName = "creatures@rottweiler@amb@sleep_in_kennel@",
                animID = "sleep_in_kennel" 
            }, 
            ["getup"] = {
                animName = "creatures@rottweiler@amb@world_dog_sitting@exit",
                animID = "exit"
            }
            
        },
        ["cat"] = {
            ["sleep"] = {
                animName = "creatures@cat@amb@world_cat_sleeping_ground@base",
                animID = "base" 
            }, 
            ["getup"] = {
                animName = "creatures@cat@getup",
                animID = "getup_l" 
            },     
            ["sit"] = {
                animName = "creatures@cat@amb@world_cat_sleeping_ledge@base",
                animID = "base" 
            },       
        },
        -- ["bird"] = {
        --     {
        --         animName = "creatures@chickenhawk@amb@world_chickenhawk_feeding@base",
        --         animID = "base" 
        --     }, 
        --     {
        --         animName = "creatures@cormorant@amb@world_cormorant_standing@base",
        --         animID = "base" 
        --     },   
        -- }
    },
    
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
