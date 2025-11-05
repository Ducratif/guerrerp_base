--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local PlayerData = {}
local ClothingToggleState = {}
local OriginalClothingState = {}

if Config.Debug then print("Config.Skin:", Config.Skin) end 

if Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
    
    if Config.Debug then print("ESX Loaded Successfully:", ESX) end

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
        if Config.Debug then print("PlayerData Loaded:", json.encode(PlayerData)) end 
    end)
    
elseif Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
    if Config.Debug then print("Checking QBCore:", QBCore) end
    
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = QBCore.Functions.GetPlayerData()
        if Config.Debug then print("PlayerData Loaded:", json.encode(PlayerData)) end
    end)
end

local crm_is_female = function(crm_ped)
    local crm_model = GetEntityModel(crm_ped)
    if crm_model == `mp_f_freemode_01` then
        return true
    elseif crm_model == `mp_m_freemode_01` then
        return false
    else
        return IsPedMale(crm_ped) and false or true
    end
end

local OriginalClothingState = OriginalClothingState or {}

local function handleClothingItem(itemType)
    if Config.Debug then print("handleClothingItem called with:", itemType) end

    local playerPed = PlayerPedId()
    DoRequestAnimSet('clothingtie')
    TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_positive_a', 8.0, -8, 2200, 120, 0, false, false, false)
    Citizen.Wait(2200)

    if Config.Skin == 'esx' then
        TriggerEvent('skinchanger:getSkin', function(CurrentSkin)
            local clothingData = CurrentSkin.sex == 0 and Config[itemType].Male or Config[itemType].Female

            if not ClothingToggleState[itemType] then
                OriginalClothingState[itemType] = {}
                for k, _ in pairs(clothingData) do
                    OriginalClothingState[itemType][k] = CurrentSkin[k]
                    CurrentSkin[k] = clothingData[k]
                end
                ClothingToggleState[itemType] = true
            else
                for k, v in pairs(OriginalClothingState[itemType] or {}) do
                    CurrentSkin[k] = v
                end
                ClothingToggleState[itemType] = false
            end

            TriggerEvent('skinchanger:loadClothes', CurrentSkin, clothingData)

            if Config[itemType].SaveOutfit then
                TriggerServerEvent('esx_skin:save', CurrentSkin)
            end
        end)

    elseif Config.Skin == 'qbcore' then
        TriggerEvent('qb-clothing:client:GetCurrentOutfit', function(CurrentSkin)
            local isMale = (CurrentSkin.gender == 0)
            local clothingData = isMale and Config[itemType].Male or Config[itemType].Female

            if not ClothingToggleState[itemType] then
                OriginalClothingState[itemType] = {}
                for k, _ in pairs(clothingData) do
                    OriginalClothingState[itemType][k] = CurrentSkin[k]
                    CurrentSkin[k] = clothingData[k]
                end
                ClothingToggleState[itemType] = true
            else
                for k, v in pairs(OriginalClothingState[itemType] or {}) do
                    CurrentSkin[k] = v
                end
                ClothingToggleState[itemType] = false
            end

            TriggerEvent('qb-clothing:client:loadOutfit', CurrentSkin)

            if Config[itemType].SaveOutfit then
                Citizen.Wait(100)
                TriggerEvent('qb-clothing:client:SaveOutfit')
            end
        end)

    elseif Config.Skin == 'fivem-appearance' then
        exports['fivem-appearance']:getPedAppearance(function(CurrentSkin)
            local isMale = (CurrentSkin.model == 'mp_m_freemode_01')
            local clothingData = isMale and Config[itemType].Male or Config[itemType].Female

            if not ClothingToggleState[itemType] then
                OriginalClothingState[itemType] = {}
                for k, _ in pairs(clothingData) do
                    OriginalClothingState[itemType][k] = CurrentSkin.components[k]
                    CurrentSkin.components[k] = clothingData[k]
                end
                ClothingToggleState[itemType] = true
            else
                for k, v in pairs(OriginalClothingState[itemType] or {}) do
                    CurrentSkin.components[k] = v
                end
                ClothingToggleState[itemType] = false
            end

            exports['fivem-appearance']:setPedAppearance(CurrentSkin)

            if Config[itemType].SaveOutfit then
                Citizen.Wait(100)
                exports['fivem-appearance']:setPedAppearance(CurrentSkin)
            end
        end)

    elseif Config.Skin == 'crm-appearance' then
        local crm_female = crm_is_female(playerPed)
        local crm_config = Config[itemType]
        local crm_data = crm_female and crm_config.Female or crm_config.Male

        if not ClothingToggleState[itemType] then
            OriginalClothingState[itemType] = {} -- optional backup logic for crm
            if crm_data.crm_clothing then
                exports['crm-appearance']:crm_set_ped_clothing(playerPed, crm_data.crm_clothing)
            end
            if crm_data.crm_accessories then
                exports['crm-appearance']:crm_set_ped_accessories(playerPed, crm_data.crm_accessories)
            end
            ClothingToggleState[itemType] = true
        else
            TriggerEvent("crm-appearance:load-player-skin")
            ClothingToggleState[itemType] = false
        end

        if Config[itemType].SaveOutfit then
            Citizen.Wait(100)
            exports['crm-appearance']:crm_save_appearance(nil, function() end)
        end
    end
end

for itemType, _ in pairs(Config) do
    local eventName = 'clothesitems:' .. string.lower(itemType)
    if Config.Debug then print("Registering event:", eventName) end
    RegisterNetEvent(eventName)
    AddEventHandler(eventName, function()
        if not ClothingToggleState[itemType] then
            handleClothingItem(itemType)
            ClothingToggleState[itemType] = true
        else
            toggleonoff(itemType)
            ClothingToggleState[itemType] = false
        end
        
    end)
    
end

function DoRequestAnimSet(anim)
    if Config.Debug then print("Requesting animation dictionary:", anim) end 
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        if Config.Debug then print("Waiting for animDict:", anim) end
        Citizen.Wait(1)
    end
    if Config.Debug then print("Animation loaded:", anim) end
end

if Config.RefreshSkin.UseCommand then
    RegisterCommand("refreshskin", function()
        refreshPlayerSkin()
    end, false)
end

if Config.RefreshSkin.UseItem then
    RegisterNetEvent('clothesitems:refreshskin')
    AddEventHandler('clothesitems:refreshskin', function()
        refreshPlayerSkin()
    end)
end

function refreshPlayerSkin()
    local playerPed = PlayerPedId()

    DoRequestAnimSet('clothingtie')
    TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_positive_a', 8.0, -8, 2200, 120, 0, false, false, false)
    Citizen.Wait(2200)

    ClothingToggleState = {}

    if Config.Skin == 'esx' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            else
                print("No saved skin found!") 
            end
        end)
    elseif Config.Skin == 'qbcore' then
        TriggerEvent('qb-clothing:client:reloadSkin') 
    elseif Config.Skin == 'fivem-appearance' then
        exports['fivem-appearance']:reloadSkin()
    elseif Config.Skin == 'crm-appearance' then
        TriggerEvent("crm-appearance:load-player-skin")
    end
end

function toggleonoff(itemType)
    local playerPed = PlayerPedId()

    if not OriginalClothingState[itemType] then
        if Config.Debug then print("No original state to revert for:", itemType) end
        return
    end

    DoRequestAnimSet('clothingtie')
    TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_positive_a', 8.0, -8, 2200, 120, 0, false, false, false)
    Citizen.Wait(2200) 

    TriggerEvent('skinchanger:getSkin', function(CurrentSkin)
        for k, v in pairs(OriginalClothingState[itemType]) do
            CurrentSkin[k] = v
        end
        TriggerEvent('skinchanger:loadClothes', CurrentSkin, OriginalClothingState[itemType])
        OriginalClothingState[itemType] = nil
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
