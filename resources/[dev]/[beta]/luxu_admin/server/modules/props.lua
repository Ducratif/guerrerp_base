--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Props management module
-- Handles server-side operations for admin props system

-- Get all props from database callback
local function getPropsFromDatabase()
  -- Execute database query to get all props
  local dbResult = MySQL.rawExecute.await("SELECT * FROM luxu_admin_props")
  local propsList = {}
  
  -- Return empty table if no results
  if not dbResult then
    return {}
  end
  
  -- Process each prop from database
  for _, propData in ipairs(dbResult) do
    local propIndex = #propsList + 1
    local propObject = {}
    
    -- Set coordinates
    local coordinates = {}
    coordinates.x = propData.x
    coordinates.y = propData.y
    coordinates.z = propData.z
    propObject.coords = coordinates
    
    -- Set rotation
    local rotation = {}
    rotation.x = propData.rx
    rotation.y = propData.ry
    rotation.z = propData.rz
    propObject.rotation = rotation
    
    -- Set basic properties
    propObject.type = propData.type
    propObject.plate = propData.plate
    
    -- Decode metadata JSON
    local metadataString = propData.metadata
    if not metadataString then
      metadataString = "{}"
    end
    propObject.metadata = json.decode(metadataString)
    
    -- Set remaining properties
    propObject.model = propData.model
    propObject.id = propData.id
    propObject.name = propData.name
    
    propsList[propIndex] = propObject
  end
  
  isCached = true
  return propsList
end

-- Register server callback for getting props
Luxu.registerServerCallback("props:get", getPropsFromDatabase)
-- Create prop event handler
local function handlePropCreation(propData)
  local playerId = source
  
  -- Check prop creation permission
  if not HasPermission(playerId, "props.create", true, true) then
    return
  end
  
  -- Ensure metadata exists
  if not propData.metadata then
    propData.metadata = {}
  end
  
  -- Insert prop into database
  local insertResult = MySQL.insert.await(
    "INSERT INTO luxu_admin_props (x, y, z,  rx, ry, rz, type, plate, metadata, model, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    {
      propData.coords.x,
      propData.coords.y,
      propData.coords.z,
      propData.rotation.x,
      propData.rotation.y,
      propData.rotation.z,
      propData.type,
      propData.plate or "",
      json.encode(propData.metadata),
      propData.model,
      propData.name
    }
  )
  
  -- If insertion successful, notify all clients
  if insertResult then
    propData.id = insertResult
    Luxu.triggerClientEvent("props:created", -1, propData)
  end
end

-- Register net event for prop creation
Luxu.registerNetEvent("props:create", handlePropCreation)
-- Delete prop callback handler
local function handlePropDeletion(playerId, propId)
  -- Check prop creation permission (same permission for delete)
  if not HasPermission(playerId, "props.create", true, true) then
    return
  end
  
  -- Delete prop from database
  MySQL.update.await(
    "DELETE FROM luxu_admin_props WHERE id = ?",
    { propId }
  )
  
  -- Notify all clients of prop deletion
  Luxu.triggerClientEvent("props:deleted", -1, propId)
end

-- Register server callback for prop deletion
Luxu.registerServerCallback("props:delete", handlePropDeletion)
-- Update prop callback handler
local function handlePropUpdate(playerId, propData)
  -- Check prop creation permission (same permission for update)
  if not HasPermission(playerId, "props.create", true, true) then
    return
  end
  
  -- Update prop in database
  local updateResult = MySQL.update.await(
    "UPDATE luxu_admin_props SET x = ?, y = ?, z = ?, rx = ?, ry = ?, rz = ?, type = ?, plate = ?, metadata = ?, model = ?, name = ? WHERE id = ?",
    {
      propData.coords.x,
      propData.coords.y,
      propData.coords.z,
      propData.rotation.x,
      propData.rotation.y,
      propData.rotation.z,
      propData.type,
      propData.plate or "",
      json.encode(propData.metadata),
      propData.model,
      propData.name,
      propData.id
    }
  )
  
  -- If update successful, notify all clients
  if updateResult then
    Luxu.triggerClientEvent("props:updated", -1, propData)
  end
end

-- Register server callback for prop updates
Luxu.registerServerCallback("props:update", handlePropUpdate)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
