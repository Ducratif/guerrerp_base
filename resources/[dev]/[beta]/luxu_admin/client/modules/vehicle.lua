--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Vehicle management system
-- Provides utilities for vehicle manipulation and control

-- Flip vehicle function: repositions and resets a vehicle
local function flipVehicle(networkId)
  -- Get vehicle entity from network ID
  local vehicleEntity = NetworkGetEntityFromNetworkId(networkId)
  
  -- Get current vehicle coordinates
  local vehicleCoords = GetEntityCoords(vehicleEntity)
  
  -- Set vehicle position slightly elevated (0.5 units up)
  SetEntityCoords(
    vehicleEntity,
    vehicleCoords.x,
    vehicleCoords.y,
    vehicleCoords.z + 0.5,
    true,   -- xAxis
    false,  -- yAxis
    true,   -- zAxis
    false   -- clearArea
  )
  
  -- Reset vehicle rotation (keep only heading)
  SetEntityRotation(
    vehicleEntity,
    0.0,  -- pitch
    0.0,  -- roll
    GetEntityHeading(vehicleEntity),  -- yaw (heading)
    2,    -- rotationOrder
    true  -- p5
  )
  
  -- Place vehicle properly on ground
  SetVehicleOnGroundProperly(vehicleEntity)
  
  -- Turn on vehicle engine
  SetVehicleEngineOn(
    vehicleEntity,
    true,   -- value
    true,   -- instantly
    false   -- disableAutoStart
  )
end

-- Export the flip vehicle function
FlipVehicle = flipVehicle

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
