--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports["es_extended"]:getSharedObject()

local getLicense = function(source, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = ? and owner = ?", {type, xPlayer.identifier})
	if result[1] ~= nil then
		return ('<span class="text" style="color:green">%s</span>'):format(Config.DisplayTexts[type].have)
	else
		return ('<span class="text" style="color:gray">%s</span>'):format(Config.DisplayTexts[type].notHave)
	end
end

local showDocument = function(source, type, imageUrl)
    local src = source
    local found = false
    local xPlayer = ESX.GetPlayerFromId(src)
    local PlayerPed = GetPlayerPed(src)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = ?', {xPlayer.identifier})
    local documentTable = Config.Documents[type]
    while not result do
        Citizen.Wait(500)
    end
    if documentTable then
        TriggerClientEvent("vms_document:client:animation", src, documentTable.animation, documentTable.animationTimeout)
        local playerInfo = {}

        if type == "id_card" then
            playerInfo = {
                ['firstname'] = result[1].firstname,
                ['lastname'] = result[1].lastname,
                ['height'] = result[1].height..'cm',
                ['sex'] = result[1].sex,
                ['dob'] = result[1].dateofbirth,
            }
        elseif type == "id_drive" then
            playerInfo = {
                ['firstname'] = result[1].firstname,
                ['lastname'] = result[1].lastname,
                ['dob'] = result[1].dateofbirth,
                ['sex'] = result[1].sex,
                ['drive_bike'] = getLicense(src, "drive_bike"),
                ['drive'] = getLicense(src, "drive"),
                ['drive_truck'] = getLicense(src, "drive_truck"),
            }
        elseif type == "id_fly" then
            playerInfo = {
                ['firstname'] = result[1].firstname,
                ['lastname'] = result[1].lastname,
                ['dob'] = result[1].dateofbirth,
                ['sex'] = result[1].sex,
                ['flying_helicopter'] = getLicense(src, "flying_helicopter"),
                ['flying_plane'] = getLicense(src, "flying_plane"),
            }
        elseif type == "id_boat" then
            playerInfo = {
                ['firstname'] = result[1].firstname,
                ['lastname'] = result[1].lastname,
                ['dob'] = result[1].dateofbirth,
                ['sex'] = result[1].sex,
                ['drive_boat'] = getLicense(src, "drive_boat"),
            }
        elseif type == "id_weapon" then
            playerInfo = {
                ['firstname'] = result[1].firstname,
                ['lastname'] = result[1].lastname,
                ['dob'] = result[1].dateofbirth,
                ['sex'] = result[1].sex,
                ['weapon'] = getLicense(src, "weapon"),
            }
        end

        TriggerClientEvent("vms_document:client:notify", src, Config.Texts["notify_title"], documentTable.notifyText, 2500, "fa fa-address-card", "success")

        for k, v in pairs(ESX.GetPlayers()) do
            local TargetPed = GetPlayerPed(v)
            local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
            if dist < 3.0 and PlayerPed ~= TargetPed then
                TriggerClientEvent('vms_document:client:send', v, type, playerInfo, imageUrl)
                found = true
                break
            end
        end

        if not found then 
            TriggerClientEvent('vms_document:client:send', src, type, playerInfo, imageUrl)
        end
    end
end

RegisterNetEvent("vms_document:show")
AddEventHandler("vms_document:show", function(type, imageUrl)
    showDocument(source, type, imageUrl)
end)

ESX.RegisterServerCallback("vms_document:getImage", function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local loaded_data = LoadResourceFile(GetCurrentResourceName(), "photos.json")
    local file_data = json.decode(loaded_data or "{}")
    if file_data[xPlayer.identifier] then
        cb(file_data[xPlayer.identifier])
    else
        cb(nil)
    end
end)

RegisterNetEvent("vms_document:saveMugshot")
AddEventHandler("vms_document:saveMugshot", function(imageUrl)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.MustMakePhoto and Config.PhotoPrice > 0 then
        local myMoney = xPlayer.getMoney()
        if myMoney >= Config.PhotoPrice then
            local loaded_data = LoadResourceFile(GetCurrentResourceName(), "photos.json")
            local file_data = json.decode(loaded_data or '{}')
            file_data[xPlayer.identifier] = imageUrl
            SaveResourceFile(GetCurrentResourceName(), "photos.json", json.encode(file_data, {indent = true}), -1)
            xPlayer.removeMoney(Config.PhotoPrice)
            TriggerClientEvent("vms_document:client:notify", _source, Config.Texts["notify_title_photo"], (Config.Texts["you_paid_for_photo"]):format(Config.PhotoPrice), 4500, "fa-solid fa-camera", "error")
        else
            TriggerClientEvent("vms_document:client:notify", _source, Config.Texts["notify_title_photo"], Config.Texts["not_have_money"], 4500, "fa-solid fa-camera", "error")
        end
    else
        local loaded_data = LoadResourceFile(GetCurrentResourceName(), "photos.json")
        local file_data = json.decode(loaded_data or '{}')
        file_data[xPlayer.identifier] = imageUrl
        SaveResourceFile(GetCurrentResourceName(), "photos.json", json.encode(file_data, {indent = true}), -1)
        if Config.MustMakePhoto then
            TriggerClientEvent("vms_document:client:notify", _source, Config.Texts["notify_title_photo"], Config.Texts["you_do_photo"], 4500, "fa-solid fa-camera", "error")
        end
    end
end)

RegisterNetEvent("vms_document:deleteMugshot")
AddEventHandler("vms_document:deleteMugshot", function()
    local loaded_data = LoadResourceFile(GetCurrentResourceName(), "photos.json")
    local file_data = json.decode(loaded_data or '{}')
    if file_data[xPlayer.identifier] ~= nil then
        file_data[xPlayer.identifier] = nil
        SaveResourceFile(GetCurrentResourceName(), "photos.json", json.encode(file_data, {indent = true}), -1)
    end
end)

for k, v in pairs(Config.Documents) do
    if v.item then
        ESX.RegisterUsableItem(v.item, function(source)
            TriggerClientEvent("vms_document:showMyDocument", source, k)            
        end)
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
