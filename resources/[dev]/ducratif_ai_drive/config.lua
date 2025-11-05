--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

-- Base
Config.Debug = false
Config.Locale = 'fr'
Config.WebhookURL = 'TON_WEBHOOK_DUCRATIF' -- Discord webhook pour logs (peut être vide)
Config.CurrencySymbol = '$'

-- ESX / BDD
Config.OwnedVehiclesTable = 'owned_vehicles'
Config.OwnedVehiclesOwnerColumn = 'owner'         -- ou 'identifier' si tu utilises autre chose
Config.OwnedVehiclesPlateColumn = 'plate'
Config.MaxPlateLength = 12

-- Identifiants autorisés pour Staff override (peut rester vide)
Config.AdminGroups = { 'superadmin', 'admin' }
Config.AdminIdentifiers = { 
    -- 'license:xxxxxxxxxx',
    -- 'discord:1234567890'
}

-- PNJ IA
Config.NPC = {
    model = 's_m_m_scientist_01',
    coords = vec4(379.8137, 3585.4482, 33.2923, 72.6267), -- Concession par défaut
    targetIcon = 'fa-solid fa-robot',
    radiusDetectVeh = 25.0, -- Distance max pour détecter le véhicule du joueur
}


-- Liste des blips (tu peux en ajouter autant que tu veux)
Config.Blips = {
    {
        coords = vector3(379.8137, 3585.4482, 33.2923), -- Position
        sprite = 647,      -- Icône du blip (ex: 225 = magasin)
        colour = 3,        -- Couleur (3 = bleu)
        scale = 0.8,       -- Taille
        shortRange = false, -- true = visible seulement à proximité
        label = "Magasin Auto-Pilote" -- Nom affiché sur la map
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


-- Prix
Config.PriceEnableAI = 1000000
Config.PriceDisableAI = 200000

Config.PriceDrivingMode = 350000
Config.PriceLimiter = 200000
Config.PriceCruise = 250000
Config.PriceCollisionAvoid = 350000

-- Favoris
Config.DefaultFavSlots = 10
Config.MaxFavSlots = 30
Config.PriceFavSlot = 20000

-- Zones interdites IA (exemples)
-- Chaque zone: { coords = vec3(x,y,z), radius = 150.0, label = "Zone Interdite" }
Config.ForbiddenZones = {
    { coords = vec3(231.1735, -844.9195, 29.7339), radius = 100, label = "Place des cubes" },
    { coords = vec3(-1036.0, -2737.0, 20.0), radius = 250.0, label = "Aéroport" },
    { coords = vec3(-2138.0, 3250.0, 32.0), radius = 150.0, label = "Base militaire" }
}

-- Classes / modèles blacklist (IA interdite)
Config.BlacklistClasses = { 8 } -- 8 = motos
Config.BlacklistModels = { 'polmav', 'buzzard', 'dinghy', 'jetmax' } -- hélicos/bateaux exemple

-- Police / Sirènes
Config.PoliceJobs = { 'police', 'bcso', 'gendarme' }
Config.PoliceDetectRadius = 20.0          -- rayon 2D autour du véhicule IA
Config.PoliceRequestDelay = 10            -- secondes avant proposition à la police
Config.PoliceRequestOnceCooldown = 120    -- éviter le spam pendant Xs

-- Conduite IA
Config.KeyOpenPanel = 'N' -- touche pour ouvrir la NUI en véhicule
Config.CommandStop = 'ia_stop'
Config.CommandFavAdd = 'ia_fav'

-- Styles de conduite (driving style flags GTA)
-- Ces flags combinent la logique de la conduite (prudent/agressif). Voir docs natives TASK.
Config.DrivingStyles = {
    souple   = 0xC00AB, -- Stay in lanes, avoid traffic, more braking (exemple)
    rapide   = 0x400C2, -- Default fast
    violente = 0x000C2  -- Very aggressive (exemple)
}

-- Vitesses cibles par mode (km/h)
Config.DrivingSpeeds = {
    souple = 60,
    rapide = 120,
    violente = 190
}

-- Prix de l'option
Config.PriceLawless = 350000  -- à ajuster

-- Styles de conduite “sans code”
-- 2883621 est un style courant qui ignore feux/stops et force les dépassements.
Config.DrivingStylesLawless = {
    souple   = 2883621,
    rapide   = 2883621,
    violente = 2883621
}



-- Auto-Park (simple)
Config.AutoPark = {
    Enabled = true,
    DistanceToStart = 25.0, -- quand on est proche de l'arrivée
    FinalStopDistance = 6.0 -- stop à ~6m du waypoint
}

-- Pneu crevé : impose limite 40 km/h + alerte
Config.FlatTyreLimitKmh = 40

-- Détection & recalage (anti-blocage)
Config.RetaskInterval = 10       -- toutes les Xs, on retask si besoin
Config.StuckSpeedThreshold = 1.5 -- en m/s
Config.StuckTimeout = 8         -- si bloqué pendant Xs => retask

-- Entretien IA (durabilité des options)
-- Mode de conso: 'time' ou 'distance'
Config.ConsumptionMode = 'time'
Config.ConsumptionTimeMinutes = 60  -- si 'time': 100% == 60 minutes ON
Config.ConsumptionPerKm = 10        -- si 'distance': 100% == 10 km ON

-- Items ox_inventory
Config.Items = {
    module = {
        name = 'module_ia',
        label = 'Module IA',
        weight = 200,
        stack = true,
        description = 'Restaure à 100% une option IA au choix.',
        icon = 'chip1.png'
    },
    premium = {
        name = 'module_ia_premium',
        label = 'Module IA Premium',
        weight = 200,
        stack = true,
        description = 'Restaure à 50% toutes les options.',
        icon = 'chip2.png'
    },
    platinum = {
        name = 'module_ia_platinum',
        label = 'Module IA Platine',
        weight = 200,
        stack = true,
        description = 'Restaure à 100% toutes les options.',
        icon = 'chip3.png'
    }
}

-- Calibration (mini-tutoriel)
Config.Calibration = {
    Required   = true,
    Checkpoints = 3,          -- nb de points auto si Points est vide
    Radius     = 120.0,       -- rayon autour du PNJ pour générer des points auto
    RewardXP   = 0,           -- si tu veux filer de l'XP, sinon 0
    Timeout    = 600,         -- secondes max pour finir

    -- Points de calibrage personnalisés (optionnel).
    -- Si cette liste est VIDE -> on utilisera l’anneau auto autour du PNJ.
    Points = {
        { x = 365.8419, y = 3605.8372, z = 33.4102 },
        { x = 346.6551, y = 3596.9460, z = 33.4093 },
        { x = 327.5369, y = 3571.0388, z = 33.5555 },
        { x = 340.9204, y = 3547.7949, z = 33.5166 },
        { x = 354.3085, y = 3561.6082, z = 33.6068 },
        { x = 357.7247, y = 3593.4270, z = 33.3540 },
        { x = 372.5392, y = 3592.7822, z = 33.3498 },

        -- { x = 454.12, y = -1023.55, z = 28.0 },
        -- { x = , y = , z = },
    },

    -- Pose auto sur le sol + réglages d’approche
    SnapToGround     = true,   -- recale Z au sol
    GroundOffset     = 0.35,   -- petit offset au-dessus du sol
    ApproachDistance = 25.0,   -- distance pour “aimanter” vers le point
    ReachDistance    = 18.0,   -- distance qui valide le point
    ApproachKmh      = 35.0,   -- vitesse d’approche quand proche
}


-- UI
Config.UI = {
    Brand = 'GuerreRP • IA Drive',
    ThemeColor = '#00ffc8'
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
