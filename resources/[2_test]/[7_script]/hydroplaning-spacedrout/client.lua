--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Hydroplaning Script for FiveM
-- Author: SpaceDrout

local Config = {
    SpeedThreshold = 50.0, -- Speed (in MPH) at which hydroplaning can occur
    GripLossDuration = 3000, -- Duration of grip loss in milliseconds
    WeatherConditions = { "RAIN", "THUNDER", "SNOW" } -- Weather conditions that cause hydroplaning
}

-- Utility function to check if the weather causes hydroplaning
local function isHydroplaningWeather()
    local weatherType1, weatherType2, _ = GetWeatherTypeTransition()
    for _, weather in ipairs(Config.WeatherConditions) do
        local weatherHash = GetHashKey(weather)
        if weatherType1 == weatherHash or weatherType2 == weatherHash then
            return true
        end
    end
    return false
end

-- Function to handle hydroplaning effect
local function applyHydroplaning(vehicle)
    if not DoesEntityExist(vehicle) or IsVehicleOnAllWheels(vehicle) then return end

    -- Temporarily reduce vehicle traction
    SetVehicleReduceGrip(vehicle, true)
    Wait(Config.GripLossDuration)
    SetVehicleReduceGrip(vehicle, false)
end

-- Main thread to monitor player and AI vehicles
CreateThread(function()
    while true do
        Wait(100)

        -- Check if weather conditions allow hydroplaning
        if not isHydroplaningWeather() then
            Wait(1000) -- Check less frequently if no hydroplaning conditions
        else
            -- Check player vehicles
            local playerPed = PlayerPedId()
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local speed = GetEntitySpeed(vehicle) * 2.23694 -- Convert m/s to MPH
                if speed > Config.SpeedThreshold then
                    applyHydroplaning(vehicle)
                end
            end

            -- Check AI vehicles
            local vehicles = GetAllVehicles()
            for _, vehicle in ipairs(vehicles) do
                if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then -- AI vehicle
                    local speed = GetEntitySpeed(vehicle) * 2.23694 -- Convert m/s to MPH
                    if speed > Config.SpeedThreshold then
                        applyHydroplaning(vehicle)
                    end
                end
            end
        end
    end
end)

-- Utility function to get all vehicles in the world
function GetAllVehicles()
    local vehicles = {}
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    for vehicle in EnumerateVehicles() do
        table.insert(vehicles, vehicle)
    end
    return vehicles
end

-- Enumerator for vehicles
function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, veh = FindFirstVehicle()
        if not veh then return end
        repeat
            coroutine.yield(veh)
            local success, nextVeh = FindNextVehicle(handle)
            veh = nextVeh
        until not success
        EndFindVehicle(handle)
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
