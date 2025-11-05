--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.locale()

Keys = {}
Keys.Debug = false             -- Prints and commands for developers.
Keys.Keys = true               -- Activate deactivate key system.
Keys.Distance = 5              -- Distance to open or close.
Keys.DistanceCreate = 205        -- Distance to create key.
Keys.CreateKeyTime = 1000       -- progressBar time.
Keys.ItemName = 'carkey'       -- Key Item.
Keys.ItemPlate = 'plate'        -- Plate item.
Keys.CopyPrice = 50             -- Price to buy copy keys.
Keys.PriceItemPlate = 1500      -- Price to change plate number
Keys.KeyOpenClose = 'U'         -- KeyBind Open / Close.
Keys.KeyToggleEngine = 'M'      -- KeyBind Open / Close.
Keys.CommandGiveKey = 'givekey' -- Give Key.
Keys.CommandDelKey = 'delkey'   -- Delete Key.
Keys.Engine = false              -- With this you will maintain control of the engine in the vehicle and you will only be able to start the engine with the keys.
Keys.OnExitCar = true           -- (Car key  necessary) Its purpose is to allow, if the vehicle is running and the "F" key is hold down, the engine will continue running. If the "F" key is pressed once and released, the engine will turn off. Initially, this function should only work if the vehicle is running.
Keys.CloseDoorsNPC = true       -- Close All NPC Cars Doors on create Entity.
Keys.DoorProbability = true     -- Probability of finding an open door. (Netx Update)
Keys.OpenDoorProbability = 0.7  -- Min 0.0 , Max 1.0.

Keys.NpcReclameKey = {
    {
        hash = 'a_m_y_beachvesp_02',
        PedScenario = "WORLD_HUMAN_GUARD_STAND",
        pos = vector3(-56.4195, -1098.47, 25.422),
        heading = 25.75,
        icon = 'fas fa-key',
        label = 'Plaque Voiture',
        debug = false,
        blip = true,    
        BuyKey =   true, 
        BuyPlate = false  
    },

    {
        hash = 'a_m_y_beachvesp_02',
        PedScenario = "WORLD_HUMAN_GUARD_STAND",
        pos = vector3(-1029.4833, -3015.8252, 12.9451),
        heading = 320.2145,
        icon = 'fas fa-poo',
        label = 'Serrurier Avion',
        debug = false,
        blip = true,    
        BuyKey =   true, 
        BuyPlate = false  
    },

    {
        hash = 'a_m_y_beachvesp_02',
        PedScenario = "WORLD_HUMAN_GUARD_STAND",
        pos = vector3(-724.4092, -1334.6445, 0.5963),
        heading = 47.1372,
        icon = 'fas fa-poo',
        label = 'Serrurier Bateaux',
        debug = false,
        blip = true,    
        BuyKey =   true, 
        BuyPlate = false  
    },
}

Keys.LockPick = {
    {
        enable = true,           -- Enable o disable LockPick
        alarmProbability = 1.0,  -- Min 0.0 max 1.0
        alarmTime = 10000,        
        SkillCheck = true,       
        TimeProgress = 2000,
        Skills = { 
            { {areaSize = 60, speedMultiplier = 1},{areaSize = 60, speedMultiplier = 0.5} ,{areaSize = 60, speedMultiplier = 0.5},{areaSize = 60, speedMultiplier = 0.5}}, { '1', '2', '3', '4' }
        },
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",      
        anim = "machinic_loop_mechandplayer",
        Disptach = false,                   
        DispatchFunction = function()  
            print('Dispatch activated.')
        end
    }
}

Keys.HotWire = {
    {
        enable = true,     -- Enable o Disable Hotwire.
        SkillCheck = true, 
        TimeProgress = 2000,  
        Skills = {
            { {areaSize = 60, speedMultiplier = 1},{areaSize = 60, speedMultiplier = 0.5} }, { '1', '2' }
        },
        animDict = "veh@std@ds@base",
        anim = "hotwire",
    }
}

RegisterNetEvent('sy_carkeys:Notification')
AddEventHandler('sy_carkeys:Notification', function(title, msg, icon, color)
    lib.notify({
        title = title,
        description = msg,
        position = 'top-right',
        icon = icon,
        iconColor = color
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
