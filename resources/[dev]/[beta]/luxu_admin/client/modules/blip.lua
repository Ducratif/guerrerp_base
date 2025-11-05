--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Blip management system
local blipStorage = {}

-- Create a new blip with specified properties
local function createBlip(blipData)
    -- Create blip at coordinates
    local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
    
    -- Set blip properties
    SetBlipSprite(blip, blipData.sprite)
    SetBlipColour(blip, blipData.color)
    SetBlipScale(blip, blipData.scale)
    SetBlipDisplay(blip, blipData.display)
    SetBlipAsShortRange(blip, blipData.shortRange)
    
    -- Set blip name/label
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(blip)
    
    -- Store blip data for management
    blipStorage[blipData.id] = {
        blip = blip,
        label = blipData.label,
        coords = blipData.coords,
        display = blipData.display,
        scale = blipData.scale,
        shortRange = blipData.shortRange,
        color = blipData.color,
        sprite = blipData.sprite,
        id = blipData.id
    }
end
-- Network event handler for creating blips
Luxu.registerNetEvent("blips:create", function(blipData)
    local existingBlip = blipStorage[blipData.id]
    
    -- Remove existing blip if it exists
    if existingBlip then
        RemoveBlip(existingBlip.blip)
    end
    
    -- Create new blip
    createBlip(blipData)
end)
-- Network event handler for updating blips
Luxu.registerNetEvent("blips:update", function(blipData)
    local existingBlip = blipStorage[blipData.id]
    
    -- Exit if blip doesn't exist
    if not existingBlip then
        return
    end
    
    -- Remove old blip
    RemoveBlip(existingBlip.blip)
    
    -- Create new blip with updated properties
    local newBlip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
    
    -- Set blip properties
    SetBlipSprite(newBlip, blipData.sprite)
    SetBlipColour(newBlip, blipData.color)
    SetBlipScale(newBlip, blipData.scale)
    SetBlipDisplay(newBlip, blipData.display)
    SetBlipAsShortRange(newBlip, blipData.shortRange)
    
    -- Set blip name/label
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(newBlip)
    
    -- Update stored blip data
    local storedBlip = blipStorage[blipData.id]
    storedBlip.blip = newBlip
    storedBlip.label = blipData.label
    storedBlip.coords = blipData.coords
    storedBlip.display = blipData.display
    storedBlip.scale = blipData.scale
    storedBlip.shortRange = blipData.shortRange
    storedBlip.color = blipData.color
    storedBlip.sprite = blipData.sprite
end)
-- Network event handler for deleting blips
Luxu.registerNetEvent("blips:delete", function(blipId)
    local existingBlip = blipStorage[blipId]
    
    if not existingBlip then
        return
    end
    
    -- Remove the blip from the map
    RemoveBlip(existingBlip.blip)
    
    -- Remove from storage
    blipStorage[blipId] = nil
end)
-- Network event handler for syncing multiple blips
Luxu.registerNetEvent("blips:sync", function(blipDataArray)
    -- Create all blips from the sync data
    for _, blipData in ipairs(blipDataArray) do
        createBlip(blipData)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
