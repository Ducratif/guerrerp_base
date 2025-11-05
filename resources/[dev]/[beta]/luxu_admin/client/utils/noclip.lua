--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Noclip system for Luxu Admin
-- Manages noclip movement, controls, and state management

-- Native function references for performance
local disableControlAction = DisableControlAction
local isDisabledControlPressed = IsDisabledControlPressed
local getGameplayCamRot = GetGameplayCamRot
local getOffsetFromEntityInWorldCoords = GetOffsetFromEntityInWorldCoords
local setEntityHeading = SetEntityHeading
local setEntityCoordsNoOffset = SetEntityCoordsNoOffset

-- Noclip state variables
local isNoclipActive = false
local isExitingNoclip = false
local noclipSpeed = 1.0

-- Controls to disable during noclip
local disabledControls = {
  30,  -- Move Left/Right
  31,  -- Move Forward/Back
  36,  -- Duck/Sneak
  21,  -- Sprint
  22,  -- Jump
  44,  -- Cover
  37,  -- Select Weapon
  23,  -- Enter Vehicle
  288, -- Phone
  289, -- Phone Cancel
  170, -- Melee Attack Light
  167, -- Enter/Exit Vehicle
  168, -- Context Menu
  169, -- Context Menu Cancel
  27   -- Phone Up
}
-- Disable controls during noclip
local function disableNoclipControls()
  HudWeaponWheelIgnoreSelection()
  
  for i = 1, #disabledControls do
    disableControlAction(0, disabledControls[i], true)
  end
end
-- Update entity heading based on camera rotation
local function updateEntityHeading(entity)
  local camRotation = getGameplayCamRot(2)
  local heading = math.max(0, camRotation.z % 360)
  setEntityHeading(entity, heading)
  return heading
end
-- Handle noclip movement based on input controls
local function handleNoclipMovement(entity)
  -- Determine movement speed multiplier
  local speedMultiplier = 1.0
  if isDisabledControlPressed(0, 21) then -- Sprint
    speedMultiplier = 5.0
  elseif isDisabledControlPressed(0, 36) then -- Sneak
    speedMultiplier = 0.5
  end
  
  local newPosition = nil
  
  -- Forward movement (W key)
  if IsControlPressed(0, 32) then
    local camRotation = getGameplayCamRot(0)
    if camRotation.x >= 0 then
      newPosition = getOffsetFromEntityInWorldCoords(
        entity,
        0.0,
        noclipSpeed * speedMultiplier * 0.5,
        camRotation.x * (noclipSpeed / 2) * speedMultiplier / 89
      )
    else
      newPosition = getOffsetFromEntityInWorldCoords(
        entity,
        0.0,
        noclipSpeed * speedMultiplier * 0.5,
        -1 * math.abs(camRotation.x) * (noclipSpeed / 2) * speedMultiplier / 89
      )
    end
  end
  
  -- Backward movement (S key)
  if IsControlPressed(0, 33) then
    local camRotation = getGameplayCamRot(2)
    if camRotation.x >= 0 then
      newPosition = getOffsetFromEntityInWorldCoords(
        entity,
        0.0,
        noclipSpeed * speedMultiplier * -0.5,
        -1 * camRotation.x * (noclipSpeed / 2) * speedMultiplier / 89
      )
    else
      newPosition = getOffsetFromEntityInWorldCoords(
        entity,
        0.0,
        noclipSpeed * speedMultiplier * -0.5,
        math.abs(camRotation.x) * (noclipSpeed / 2) * speedMultiplier / 89
      )
    end
  end
  
  -- Left movement (A key)
  if IsControlPressed(0, 34) then
    newPosition = getOffsetFromEntityInWorldCoords(
      entity,
      noclipSpeed * speedMultiplier * -0.5,
      0.0,
      0.0
    )
  end
  
  -- Right movement (D key)
  if IsControlPressed(0, 35) then
    newPosition = getOffsetFromEntityInWorldCoords(
      entity,
      noclipSpeed * speedMultiplier * 0.5,
      0.0,
      0.0
    )
  end
  
  -- Up movement (Q key)
  if IsControlPressed(0, 51) then
    newPosition = getOffsetFromEntityInWorldCoords(
      entity,
      0.0,
      0.0,
      noclipSpeed * speedMultiplier * -0.5
    )
  end
  
  -- Down movement (Z key)
  if IsControlPressed(0, 52) then
    newPosition = getOffsetFromEntityInWorldCoords(
      entity,
      0.0,
      0.0,
      noclipSpeed * speedMultiplier * 0.5
    )
  end
  
  -- Apply new position if movement occurred
  if newPosition then
    setEntityCoordsNoOffset(entity, newPosition.x, newPosition.y, newPosition.z, true, true, false)
  end
end
-- Initialize noclip mode settings
local function initializeNoclip()
  local entity = Luxu.cache.vehicle or Luxu.cache.ped
  
  -- Disable vehicle radio and horn if in vehicle
  if Luxu.cache.vehicle then
    SetUserRadioControlEnabled(false)
    SetHornEnabled(Luxu.cache.vehicle, false)
  end
  
  -- Set entity properties for noclip
  SetEntityInvincible(entity, true)
  SetEntityCollision(entity, false, false)
  SetEntityAlpha(entity, 127, false)
  
  -- Make player ignored by NPCs and police
  local playerId = PlayerId()
  SetEveryoneIgnorePlayer(playerId, true)
  SetPoliceIgnorePlayer(playerId, true)
  
  -- Disable ped physics
  SetPedCanRagdoll(entity, false)
  ClearPedTasksImmediately(entity)
  FreezeEntityPosition(entity, true)
  
  Wait(100)
  
  -- Clear tasks and force motion state
  ClearPedTasksImmediately(entity)
  ForcePedMotionState(PlayerPedId(), -294553821, true, 0, true)
end
-- Cleanup and restore normal state when exiting noclip
local function cleanupNoclip()
  local ped = Luxu.cache.ped
  
  -- Restore invincibility only if godmode is not active
  if not LocalPlayer.state["luxu_admin:player:godmode"] then
    SetEntityInvincible(ped, false)
  end
  
  -- Restore visibility only if invisibility is not active
  if not LocalPlayer.state["luxu_admin:player:invisible"] then
    SetEntityVisible(ped, true, false)
    SetEntityAlpha(ped, 255, false)
  end
  
  -- Restore vehicle properties if in vehicle
  if Luxu.cache.vehicle then
    local vehicle = Luxu.cache.vehicle
    SetEntityVisible(vehicle, true, false)
    SetEntityInvincible(vehicle, false)
    ResetEntityAlpha(vehicle)
    NetworkSetEntityInvisibleToNetwork(ped, true)
    SetEntityCollision(vehicle, true, true)
    SetVehicleCanBreak(vehicle, true)
    SetVehicleWheelsCanBreak(vehicle, true)
    SetUserRadioControlEnabled(true)
    SetHornEnabled(vehicle, true)
    FreezeEntityPosition(vehicle, false)
  else
    ClearPedTasksImmediately(ped)
  end
  
  -- Restore player interactions
  SetEntityCollision(ped, true, true)
  local playerId = PlayerId()
  SetEveryoneIgnorePlayer(playerId, false)
  SetPoliceIgnorePlayer(playerId, false)
  SetPedCanRagdoll(ped, true)
  FreezeEntityPosition(ped, false)
  
  -- Reset noclip speed
  noclipSpeed = 1.0
  
  -- Place player on ground if not exiting noclip
  if not isExitingNoclip then
    return
  end
  
  local coords = GetEntityCoords(ped)
  local found, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)
  if found then
    local entity = Luxu.cache.vehicle or ped
    setEntityCoordsNoOffset(entity, coords.x, coords.y, groundZ + 1.0, true, true, true)
  end
end
-- Apply invisibility effects during noclip
local function applyInvisibilityEffects()
  local entity = Luxu.cache.vehicle or Luxu.cache.ped
  
  SetEntityAlpha(entity, 127.5, false)
  SetEntityVisible(entity, false, false)
  SetLocalPlayerVisibleLocally(true)
  SetEveryoneIgnorePlayer(Luxu.cache.playerId, true)
  SetPoliceIgnorePlayer(Luxu.cache.playerId, true)
end
-- Start noclip threads and initialize
local function startNoclipThreads()
  isExitingNoclip = false
  initializeNoclip()
  
  -- Thread 1: Disable controls
  CreateThread(function()
    while isNoclipActive do
      disableNoclipControls()
      Wait(0)
    end
  end)
  
  -- Thread 2: Handle movement and heading
  CreateThread(function()
    while isNoclipActive do
      local entity = Luxu.cache.vehicle or Luxu.cache.ped
      updateEntityHeading(entity)
      handleNoclipMovement(entity)
      Wait(0)
    end
    cleanupNoclip()
  end)
  
  -- Thread 3: Handle speed controls and UI toggles
  CreateThread(function()
    while isNoclipActive do
      -- Increase speed (Mouse Wheel Up)
      if IsControlJustPressed(0, 15) then
        noclipSpeed = noclipSpeed + 0.5
      -- Decrease speed (Mouse Wheel Down)
      elseif IsControlJustPressed(0, 14) then
        noclipSpeed = noclipSpeed - 0.5
      -- Reset speed (ESC or F1)
      elseif IsControlJustPressed(0, 27) or IsControlJustPressed(0, 348) then
        noclipSpeed = 1.0
      -- Toggle noclip controls UI (TAB or F3)
      elseif IsDisabledControlJustPressed(0, 37) or IsControlJustPressed(0, 192) then
        FetchNui("toggleNoclipControls")
      end
      
      Wait(0)
    end
  end)
  
  -- Thread 4: Apply invisibility effects
  CreateThread(function()
    while isNoclipActive do
      applyInvisibilityEffects()
      Wait(0)
    end
  end)
end
-- Toggle noclip mode on/off
function ToggleNoclip(enable, isExiting)
  -- Auto-toggle if no boolean provided
  if type(enable) ~= "boolean" then
    enable = not isNoclipActive
  end
  
  if enable then
    -- Enable noclip if not already active
    if not isNoclipActive then
      isNoclipActive = true
      
      -- Set player state for network sync
      LocalPlayer.state:set("luxu_admin_player_noclip", true, true)
      
      -- Send NUI update with keybind info
      FetchNui("toggleNoclipControls", {
        value = true,
        toggleKey = Keybinds.noclip:getCurrentKeyLabel()
      })
      
      -- Start noclip threads
      startNoclipThreads()
    end
  elseif not enable then
    -- Disable noclip if currently active
    if isNoclipActive then
      isExitingNoclip = isExiting or false
      isNoclipActive = false
      
      -- Clear player state
      LocalPlayer.state:set("luxu_admin_player_noclip", false, true)
      
      -- Send NUI update
      FetchNui("toggleNoclipControls", {
        value = false
      })
    end
  end
end
-- Get current noclip state
function GetNoclipState()
  return isNoclipActive
end

-- Cleanup on resource stop
onResourceStop(function()
  if isNoclipActive then
    cleanupNoclip()
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
