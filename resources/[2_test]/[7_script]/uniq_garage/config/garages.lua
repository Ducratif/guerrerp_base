--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
return {
    ['Rancho Garage'] = {
        type = 'car',
        enter = vec3(224.345, -1872.465, 26.871),
        parkVehicle = vec3(234.624, -1875.155, 26.461),
        vehicleSpawnPoint = vec4(227.266, -1879.912, 26.128, 229.535),
        price = 15000000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 10 véhicules',
        interior = 'autoshop'
    },
    ['Vespucci Canals Agency Garage'] = {
        type = 'car',
        enter = vec3(-989.320, -767.753, 15.860),
        parkVehicle = vec3(-985.589, -768.380, 15.889),
        vehicleSpawnPoint = vec4(-986.758, -771.808, 16.050, 176.733),
        price = 18000000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 24 véhicules',
        interior = 'agency'
    },

    ['LSIA Hangar 1'] = {
        type = 'air',
        enter = vec3(-1159.452, -3404.947, 13.945),
        parkVehicle = vec3(-1136.366, -3385.850, 13.940),
        vehicleSpawnPoint = vec4(-1137.733, -3383.785, 14.476, 328.707),
        price = 30000000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 17, 18, 20 },
        GarageInfo = 'Stockage de 15 avions',
        interior = 'hangar'
    },

    ['142 Paleto Boulevard Garage'] = {
        type = 'car',
        enter = vec3(-71.172, 6424.803, 31.440),
        parkVehicle = vec3(-75.493, 6424.109, 31.490),
        vehicleSpawnPoint = vec4(-71.226, 6429.147, 31.439, 44.407),
        price = 500000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 2 véhicules',
        interior = 'low_end'
    },

    ['Sandy Shores Garage'] = {
        type = 'car',
        enter = vec3(1692.639, 3609.660, 35.337),
        parkVehicle = vec3(1695.920, 3610.201, 34.918),
        vehicleSpawnPoint = vec4(1696.327, 3606.274, 34.988, 211.205),
        price = 550000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 2 véhicules',
        interior = 'low_end'
    },

    ['1920 Senora Way Garage'] = {
        type = 'car',
        enter = vec3(2461.693, 1575.508, 33.113),
        parkVehicle = vec3(2464.812, 1589.407, 32.720),
        vehicleSpawnPoint = vec4(2467.202, 1589.228, 32.310, 272.111),
        price = 450000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 2 véhicules',
        interior = 'low_end'
    },

    ['Garage Innocence Boulevard'] = {
        type = 'car',
        enter = vec3(-341.679, -1474.928, 30.750),
        parkVehicle = vec3(-339.623, -1464.116, 30.597),
        vehicleSpawnPoint = vec4(-339.220, -1468.510, 30.175, 267.895),
        price = 750000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 2 véhicules',
        interior = 'low_end'
    },

    ['0552 Roy Lowenstein Boulevard Garage'] = {
        type = 'car',
        enter = vec3(496.698, -1494.373, 29.288),
        parkVehicle = vec3(507.246, -1495.342, 28.876),
        vehicleSpawnPoint = vec4(503.791, -1499.159, 28.877, 176.744),
        price = 1300000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 6 véhicules',
        interior = 'medium'
    },

    ['Unit 14 Popular Street Garage'] = {
        type = 'car',
        enter = vec3(894.702, -896.331, 27.784),
        parkVehicle = vec3(891.100, -891.772, 26.468),
        vehicleSpawnPoint = vec4(889.633, -887.195, 26.350, 89.930),
        price = 1200000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 6 véhicules',
        interior = 'medium'
    },

    ['0432 Davis Avenue Garage'] = {
        type = 'car',
        enter = vec3(452.586, -1593.908, 29.292),
        parkVehicle = vec3(469.284, -1595.989, 29.260),
        vehicleSpawnPoint = vec4(467.985, -1580.512, 28.711, 231.753),
        price = 1150000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 6 véhicules',
        interior = 'medium'
    },

    ['8754 Route 68 Garage'] = {
        type = 'car',
        enter = vec3(-1126.639, 2694.449, 18.800),
        parkVehicle = vec3(-1132.753, 2697.798, 18.800),
        vehicleSpawnPoint = vec4(-1134.554, 2693.697, 18.393, 153.034),
        price = 1200000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 6 véhicules',
        interior = 'medium'

    },

    ['Arcadius Business Centre Garage'] = {
        type = 'car',
        enter = vec3(-110.985, -605.060, 36.281),
        parkVehicle = vec3(-107.005, -610.433, 36.056),
        vehicleSpawnPoint = vec4(-109.346, -618.759, 36.061, 161.236),
        price = 40000000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Stockage de 24 véhicules',
        interior = 'ceo'
    },

    ['Eclipse Boulevard Garage'] = {
        type = 'car',
        enter = vec3(-286.271, 280.641, 89.888),
        parkVehicle = vec3(-269.203, 279.701, 90.306),
        vehicleSpawnPoint = vec4(-272.861, 277.642, 89.620, 175.041),
        price = 100000000,
        blip = { id = 357, colour = 3, scale = 0.9 },
        blackListClass = { 14, 15, 16, 19, 21 },
        GarageInfo = 'Capacité de stockage : 50 véhicules. Trois styles d\'intérieur sont proposés, avec 12 options d\'éclairage par étage, soit 5 étages au total..',
        interior = 'drugwar'
    }
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
