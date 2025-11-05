--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]

-- __  __             
-- |  \/  |            
-- | \  / | __ _ _ __  
-- | |\/| |/ _` | '_ \ 
-- | |  | | (_| | |_) |
-- |_|  |_|\__,_| .__/ 
--              | |    
--              |_|    

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)


-- Variable to keep track of minimap visibility state
local isMinimapVisible = false

-- Function to hide the minimap, health, and armor UI
function hideUI()
    DisplayRadar(false)  -- Hide the radar
    SetRadarBigmapEnabled(false, false)  -- Disable the bigmap
    SetRadarZoom(0.0)  -- Zoom out the radar to ensure it's not visible
end

-- Function to show the minimap and HUD elements
function showUI()
    DisplayRadar(true)  -- Show the radar
    SetRadarBigmapEnabled(true, false)  -- Enable the bigmap if necessary
    SetRadarZoom(1.0)  -- Reset radar zoom to normal
    -- Show health and armor UI (these will be shown by default if not hidden)
    -- No additional code is needed to re-enable these since not hiding them will automatically show them
end

-- Function to toggle the minimap and UI
function toggleMinimap()
    if isMinimapVisible then
        hideUI()
    else
        showUI()
    end
    -- Toggle the visibility state
    isMinimapVisible = not isMinimapVisible
end

Citizen.CreateThread(function()
    -- Initially hide the minimap and UI
    hideUI()

    while true do
        Citizen.Wait(0)

        -- Enforce the minimap and UI state
        if not isMinimapVisible then
            hideUI()
        end
    end
end)

-- Function to handle vehicle exit
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Check every second to avoid unnecessary checks
        
        local playerPed = PlayerPedId()
        
        -- Check if the player is in a vehicle
        if  not IsPedInAnyVehicle(playerPed, false) then
            isMinimapVisible = false
        end
    end
end)

-- Event handler for toggling the minimap and UI
RegisterNetEvent('kurlie_untility:map')
AddEventHandler('kurlie_untility:map', function()
    -- Call the toggleMinimap function to switch visibility
    toggleMinimap()
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
