--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Admin commands system for Luxu Admin Panel
local commandsConfig = Config.commands
-- Find safe ground Z coordinate for teleportation
local function findGroundZ(ped, x, y)
    local maxHeight = 950.0
    local minHeight = 0
    local heightStep = -25.0
    
    -- Try different heights to find ground
    for currentHeight = maxHeight, minHeight, heightStep do
        local testHeight = currentHeight
        
        -- Alternate between positive and negative heights
        if currentHeight % 2 ~= 0 then
            testHeight = maxHeight - currentHeight
        end
        
        -- Start loading scene at test coordinates
        NewLoadSceneStart(x, y, testHeight, x, y, testHeight, 50.0, 0)
        
        local startTime = GetGameTimer()
        
        -- Wait for scene to load (max 1 second)
        while IsNetworkLoadingScene() do
            local currentTime = GetGameTimer()
            if currentTime - startTime > 1000 then
                break
            end
            Wait(0)
        end
        
        NewLoadSceneStop()
        
        -- Set ped to test position
        SetPedCoordsKeepVehicle(ped, x, y, testHeight)
        
        -- Wait for collision to load around entity
        while not HasCollisionLoadedAroundEntity(ped) do
            RequestCollisionAtCoord(x, y, testHeight)
            local currentTime = GetGameTimer()
            if currentTime - startTime > 1000 then
                break
            end
            Wait(0)
        end
        
        -- Try to find ground Z coordinate
        local foundGround, groundZ = GetGroundZFor_3dCoord(x, y, testHeight, false)
        
        if foundGround then
            Wait(0)
            return vector3(x, y, groundZ)
        end
        
        Wait(0)
    end
    
    return nil
end
-- Teleport to waypoint marker function
local function teleportToWaypoint()
    -- Get waypoint blip
    local waypointBlip = GetFirstBlipInfoId(8)
    
    -- Check if waypoint exists
    if not DoesBlipExist(waypointBlip) then
        Luxu.notify(Locales.no_waypoint_set, Locales.error, 2000)
        return "marker"
    end
    
    -- Fade out screen
    DoScreenFadeOut(650)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    
    local playerPed = PlayerPedId()
    local waypointCoords = GetBlipInfoIdCoord(waypointBlip)
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)
    local originalCoords = GetEntityCoords(playerPed)
    
    local targetX = waypointCoords.x
    local targetY = waypointCoords.y
    local groundZ = 850.0
    local maxHeight = 950.0
    local foundGround = false
    
    -- Freeze entity during teleport
    if playerVehicle > 0 then
        FreezeEntityPosition(playerVehicle, true)
    else
        FreezeEntityPosition(playerPed, true)
    end
    
    -- Try to find ground at waypoint location
    for testHeight = maxHeight, 0, -25.0 do
        local currentHeight = testHeight
        
        -- Alternate between positive and negative heights
        if testHeight % 2 ~= 0 then
            currentHeight = maxHeight - testHeight
        end
        
        -- Load scene at test coordinates
        NewLoadSceneStart(targetX, targetY, currentHeight, targetX, targetY, currentHeight, 50.0, 0)
        
        local startTime = GetGameTimer()
        
        -- Wait for scene loading
        while IsNetworkLoadingScene() do
            local currentTime = GetGameTimer()
            if currentTime - startTime > 1000 then
                break
            end
            Wait(0)
        end
        
        NewLoadSceneStop()
        
        -- Move player to test position
        SetPedCoordsKeepVehicle(playerPed, targetX, targetY, currentHeight)
        
        -- Wait for collision loading
        while not HasCollisionLoadedAroundEntity(playerPed) do
            RequestCollisionAtCoord(targetX, targetY, currentHeight)
            local currentTime = GetGameTimer()
            if currentTime - startTime > 1000 then
                break
            end
            Wait(0)
        end
        
        -- Try to find ground Z coordinate
        local hasGround, foundZ = GetGroundZFor_3dCoord(targetX, targetY, currentHeight, false)
        groundZ = foundZ
        foundGround = hasGround
        
        if foundGround then
            Wait(0)
            SetPedCoordsKeepVehicle(playerPed, targetX, targetY, groundZ)
            break
        end
        
        Wait(0)
    end
    
    -- Fade screen back in
    DoScreenFadeIn(650)
    
    -- Unfreeze entity
    if playerVehicle > 0 then
        FreezeEntityPosition(playerVehicle, false)
    else
        FreezeEntityPosition(playerPed, false)
    end
    
    -- If no ground found, move back to original position slightly lower
    if not foundGround then
        SetPedCoordsKeepVehicle(playerPed, originalCoords.x, originalCoords.y, originalCoords.z - 1.0)
    end
    
    -- Final position set
    SetPedCoordsKeepVehicle(playerPed, targetX, targetY, groundZ)
end
-- Network event for teleport to marker command
Luxu.registerNetEvent("commands:tpm", function()
    -- Ensure command is from client only
    if source ~= 65535 then
        return
    end
    
    local waypointBlip = GetFirstBlipInfoId(8)
    
    if DoesBlipExist(waypointBlip) then
        local playerPed = Luxu.cache.ped
        local waypointCoords = GetBlipInfoIdCoord(waypointBlip)
        
        -- Freeze player during teleport
        FreezeEntityPosition(Luxu.cache.ped, true)
        
        -- Request collision at waypoint
        RequestAdditionalCollisionAtCoord(waypointCoords.x, waypointCoords.y, waypointCoords.z)
        
        -- Fade out screen
        DoScreenFadeOut(300)
        Wait(300)
        
        -- Find safe ground coordinates
        local safeCoords = findGroundZ(playerPed, waypointCoords.x, waypointCoords.y)
        
        if not safeCoords then
            -- If no safe coords found, fade back in and unfreeze
            DoScreenFadeIn(300)
            FreezeEntityPosition(Luxu.cache.ped, false)
            Luxu.print.error("Locales.error_finding_z_coord")
            return
        end
        
        -- Teleport player to safe coordinates
        SetPedCoordsKeepVehicle(playerPed, safeCoords.x, safeCoords.y, safeCoords.z)
        
        -- Unfreeze player and fade screen back in
        FreezeEntityPosition(Luxu.cache.ped, false)
        DoScreenFadeIn(300)
    else
        -- No waypoint found notification
        Luxu.notify(Locales.error, Locales.no_waypoint_found, 3000, "error")
    end
end)
-- Network event for opening reports
Luxu.registerNetEvent("commands:report", function()
    FetchNui("openReports")
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(false)
end)
-- Network event for checking staff online
Luxu.registerNetEventStrict("commands:staff", function(staffData)
    FetchNui("checkStaffOnline", staffData)
end)
-- Keybind system for admin commands
Keybinds = {}

-- Admin panel keybind
Keybinds.panel = Luxu.addKeybind({
    name = "luxu_admin:panel",
    description = "Open Admin Menu",
    onPressed = function()
        if not HasPermission("self.panel", false, false) then
            return
        end
        OpenPanel()
    end
})
-- Quick menu keybind
Keybinds.quickMenu = Luxu.addKeybind({
    name = "luxu_admin:quickmenu",
    description = "Open Quick Menu",
    onPressed = function()
        if not HasPermission("self.quickmenu", false, true) then
            return
        end
        OpenMenu()
    end
})
-- Player report keybind (conditional based on config)
if commandsConfig.player_report.enabled then
    if commandsConfig.player_report.keybind then
        Keybinds.reportMenu = Luxu.addKeybind({
            name = "luxu_admin:report",
            description = "Open Report Menu",
            defaultKey = commandsConfig.player_report.defaultKey or nil,
            onPressed = function()
                FetchNui("openReports")
                SetNuiFocus(true, true)
                SetNuiFocusKeepInput(false)
            end
        })
    end
end
-- Noclip toggle keybind
Keybinds.noclip = Luxu.addKeybind({
    name = "luxu_admin:toggleNoclip",
    description = "Toggle Noclip",
    onPressed = function()
        if not HasPermission("self.noclip", false, true) then
            return
        end
        local isShiftPressed = IsDisabledControlPressed(0, 36)
        ToggleNoclip(nil, isShiftPressed)
    end
})
-- Teleport back keybind
Keybinds.back = Luxu.addKeybind({
    name = "luxu_admin:teleportBack",
    description = "Teleport to last position",
    onPressed = function()
        if not HasPermission("self.teleport") then
            return
        end
        ExecuteCommand("back")
    end
})
-- Teleport to coordinates keybind
Keybinds.tp = Luxu.addKeybind({
    name = "luxu_admin:teleportCoords",
    description = "Teleport to coordinates",
    onPressed = function()
        if not HasPermission("self.teleport", false, true) then
            return
        end
        SetNuiFocus(true, true)
        FetchNui("showTeleportCoordsDialog")
    end
})
-- Teleport to waypoint keybind
Keybinds.tpm = Luxu.addKeybind({
    name = "luxu_admin:teleportWaypoint",
    description = "Teleport to map marker",
    onPressed = function()
        if not HasPermission("self.teleport", false, true) then
            return
        end
        teleportToWaypoint()
    end
})
-- Toggle player names keybind
Keybinds.toggleNames = Luxu.addKeybind({
    name = "luxu_admin:toggleNames",
    description = "Toggle Player Names",
    onPressed = function()
        if not HasPermission("self.player_ids", false, true) then
            return
        end
        TogglePlayerNames()
    end
})
-- Resource stop handler to ensure screen is not faded out
onResourceStop(function()
    if IsScreenFadedOut() then
        DoScreenFadeIn(0)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
