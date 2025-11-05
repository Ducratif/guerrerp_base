--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Staff sprites system variables and configuration
local GetEntityCoords = GetEntityCoords
local DrawMarker = DrawMarker
local TEXTURE_DICTIONARY = "luxu_admin_dict"
local runtimeTxd = CreateRuntimeTxd(TEXTURE_DICTIONARY)
local spriteVersions = {}
-- Generate unique texture name for staff group
local function generateTextureName(staffGroup)
  local version = spriteVersions[staffGroup] or 0
  return "staff_sprite_" .. staffGroup .. "_" .. version
end
local staffSprites = {}
-- Update staff sprite texture from base64 data
local function updateStaffSprite(staffGroup, base64Data)
  -- Remove sprite if no data provided
  if not base64Data or base64Data == "" then
    staffSprites[staffGroup] = nil
    return
  end
  
  -- Increment version for new texture
  local currentVersion = spriteVersions[staffGroup] or 0
  spriteVersions[staffGroup] = currentVersion + 1
  
  -- Create runtime texture from base64 image
  local textureName = generateTextureName(staffGroup)
  local textureHandle = CreateRuntimeTextureFromImage(runtimeTxd, textureName, base64Data)
  
  -- Wait for texture to be created
  repeat
    Wait(100)
  until textureHandle ~= 0
  
  -- Get texture dimensions and calculate aspect ratio
  local textureWidth = GetRuntimeTextureWidth(textureHandle)
  local textureHeight = GetRuntimeTextureHeight(textureHandle)
  local aspectRatio = textureWidth / textureHeight
  
  -- Store sprite data
  staffSprites[staffGroup] = {
    handle = textureHandle,
    base64 = base64Data,
    aspectRatio = aspectRatio
  }
end
local activeStaffMembers = {}
-- Update list of active staff members with sprites
local function updateActiveStaffMembers()
  local spriteConfig = GlobalState.luxu_admin_staff_sprites
  if not spriteConfig then
    return
  end
  
  -- Clear current list
  activeStaffMembers = {}
  
  -- Iterate through all active players
  for _, playerId in ipairs(GetActivePlayers()) do
    local serverId = GetPlayerServerId(playerId)
    local playerState = Player(serverId).state
    local staffGroup = playerState.luxu_admin_staff_group
    
    -- Skip if player has no staff group
    if staffGroup then
      local isOnDuty = playerState.luxu_admin_staff_duty
      local showSprite = playerState.luxu_admin_show_sprite
      
      -- Check if sprite should be shown
      if showSprite then
        local groupConfig = spriteConfig[staffGroup]
        if groupConfig and groupConfig.enabled and isOnDuty then
          table.insert(activeStaffMembers, {
            ped = GetPlayerPed(playerId),
            txn = generateTextureName(staffGroup),
            size = groupConfig.size,
            group = staffGroup
          })
        end
      end
    end
  end
end
-- Calculate sprite height offset based on size
local function calculateHeightOffset(size)
  return 1 + (size * 0.5)
end
-- Render staff sprites above players
local function renderStaffSprites()
  local staffCount = #activeStaffMembers
  
  -- Skip rendering if no staff members
  if staffCount == 0 then
    return Wait(2500)
  end
  
  local hasRendered = false
  
  -- Render sprite for each active staff member
  for i = 1, staffCount do
    local staffMember = activeStaffMembers[i]
    local spriteData = staffSprites[staffMember.group]
    
    -- Only render if sprite data exists
    if spriteData then
      local pedCoords = GetEntityCoords(staffMember.ped)
      local spriteSize = staffMember.size
      local spriteHeight = pedCoords.z + calculateHeightOffset(spriteSize)
      
      -- Draw marker with custom texture
      DrawMarker(
        9,                    -- marker type (upside down cone)
        pedCoords.x,          -- x position
        pedCoords.y,          -- y position
        spriteHeight,         -- z position (elevated)
        0.0, 0.0, 0.0,       -- direction
        0.0, 90.0, 90.0,     -- rotation
        spriteSize,           -- scale x
        spriteSize,           -- scale y
        spriteSize,           -- scale z
        255, 255, 255, 255,  -- color (white)
        false,               -- bob up and down
        false,               -- face camera
        2,                   -- p19
        true,                -- rotate
        TEXTURE_DICTIONARY,   -- texture dictionary
        staffMember.txn,     -- texture name
        false                -- draw on entities
      )
      
      hasRendered = true
    end
  end
  
  -- Wait longer if nothing was rendered
  if not hasRendered then
    Wait(2500)
  end
end
-- Server event: Update staff sprite
Luxu.registerNetEvent("sprite:update", function(staffGroup, base64Data)
  updateStaffSprite(staffGroup, base64Data)
end)
-- Resource start handler: Initialize sprite system
AddEventHandler("onClientResourceStart", function(resourceName)
  if resourceName == GetCurrentResourceName() then
    -- Start periodic update of active staff members (every 10 seconds)
    Luxu.setIntervalSync(updateActiveStaffMembers, 10000)
    
    -- Start continuous sprite rendering
    Luxu.setInterval(renderStaffSprites)
    
    -- Load existing sprites from GlobalState
    local spriteConfig = GlobalState.luxu_admin_staff_sprites or {}
    for staffGroup, groupData in pairs(spriteConfig) do
      if groupData.base64 and groupData.base64 ~= "" then
        updateStaffSprite(staffGroup, groupData.base64)
      end
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
