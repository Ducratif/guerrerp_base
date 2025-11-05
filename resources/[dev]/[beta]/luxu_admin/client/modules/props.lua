--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Props system variables and configuration
local vector3 = vector3
local propsData = {}
local isPlacingProp = false
local currentProp = {
  model = "",
  type = "",
  entity = 0
}
local lastRaycastHit = vector3(0.0, 0.0, 0.0)
local propRotation = {
  x = 0.0,
  y = 0.0,
  z = 0.0
}
local currentRotationAxis = 3 -- 1=X, 2=Y, 3=Z
local propKeybinds = {}
-- Keybind for placing props
propKeybinds.Place = Luxu.addKeybind({
  name = "luxu_admin:prop:place",
  description = "Place a prop",
  disabled = true,
  defaultKey = "RETURN",
  onPressed = function()
    FinishPropPlacement()
  end
})
-- Keybind for removing/canceling prop placement
propKeybinds.Remove = Luxu.addKeybind({
  name = "luxu_admin:prop:remove",
  description = "Remove a prop",
  disabled = true,
  defaultKey = "BACK",
  onPressed = function()
    CancelPropPlacement()
  end
})
-- Keybind for rotating props with mouse wheel
propKeybinds.RotateProp = Luxu.addKeybind({
  name = "luxu_admin:prop:rotate",
  description = "Rotate the prop around the X axis",
  disabled = true,
  defaultMapper = "MOUSE_WHEEL",
  defaultKey = "IOM_WHEEL_UP",
  secondaryKey = "IOM_WHEEL_DOWN",
  onPressed = function()
    local wheelUp = IsControlJustPressed(0, 15)
    local wheelDown = IsControlJustPressed(0, 14)
    local rotationStep = 5.0
    local rotX = propRotation.x
    local rotY = propRotation.y
    local rotZ = propRotation.z
    
    -- Apply rotation based on current axis
    if currentRotationAxis == 1 then -- X axis
      if wheelUp then
        rotX = rotX + rotationStep
      elseif wheelDown then
        rotX = rotX - rotationStep
      end
    elseif currentRotationAxis == 2 then -- Y axis
      if wheelUp then
        rotY = rotY + rotationStep
      elseif wheelDown then
        rotY = rotY - rotationStep
      end
    elseif currentRotationAxis == 3 then -- Z axis
      if wheelUp then
        rotZ = rotZ + rotationStep
      elseif wheelDown then
        rotZ = rotZ - rotationStep
      end
    end
    
    -- Apply rotation to entity
    SetEntityRotation(currentProp.entity, rotX, rotY, rotZ, 2, false)
    propRotation.x = rotX
    propRotation.y = rotY
    propRotation.z = rotZ
  end
})
-- Keybind for toggling rotation axis (X/Y/Z)
propKeybinds.ToggleRotationAxis = Luxu.addKeybind({
  name = "luxu_admin:prop:toggle_rotation_axis",
  description = "Toggle the rotation axis",
  disabled = true,
  defaultKey = "LMENU",
  onPressed = function()
    currentRotationAxis = currentRotationAxis + 1
    if currentRotationAxis > 3 then
      currentRotationAxis = 1
    end
    FetchNui("updateRotationAxis", currentRotationAxis)
  end
})
-- Enable all prop keybinds
local function enablePropKeybinds()
  for _, keybind in pairs(propKeybinds) do
    keybind:disable(false)
  end
end
-- Disable all prop keybinds
local function disablePropKeybinds()
  for _, keybind in pairs(propKeybinds) do
    keybind:disable(true)
  end
end
-- Delete entity based on its type
local function deleteEntitySafely(entity)
  if DoesEntityExist(entity) then
    if IsEntityAPed(entity) then
      DeletePed(entity)
    elseif IsEntityAVehicle(entity) then
      DeleteVehicle(entity)
    else
      DeleteEntity(entity)
    end
  end
  entity = 0
end
-- Toggle entity placer controls in NUI
local function toggleEntityPlacerControls(enabled)
  FetchNui("toggleEntityPlacerControls", enabled)
end
-- Round number to specified decimal places
local function roundToDecimal(number, decimals)
  local multiplier = 10 ^ decimals
  return math.floor(number * multiplier) / multiplier
end
-- Finish prop placement and send to server
function FinishPropPlacement()
  local entityCoords = GetEntityCoords(currentProp.entity)
  local propData = {
    name = currentProp.name,
    model = currentProp.model,
    type = currentProp.type,
    coords = {
      x = roundToDecimal(entityCoords.x, 2),
      y = roundToDecimal(entityCoords.y, 2),
      z = roundToDecimal(entityCoords.z, 2)
    },
    rotation = propRotation
  }
  
  -- Send prop creation to server
  Luxu.triggerServerEvent("props:create", propData)
  
  -- Clean up placement state
  isPlacingProp = false
  toggleEntityPlacerControls(false)
  deleteEntitySafely(currentProp.entity)
  disablePropKeybinds()
end
-- Cancel prop placement without saving
function CancelPropPlacement()
  isPlacingProp = false
  toggleEntityPlacerControls(false)
  deleteEntitySafely(currentProp.entity)
  disablePropKeybinds()
end
-- Validate model and type compatibility
local function isValidModelForType(model, entityType)
  if not IsModelValid(model) then
    if not IsModelInCdimage(model) then
      return false
    end
  end
  
  if entityType == "ped" then
    return IsModelAPed(model)
  elseif entityType == "vehicle" then
    return IsModelAVehicle(model)
  elseif entityType == "object" then
    return not IsModelAVehicle(model) and not IsModelAPed(model)
  end
  
  return false
end
-- Request and wait for model to load
local function requestAndWaitForModel(model)
  local modelHash = 0
  
  if type(model) == "number" then
    modelHash = model
  else
    modelHash = joaat(model)
  end
  
  while not HasModelLoaded(modelHash) do
    RequestModel(modelHash)
    Wait(0)
  end
  
  return modelHash
end
-- Create prop entity from server data
local function createPropEntity(propData)
  if not isValidModelForType(propData.model, propData.type) then
    return
  end
  
  local modelHash = requestAndWaitForModel(propData.model)
  local entity = 0
  
  -- Create entity based on type
  if propData.type == "object" then
    entity = CreateObjectNoOffset(modelHash, propData.coords.x, propData.coords.y, propData.coords.z, false, true, false)
  elseif propData.type == "ped" then
    entity = CreatePed(1, modelHash, propData.coords.x, propData.coords.y, propData.coords.z, 0.0, false, true)
  elseif propData.type == "vehicle" then
    entity = CreateVehicle(modelHash, propData.coords.x, propData.coords.y, propData.coords.z, 0.0, false, true)
    SetVehicleDoorsLocked(entity, 10)
    
    -- Set custom plate if provided
    if propData.plate then
      SetVehicleNumberPlateText(entity, propData.plate)
    end
  end
  
  -- Clean up model
  SetModelAsNoLongerNeeded(modelHash)
  
  -- Configure entity in separate thread
  CreateThread(function()
    -- Wait for entity to exist
    while not DoesEntityExist(entity) do
      Wait(0)
    end
    
    -- Configure entity properties
    FreezeEntityPosition(entity, true)
    SetEntityHeading(entity, propData.rotation.z)
    SetEntityInvincible(entity, true)
    SetEntityRotation(entity, propData.rotation.x, propData.rotation.y, propData.rotation.z, 2, false)
    
    -- Store prop data
    propsData[propData.id] = {
      id = propData.id,
      model = propData.model,
      entity = entity,
      type = propData.type,
      coords = propData.coords,
      rotation = propData.rotation,
      plate = propData.plate
    }
    
    -- Notify NUI of prop creation
    FetchNui("props:created", propsData[propData.id])
  end)
end
-- Update prop position based on camera raycast
local function updatePropPosition()
  if not DoesEntityExist(currentProp.entity) then
    return
  end
  
  -- Perform raycast from camera
  local hit, _, hitCoords, _, _ = Luxu.raycast.fromCamera(nil, nil, 5.0)
  if not hit then
    return
  end
  
  -- Only update if position changed
  if hitCoords == lastRaycastHit then
    return
  end
  
  lastRaycastHit = hitCoords
  
  -- Update entity position and rotation
  SetEntityCoords(currentProp.entity, hitCoords.x, hitCoords.y, hitCoords.z, true, false, false, true)
  SetEntityRotation(currentProp.entity, propRotation.x, propRotation.y, propRotation.z, 2, false)
end
-- NUI Callback: Start prop placement mode
RegisterNuiCallback("props:create", function(data, callback)
  -- Check if already placing a prop
  if isPlacingProp then
    return callback(false)
  end
  
  -- Validate model and type
  if not isValidModelForType(data.model, data.type) then
    Luxu.notify(Locales.error, Locales.invalid_model, 4000, "error")
    return callback(false)
  end
  
  callback(true)
  
  -- Hide admin panel and set camera mode
  Visibility.hidePanel()
  SetFollowPedCamViewMode(4)
  
  -- Double-check model validity
  if not isValidModelForType(data.model, data.type) then
    Luxu.notify(Locales.error, Locales.invalid_model, 4000, "error")
    return
  end
  
  -- Get player position and forward vector
  local playerPed = GetPlayerPed(source)
  local playerCoords = GetEntityCoords(playerPed)
  local forwardVector = GetEntityForwardVector(playerPed)
  local spawnCoords = playerCoords + (forwardVector * 2.0)
  
  -- Request and load model
  local modelHash = requestAndWaitForModel(data.model)
  local entity = 0
  
  -- Create preview entity based on type
  if data.type == "object" or data.type == "vehicle" then
    entity = CreateObject(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, false, true, false)
  elseif data.type == "ped" then
    entity = CreatePed(1, modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, false, true)
  end
  
  -- Clean up model
  SetModelAsNoLongerNeeded(modelHash)
  
  -- Configure preview entity
  FreezeEntityPosition(entity, true)
  SetEntityCollision(entity, false, false)
  SetEntityRotation(entity, 0.0, 0.0, 0.0, 2, false)
  SetEntityAlpha(entity, 200, false)
  
  -- Store current prop data
  currentProp.entity = entity
  currentProp.name = data.name
  currentProp.model = data.model
  currentProp.type = data.type
  currentProp.rotation = { x = 0.0, y = 0.0, z = 0.0 }
  
  -- Enter placement mode
  isPlacingProp = true
  
  -- Start placement loop
  CreateThread(function()
    enablePropKeybinds()
    toggleEntityPlacerControls(true)
    
    -- Update prop position while placing
    while isPlacingProp do
      Wait(0)
      updatePropPosition()
    end
    
    disablePropKeybinds()
  end)
end)
-- NUI Callback: Add prop directly (without placement mode)
RegisterNuiCallback("props:add", function(data, callback)
  -- Validate model and type
  if not isValidModelForType(data.model, data.type) then
    Luxu.notify(Locales.error, Locales.invalid_model, 4000, "error")
    return callback(false)
  end
  
  -- Send prop creation request to server
  Luxu.triggerServerEvent("props:create", data)
  callback(true)
end)
-- Register server NUI callbacks for props management
Luxu.registerNuiServerCallback("props:get")
Luxu.registerNuiServerCallback("props:update")
Luxu.registerNuiServerCallback("props:delete")
-- Server event: Handle prop deletion
Luxu.registerNetEvent("props:deleted", function(propId)
  local propData = propsData[propId]
  if not propData then
    return
  end
  
  -- Delete the entity
  deleteEntitySafely(propData.entity)
  
  -- Remove from local storage
  propsData[propId] = nil
  
  -- Notify NUI
  FetchNui("props:deleted", propId)
end)
-- Server event: Handle prop creation
Luxu.registerNetEvent("props:created", function(propData)
  createPropEntity(propData)
end)
-- Server event: Handle prop updates
Luxu.registerNetEvent("props:updated", function(propData)
  local existingProp = propsData[propData.id]
  
  if not existingProp then
    -- Create new prop if it doesn't exist
    createPropEntity(propData)
    return
  end
  
  -- Delete old entity and create new one
  deleteEntitySafely(existingProp.entity)
  propsData[propData.id] = nil
  createPropEntity(propData)
end)
-- Resource start handler: Load existing props from server
AddEventHandler("onClientResourceStart", function(resourceName)
  if resourceName ~= GetCurrentResourceName() then
    return
  end
  
  -- Wait for player to be active
  while not NetworkIsPlayerActive(PlayerId()) do
    Wait(300)
  end
  
  -- Additional wait for initialization
  Wait(1000)
  
  -- Get existing props from server
  local existingProps = Luxu.callbackSync("props:get", false)
  if existingProps then
    for _, propData in pairs(existingProps) do
      propsData[propData.id] = {
        id = propData.id,
        model = propData.model,
        entity = 0,
        type = propData.type,
        coords = propData.coords,
        rotation = propData.rotation,
        plate = propData.plate
      }
    end
  end
end)
-- Props streaming thread: Create/destroy props based on player distance
CreateThread(function()
  while true do
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    -- Check all props for streaming
    for _, propData in pairs(propsData) do
      local propCoords = vector3(propData.coords.x, propData.coords.y, propData.coords.z)
      local distance = #(playerCoords - propCoords)
      
      -- Stream in props within 30 units
      if distance < 30.0 then
        if propData.entity == 0 or not DoesEntityExist(propData.entity) then
          createPropEntity(propData)
        end
      end
    end
    
    Wait(1000)
  end
end)
-- Resource stop handler: Clean up all entities
onResourceStop(function()
  -- Clean up current placement prop if exists
  if DoesEntityExist(currentProp.entity) then
    deleteEntitySafely(currentProp.entity)
  end
  
  -- Clean up all spawned props
  for _, propData in pairs(propsData) do
    if DoesEntityExist(propData.entity) then
      deleteEntitySafely(propData.entity)
    end
  end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
