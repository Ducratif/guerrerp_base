--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Entity Inspector Module
-- Handles entity inspection, visualization, and information display

-- Native function references for performance
local DrawLine = DrawLine
local DrawRect = DrawRect
local DrawText = DrawText
local GetEntityCoords = GetEntityCoords
local GetEntityModel = GetEntityModel
local GetEntityRotation = GetEntityRotation
local GetEntityVelocity = GetEntityVelocity
local GetEntityHealth = GetEntityHealth
local GetPedMaxHealth = GetPedMaxHealth
local GetGroundZFor_3dCoord = GetGroundZFor_3dCoord

-- Entity inspector state variables
local frozenEntities = {}  -- Tracks frozen entity states
local modelNameCache = {}  -- Cache for model names
local currentInspectedEntity = nil  -- Currently inspected entity
-- Round a number to specified decimal places
function roundToDecimalPlaces(number, decimalPlaces)
  local multiplier = 10 ^ decimalPlaces
  return math.floor(number * multiplier + 0.5) / multiplier
end
-- Round vector3 coordinates to specified decimal places
function roundVector3(vector, decimalPlaces)
  return {
    x = roundToDecimalPlaces(vector.x, decimalPlaces),
    y = roundToDecimalPlaces(vector.y, decimalPlaces),
    z = roundToDecimalPlaces(vector.z, decimalPlaces)
  }
end
-- Round vector4 coordinates to specified decimal places
function roundVector4(vector, decimalPlaces)
  return {
    x = roundToDecimalPlaces(vector.x, decimalPlaces),
    y = roundToDecimalPlaces(vector.y, decimalPlaces),
    z = roundToDecimalPlaces(vector.z, decimalPlaces),
    w = roundToDecimalPlaces(vector.w, decimalPlaces)
  }
end
-- Relationship group mappings for ped entities
local relationshipGroups = {
  ["0"] = "Companion",
  ["1"] = "Respect",
  ["2"] = "Like",
  ["3"] = "Neutral",
  ["4"] = "Dislike",
  ["5"] = "Hate",
  ["255"] = "Pedestrians"
}
-- Get relationship group name from hash
function getRelationshipGroupName(relationshipHash)
  local hashString = tostring(relationshipHash)
  return relationshipGroups[hashString] or "Unknown"
end
-- Convert rotation to direction vector
function rotationToDirection(rotation)
  -- Convert degrees to radians
  local radiansX = math.pi / 180 * rotation.x
  local radiansY = math.pi / 180 * rotation.y
  local radiansZ = math.pi / 180 * rotation.z
  
  -- Calculate direction vector from rotation
  local direction = {}
  direction.x = -math.sin(radiansZ) * math.abs(math.cos(radiansX))
  direction.y = math.cos(radiansZ) * math.abs(math.cos(radiansX))
  direction.z = math.sin(radiansX)
  
  return direction
end
-- Perform raycast from camera to get hit entity and coordinates
function performCameraRaycast(distance)
  local camera = false
  
  -- Determine if gameplay camera is rendering
  if not IsGameplayCamRendering() then
    camera = GetRenderingCam()
  end
  
  -- Get camera rotation and coordinates
  local camRotation
  local camCoords
  
  if not camera then
    camRotation = GetGameplayCamRot(2)
    camCoords = GetGameplayCamCoord()
  else
    camRotation = GetCamRot(camera, 2)
    camCoords = GetCamCoord(camera)
  end
  
  -- Calculate direction from rotation
  local direction = rotationToDirection(camRotation)
  
  -- Calculate end point for raycast
  local endCoords = {
    x = camCoords.x + (direction.x * distance),
    y = camCoords.y + (direction.y * distance),
    z = camCoords.z + (direction.z * distance)
  }
  
  -- Perform shape test ray
  local shapeTest = StartShapeTestRay(
    camCoords.x, camCoords.y, camCoords.z,
    endCoords.x, endCoords.y, endCoords.z,
    -1, PlayerPedId(), 0
  )
  
  local hit, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTest)
  
  return hit, hitCoords, entityHit
end
-- Bone connection definitions for ped skeleton visualization
-- Each connection is defined as {startBoneId, endBoneId}
local pedBoneConnections = {
  {0, 11816},      -- Root to spine
  {11816, 24818},  -- Spine connections
  {24818, 57597},  -- Spine to upper torso
  {57597, 39317},  -- Upper torso to neck
  {24818, 45509},  -- Torso to left arm
  {45509, 52301},  -- Left arm segments
  {52301, 14201},  -- Left arm to hand
  {14201, 57005},  -- Left hand connection
  {24818, 10706},  -- Torso to right arm
  {10706, 40269},  -- Right arm segments
  {40269, 28252},  -- Right arm to hand
  {28252, 57005},  -- Right hand connection
  {0, 2108},       -- Root to left leg
  {2108, 14284},   -- Left leg segments
  {14284, 52301},  -- Left leg to foot
  {0, 58271},      -- Root to right leg
  {58271, 63931},  -- Right leg segments
  {63931, 14201}   -- Right leg to foot
}
-- Default color for bone connections (red)
local boneConnectionColor = {
  r = 255,
  g = 0,
  b = 0,
  a = 255
}
-- Draw bone connections for ped entities
function drawPedBoneConnections(entity)
  for _, connection in ipairs(pedBoneConnections) do
    local startBoneId = connection[1]
    local endBoneId = connection[2]
    
    -- Get world positions of both bones
    local startBonePos = GetWorldPositionOfEntityBone(entity, startBoneId)
    local endBonePos = GetWorldPositionOfEntityBone(entity, endBoneId)
    
    -- Draw line between bones if both positions are valid
    if startBonePos and endBonePos then
      DrawLine(
        startBonePos.x, startBonePos.y, startBonePos.z,
        endBonePos.x, endBonePos.y, endBonePos.z,
        boneConnectionColor.r, boneConnectionColor.g, boneConnectionColor.b, boneConnectionColor.a
      )
    end
  end
end
-- Draw bounding box around entity
function drawEntityBoundingBox(entity, color)
  local entityModel = GetEntityModel(entity)
  local minDimensions, maxDimensions = GetModelDimensions(entityModel)
  local rightVector, forwardVector, upVector, entityPosition = GetEntityMatrix(entity)
  
  -- Calculate half extents of the bounding box
  local halfExtents = {
    x = (maxDimensions.x - minDimensions.x) * 0.5,
    y = (maxDimensions.y - minDimensions.y) * 0.5,
    z = (maxDimensions.z - minDimensions.z) * 0.5
  }
  -- Calculate corner positions of the bounding box
  -- Front bottom left corner
  local frontBottomLeft = {
    x = entityPosition.x + (halfExtents.y * forwardVector.x) + (halfExtents.x * rightVector.x) + (halfExtents.z * upVector.x),
    y = entityPosition.y + (halfExtents.y * forwardVector.y) + (halfExtents.x * rightVector.y) + (halfExtents.z * upVector.y),
    z = 0
  }
  
  -- Get ground Z coordinate
  local groundZ = GetGroundZFor_3dCoord(frontBottomLeft.x, frontBottomLeft.y, 1000.0, 0)
  frontBottomLeft.z = groundZ + (halfExtents.z * 2)
  -- Front bottom right corner
  local frontBottomRight = {
    x = entityPosition.x - (halfExtents.y * forwardVector.x) - (halfExtents.x * rightVector.x) - (halfExtents.z * upVector.x),
    y = entityPosition.y - (halfExtents.y * forwardVector.y) - (halfExtents.x * rightVector.y) - (halfExtents.z * upVector.y),
    z = 0
  }
  
  groundZ = GetGroundZFor_3dCoord(frontBottomLeft.x, frontBottomLeft.y, 1000.0, 0)
  frontBottomRight.z = groundZ
  -- Calculate other corners based on the first two
  local backBottomLeft = {
    x = frontBottomRight.x + (halfExtents.y * 2 * forwardVector.x),
    y = frontBottomRight.y + (halfExtents.y * 2 * forwardVector.y),
    z = frontBottomRight.z + (halfExtents.y * 2 * forwardVector.z)
  }
  local backBottomRight = {
    x = backBottomLeft.x + (halfExtents.z * 2 * upVector.x),
    y = backBottomLeft.y + (halfExtents.z * 2 * upVector.y),
    z = backBottomLeft.z + (halfExtents.z * 2 * upVector.z)
  }
  local frontTopLeft = {
    x = frontBottomRight.x + (halfExtents.z * 2 * upVector.x),
    y = frontBottomRight.y + (halfExtents.z * 2 * upVector.y),
    z = frontBottomRight.z + (halfExtents.z * 2 * upVector.z)
  }
  local backTopLeft = {
    x = frontBottomLeft.x - (halfExtents.y * 2 * forwardVector.x),
    y = frontBottomLeft.y - (halfExtents.y * 2 * forwardVector.y),
    z = frontBottomLeft.z - (halfExtents.y * 2 * forwardVector.z)
  }
  local backTopRight = {
    x = backTopLeft.x - (halfExtents.z * 2 * upVector.x),
    y = backTopLeft.y - (halfExtents.z * 2 * upVector.y),
    z = backTopLeft.z - (halfExtents.z * 2 * upVector.z)
  }
  local frontTopRight = {
    x = frontBottomLeft.x - (halfExtents.z * 2 * upVector.x),
    y = frontBottomLeft.y - (halfExtents.z * 2 * upVector.y),
    z = frontBottomLeft.z - (halfExtents.z * 2 * upVector.z)
  }
  -- Draw all 12 edges of the bounding box
  -- Bottom face edges
  DrawLine(frontBottomRight.x, frontBottomRight.y, frontBottomRight.z, backBottomLeft.x, backBottomLeft.y, backBottomLeft.z, color.r, color.g, color.b, color.a)
  DrawLine(frontBottomRight.x, frontBottomRight.y, frontBottomRight.z, frontTopLeft.x, frontTopLeft.y, frontTopLeft.z, color.r, color.g, color.b, color.a)
  DrawLine(backBottomLeft.x, backBottomLeft.y, backBottomLeft.z, backBottomRight.x, backBottomRight.y, backBottomRight.z, color.r, color.g, color.b, color.a)
  DrawLine(backBottomRight.x, backBottomRight.y, backBottomRight.z, frontTopLeft.x, frontTopLeft.y, frontTopLeft.z, color.r, color.g, color.b, color.a)
  
  -- Top face edges
  DrawLine(frontBottomLeft.x, frontBottomLeft.y, frontBottomLeft.z, backTopLeft.x, backTopLeft.y, backTopLeft.z, color.r, color.g, color.b, color.a)
  DrawLine(frontBottomLeft.x, frontBottomLeft.y, frontBottomLeft.z, frontTopRight.x, frontTopRight.y, frontTopRight.z, color.r, color.g, color.b, color.a)
  DrawLine(backTopLeft.x, backTopLeft.y, backTopLeft.z, backTopRight.x, backTopRight.y, backTopRight.z, color.r, color.g, color.b, color.a)
  DrawLine(backTopRight.x, backTopRight.y, backTopRight.z, frontTopRight.x, frontTopRight.y, frontTopRight.z, color.r, color.g, color.b, color.a)
  
  -- Vertical edges
  DrawLine(frontBottomRight.x, frontBottomRight.y, frontBottomRight.z, backTopRight.x, backTopRight.y, backTopRight.z, color.r, color.g, color.b, color.a)
  DrawLine(backBottomLeft.x, backBottomLeft.y, backBottomLeft.z, frontTopRight.x, frontTopRight.y, frontTopRight.z, color.r, color.g, color.b, color.a)
  DrawLine(backBottomRight.x, backBottomRight.y, backBottomRight.z, frontBottomLeft.x, frontBottomLeft.y, frontBottomLeft.z, color.r, color.g, color.b, color.a)
  DrawLine(frontTopLeft.x, frontTopLeft.y, frontTopLeft.z, backTopLeft.x, backTopLeft.y, backTopLeft.z, color.r, color.g, color.b, color.a)
end
-- Collect and send entity information to NUI
function collectEntityInformation(entity)
  local entityCoords = GetEntityCoords(entity)
  local entityHeading = GetEntityHeading(entity)
  local entityInfo = {}
  
  -- Determine entity type
  local entityType
  if IsEntityAPed(entity) then
    entityType = "ped"
  elseif IsEntityAVehicle(entity) then
    entityType = "vehicle"
  elseif IsEntityAnObject(entity) then
    entityType = "object"
  else
    entityType = "unknown"
  end
  
  -- Basic entity information
  entityInfo.entityType = entityType
  entityInfo.entityId = entity
  
  -- Network information
  local networkId = 0
  if NetworkGetEntityIsNetworked(entity) then
    local netId = NetworkGetNetworkIdFromEntity(entity)
    if netId then
      networkId = netId
    end
  end
  entityInfo.entityNetId = networkId
  
  -- Position and rotation data (rounded to 2 decimal places)
  entityInfo.entityCoords = roundVector4(vector4(entityCoords.x, entityCoords.y, entityCoords.z, entityHeading), 2)
  entityInfo.entityRotation = roundVector3(GetEntityRotation(entity), 2)
  entityInfo.entityVelocity = roundVector3(GetEntityVelocity(entity), 2)
  
  -- Model information
  local modelId = GetEntityModel(entity)
  entityInfo.modelId = modelId
  entityInfo.modelName = modelNameCache[modelId] or ""
  
  -- Owner information
  entityInfo.entityOwner = GetPlayerServerId(NetworkGetEntityOwner(entity))
  
  -- Distance to player
  local playerCoords = GetEntityCoords(PlayerPedId())
  local distance = #(playerCoords - entityCoords)
  entityInfo.distanceToEntity = roundToDecimalPlaces(distance, 2)
  
  -- Health information
  entityInfo.entityHealth = GetEntityHealth(entity)
  
  -- Max health based on entity type
  local maxHealth = 0
  if IsEntityAPed(entity) then
    maxHealth = GetPedMaxHealth(entity)
  elseif IsEntityAVehicle(entity) then
    maxHealth = GetVehicleBodyHealth(entity)
  end
  entityInfo.entityMaxHealth = maxHealth
  
  -- Ped-specific information
  local armour = 0
  if IsEntityAPed(entity) then
    armour = GetPedArmour(entity)
  end
  entityInfo.entityArmour = armour
  
  -- Relationship information for peds
  local relationshipHash = 0
  if IsEntityAPed(entity) then
    relationshipHash = GetPedRelationshipGroupHash(entity) or GetPedRelationshipGroupDefaultHash(entity) or 0
  end
  entityInfo.entityRelationshipGroupHash = relationshipHash
  
  -- Relationship to player
  local relationshipToPlayer = ""
  if IsEntityAPed(entity) then
    local relationship = GetRelationshipBetweenPeds(GetPedRelationshipGroupHash(entity), PlayerPedId())
    relationshipToPlayer = getRelationshipGroupName(relationship)
  end
  entityInfo.entityRelationshipToPlayer = relationshipToPlayer
  
  -- Send information to NUI
  FetchNui("inspectEntity", entityInfo)
end
-- Start the entity inspector system
function StartEntityInspector()
  -- Entity information update interval (50ms)
  local entityInfoInterval = Luxu.setInterval(function()
    if currentInspectedEntity then
      collectEntityInformation(currentInspectedEntity)
    end
  end, 50)
  
  -- Main entity inspector rendering and interaction loop
  local inspectorInterval = Luxu.setInterval(function()
    local playerPed = PlayerPedId()
    
    -- Color for crosshair line (white with transparency)
    local crosshairColor = {
      r = 255,
      g = 255,
      b = 255,
      a = 200
    }
    
    local playerCoords = GetEntityCoords(playerPed)
    local hit, hitCoords, hitEntity = performCameraRaycast(1000.0)
    
    if hit then
      -- Check if hit entity is valid (vehicle, ped, or object)
      if IsEntityAVehicle(hitEntity) or IsEntityAPed(hitEntity) or IsEntityAnObject(hitEntity) then
        -- Set current inspected entity
        currentInspectedEntity = hitEntity
        
        -- Draw green bounding box around inspected entity
        local boundingBoxColor = {
          r = 0,
          g = 255,
          b = 0,
          a = 200
        }
        drawEntityBoundingBox(hitEntity, boundingBoxColor)
        
        -- Draw bone connections if entity is a ped
        if IsEntityAPed(hitEntity) then
          drawPedBoneConnections(hitEntity)
        end
        
        -- Handle freeze/unfreeze entity (G key)
        if IsControlJustReleased(0, 47) then -- G key
          if frozenEntities[hitEntity] then
            frozenEntities[hitEntity] = not frozenEntities[hitEntity]
          else
            frozenEntities[hitEntity] = true
          end
          FreezeEntityPosition(hitEntity, frozenEntities[hitEntity])
        end
        
        -- Handle entity deletion (E key)
        if IsControlJustReleased(0, 38) then -- E key
          SetEntityAsMissionEntity(hitEntity, true, true)
          if IsEntityAVehicle(hitEntity) then
            DeleteVehicle(hitEntity)
          else
            DeleteEntity(hitEntity)
          end
        end
        
        -- Draw crosshair line from player to hit coordinates
        DrawLine(
          playerCoords.x, playerCoords.y, playerCoords.z,
          hitCoords.x, hitCoords.y, hitCoords.z,
          crosshairColor.r, crosshairColor.g, crosshairColor.b, crosshairColor.a
        )
      end
    else
      -- No entity hit, clear current inspected entity
      currentInspectedEntity = nil
    end
  end, 0, function()
    -- Cleanup function to clear entity info interval
    Luxu.clearInterval(entityInfoInterval)
  end)
  
  return inspectorInterval
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
