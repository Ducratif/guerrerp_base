--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
return {

    DrawMarker = true, -- if you dont want marker put here false
    EnableFadeOut = false, -- if you dont want screen fading disable this

    Elevators = {
        --jobs = {'ambulance', 'police'}

        [1] = {
            name = 'Amrée Francaise',
            coords = {
                vec3(234.4164, -752.4289, 34.6336),   -- 1st floor  
                vec3(233.6222, -755.1555, 38.6500)   -- 2nd floor   
            },
            jobs = false
        },

        [2] = {
            name = 'Amrée Francaise',
            coords = {
                vec3(252.6344, -733.4013, 39.1012),   -- 1st floor  
                vec3(252.3667, -731.0283, 45.0900),   -- 2nd floor 
                vec3(259.4857, -700.4576, 49.8411),
                vec3(259.3108, -699.8152, 55.0611),
                vec3(259.4450, -700.2422, 62.7811),
                vec3(259.2651, -700.3683, 73.2711)
            },
            jobs = false
        },

        [3] = {
            name = 'Amrée Francaise',
            coords = {
                vec3(258.8220, -712.4075, 62.7811),   -- 1st floor  
                vec3(259.1260, -712.6547, 68.3411)
            },
            jobs = false
        },

        [4] = {
            name = 'CNU',
            coords = {
                vec3(4052.1567, 1890.1312, 23.2884),   -- 1st floor  
                vec3(4051.9033, 1890.0760, 83.3814)
            },
            jobs = false
        },

        [5] = {
            name = 'bunker1',
            coords = {
                vec3(2867.2383, 1689.7224, 24.2214),   -- 1st floor  
                vec3(3148.9766, 2200.4043, 4.2300)
            },
            jobs = false
        },

        [6] = {
            name = 'liegionnoir',
            coords = {
                vec3(991.6226, -2394.6763, 30.5292),   -- 1st floor  
                vec3(998.1544, -2390.7466, 30.1387)
            },
            jobs = false
        },


        --EMS PILLBOX--------------------------
        --ASSENCEUR STAFF EMS
        [7] = {
            name = 'ems',
            coords = {
                vec3(320.0758, -572.0576, 43.2710),   -- 1st floor  
                vec3(319.7806, -572.4446, 47.2767),
                vec3(330.6483, -579.4560, 74.1804)
            },
            jobs = {'ambulance', 'police'}
        },

        --ASSENCEUR PUBLIC EMS
        [8] = {
            name = 'ems',
            coords = {
                vec3(317.2022, -571.3316, 43.2710),   -- 1st floor  
                vec3(316.9857, -571.8788, 47.2767)
            },
            jobs = false
        },
        

        --ASSENCEUR PUBLIC EMS
        [9] = {
            name = 'ems',
            coords = {
                vec3(305.1183, -594.4893, 43.2709),   -- 1st floor  
                vec3(305.5545, -594.3450, 47.2768)
            },
            jobs = false
        },

        --ASSENCEUR PUBLIC EMS
        [10] = {
            name = 'ems',
            coords = {
                vec3(306.3373, -591.6401, 43.2710),   -- 1st floor  
                vec3(306.0897, -591.4871, 47.2767)
            },
            jobs = false
        },

        --Parking EMS
        [11] = {
            name = 'ems_parking',
            coords = {
                vec3(332.7358, -593.8346, 43.2654),   -- 1st floor  
                vec3(328.1917, -560.5787, 28.7438)
            },
            jobs = false
        },



        --POLICE CENTER
        [12] = {
            name = 'Police Local',
            coords = {
                vec3(466.3637, -983.7609, 30.6925), 
                vec3(466.2207, -983.4515, 35.5730), 
                vec3(466.1029, -983.6592, 39.2470)--Commandant
            },
            jobs = false
        },
       
    }
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
