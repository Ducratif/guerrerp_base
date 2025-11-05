--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Clothing menu system for admin panel
local isClothingMenuOpen = false
local currentPreviewPed = 0
local malePedModel = joaat("mp_m_freemode_01")
local femalePedModel = joaat("mp_f_freemode_01")
local clothingData = {}
local savedOutfit = nil
-- Open clothing menu and create preview ped
local function openClothingMenu(data)
    Wait(300)
    
    -- Request both male and female models
    Luxu.requestModel(malePedModel)
    Luxu.requestModel(femalePedModel)
    
    -- Create preview ped at player coordinates
    local coords = Luxu.cache.coords
    currentPreviewPed = CreatePed(malePedModel, coords.x, coords.y, coords.z, coords.w, false, false)
    
    -- Freeze the preview ped
    FreezeEntityPosition(currentPreviewPed, true)
    
    -- Clean up models
    SetModelAsNoLongerNeeded(malePedModel)
    SetModelAsNoLongerNeeded(femalePedModel)
    
    -- Create thread to handle menu state
    CreateThread(function()
        while isClothingMenuOpen do
            Wait(300)
        end
    end)
end

OpenClothingMenu = openClothingMenu
-- Toggle clothing menu state callback
RegisterNuiCallback("clothingmenu:toggle", function(toggleState, cb)
    isClothingMenuOpen = toggleState
    cb(true)
end)
-- Equip staff clothing callback
RegisterNuiCallback("clothingmenu:equip", function(clothingData, cb)
    -- Save current outfit before equipping new one
    savedOutfit = SaveCurrentOutfit()
    
    -- Load the staff clothing
    LoadStaffClothing(clothingData)
    
    cb(true)
end)
-- Network event to equip staff clothing from server
Luxu.registerNetEvent("clothing:staff:equip", function(clothingData)
    if type(clothingData) == "table" then
        LoadStaffClothing(clothingData)
    end
end)
-- Network event to remove staff clothing and restore player skin
Luxu.registerNetEvent("clothing:staff:remove", function()
    Luxu.clothing.loadPlayerSkin()
end)
-- Clone current outfit callback
RegisterNuiCallback("clothingmenu:clone", function(data, cb)
    local currentOutfit = SaveCurrentOutfit()
    cb(currentOutfit)
end)
-- Load ped gender (male or female model)
local function loadPedGender(gender)
    if gender == "male" then
        -- Request and set male model
        Luxu.requestModel(malePedModel)
        SetPlayerModel(PlayerId(), malePedModel)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(malePedModel)
    elseif gender == "female" then
        -- Request and set female model
        Luxu.requestModel(femalePedModel)
        SetPlayerModel(PlayerId(), femalePedModel)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(femalePedModel)
    end
end

LoadPedGender = loadPedGender
-- Save current player outfit with all components and accessories
local function saveCurrentOutfit()
    local playerPed = PlayerPedId()
    local outfit = {}
    
    -- Save ped model
    outfit.model = GetEntityModel(playerPed)
    
    -- Initialize outfit structure
    outfit.props = {}
    outfit.accessories = {}
    
    -- Save helmet data
    outfit.helmet = {
        index = GetPedHelmetStoredHatPropIndex(playerPed),
        texture = GetPedHelmetStoredHatTexIndex(playerPed),
        enabled = IsPedWearingHelmet(playerPed)
    }
    
    -- Save all clothing components (0-11)
    for componentId = 0, 11, 1 do
        local componentData = {
            propId = componentId,
            drawable = GetPedDrawableVariation(playerPed, componentId),
            texture = GetPedTextureVariation(playerPed, componentId)
        }
        table.insert(outfit.props, componentData)
    end
    
    -- Save accessories (hats, glasses, etc.)
    local accessoryComponents = {0, 1, 2, 6, 7}
    for _, componentId in ipairs(accessoryComponents) do
        local accessoryData = {
            componentID = componentId,
            drawableId = GetPedPropIndex(playerPed, componentId),
            textureId = GetPedPropTextureIndex(playerPed, componentId),
            attach = true
        }
        table.insert(outfit.accessories, accessoryData)
    end
    
    return outfit
end

SaveCurrentOutfit = saveCurrentOutfit
-- Load staff clothing outfit onto player
local function loadStaffClothing(outfitData)
    local playerPed = PlayerPedId()
    
    -- Clear all existing props and helmet
    ClearAllPedProps(playerPed)
    RemovePedHelmet(playerPed, true)
    
    -- Check if model needs to be changed
    local currentModel = GetEntityModel(PlayerPedId())
    if currentModel ~= outfitData.model then
        -- Request and set new model
        local newModel = Luxu.requestModel(outfitData.model)
        SetPlayerModel(PlayerId(), newModel)
        playerPed = PlayerPedId()
        SetPedDefaultComponentVariation(playerPed)
        SetModelAsNoLongerNeeded(newModel)
    end
    
    -- Apply all clothing components
    for _, componentData in ipairs(outfitData.props) do
        if IsPedComponentVariationValid(playerPed, componentData.propId, componentData.drawable, componentData.texture) then
            SetPedComponentVariation(playerPed, componentData.propId, componentData.drawable, componentData.texture, 0)
        end
    end
    
    -- Apply all accessories
    for _, accessoryData in ipairs(outfitData.accessories) do
        SetPedPropIndex(playerPed, accessoryData.componentID, accessoryData.drawableId, accessoryData.textureId, accessoryData.attach)
    end
    
    -- Apply helmet if enabled
    if outfitData.helmet.enabled then
        SetPedHelmetPropIndex(playerPed, outfitData.helmet.index)
        SetPedHelmetTextureIndex(playerPed, outfitData.helmet.texture)
    end
end

LoadStaffClothing = loadStaffClothing

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
