--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.Framework = 'esx' -- esx or qbcore

Config.HospitalZones = {
    {coords = vector3(311.5,-586.1,42.8), reviveSpawn = vector3(350.6294, -605.1120, 28.7706)}
}

Config.Bill = 100
Config.EMSCheck = 0 -- How many EMS you can still use the script with (if 0 it means if one ems is on you can't use checkin)

Config.ElevatorAreas = {
    --{
    --    name = "Elevator Lobby",
    --    coords = vector3(331.2553, -592.9760, 43.2820), -- Coordinates for the lobby area
    --    floors = {
    --        ground = vector3(331.2553, -592.9760, 43.2820), -- Coordinates for the ground floor
    --        first = vector3(335.8722, -580.4544, 48.24090), -- Coordinates for the first floor
    --        roof = vector3(335.9131, -580.2318, 74.0704), -- Coordinates for the roof
    --        basement = vector3(331.1729, -592.5579, 28.9011) -- Coordinates for the basement
    --    }
    --},
    --{
    --    name = "Elevator Lobby",
    --    coords = vector3(335.9096, -580.2586, 43.2910), -- Coordinates for the lobby area
    --    floors = {
    --        ground = vector3(335.9096, -580.2586, 43.2910), -- Coordinates for the ground floor
    --        first = vector3(335.8453, -580.3724, 48.2409), -- Coordinates for the first floor
    --        roof = vector3(335.8084, -580.4531, 74.0704), -- Coordinates for the roof
    --        basement = vector3(335.7577, -580.2365, 28.9011) -- Coordinates for the basement
    --    }
    --}
    
    -- Add more elevator areas if needed
}

Config.HealingPerSecond = 1 -- Heal every * second
Config.HealingAmount = 2 -- How much you heal per above seconds 

Config.MedBed = {
	KeyToUse = 38, 
	KeyToLeave = 23, 

    LayDownAnims = {
        {dict = 'anim@gangops@morgue@table@', anim = 'ko_front'},
		{dict = 'anim@amb@nightclub@lazlow@lo_sofa@', anim = 'lowsofa_dlg_fuckedup_laz'},
        {dict = 'amb@world_human_sunbathe@male@back@idle_a', anim = 'idle_a'}
    },


    LayStomachAnims = {
        {dict = 'amb@world_human_sunbathe@male@front@idle_a', anim = 'idle_a'},
        {anim='WORLD_HUMAN_SUNBATHE'},
    },


    SitBedAnims = {
        {dict = 'anim@heists@ornate_bank@hostages@hit', anim = 'hit_loop_ped_b'},
		{dict = 'anim@female_sit_01', anim = 'f_sit_01_clip'},
		{dict = 'anim@amb@business@bgen@bgen_no_work@', anim = 'sit_phone_phoneputdown_sleeping-noworkfemale'},
        {anim='WORLD_HUMAN_PICNIC'}
    },

	Beds = {
		{model="v_med_bed2", offsetx=0.0, offsety=0.0, offsetz=-1.4, heading=0.0, bed=true},
		{model="v_med_bed1", offsetx=0.0, offsety=0.0, offsetz=-1.4, heading=0.0, bed=true},
		{model="v_med_emptybed", offsetx=0.0, offsety=0.13, offsetz=-0.2, heading=90.0, bed=true},
        {model="prop_wheeldchair_01", offsetx=0.0, offsety=0.13, offsetz=-0.2, heading=90.0, bed=true},
        
	}
}


Config.Text = {
	SitOnBed = 'Appuie sur ~o~[E]~w~ pour t\'asseoir sur le lit',
    LayOnBed = 'Appuie sur ~o~[E]~w~ pour t\'allonger sur le lit',
    SwitchBetween = 'Change de position avec ~p~[Gauche]~w~ et ~b~[Droite]~w~',
    ExitBed = 'Appuie sur ~y~[Bas]~w~ pour changer de style ou ~r~[F]~w~ pour te lever',
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
