--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if not lib then return end

local db = {}
local ImpoundList = lib.load 'config.impound'.Locations

local strtrim = function(s)
    if not s then return s end
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- Qui possède cette plaque ?
function db.GetVehicleOwner(plate)
    plate = strtrim(plate)
    local cb = MySQL.query.await('SELECT `owner` FROM `owned_vehicles` WHERE `plate` = ?', { plate })
    if not cb or not cb[1] then return false end
    return cb[1].owner or false
end

-- Ranger un véhicule dans un garage
-- plate: string | garage: string (nom du garage -> colonne `parking`)
-- properties: table (props véhicule) | vtype: "car"/"boat"/"heli" optionnel
function db.StoreVehicle(plate, garage, properties, vtype)
    plate = strtrim(plate)
    local vehicleJson = type(properties) == 'table' and json.encode(properties) or properties

    -- Vérifie la présence de la colonne `type` pour éviter une erreur SQL
    local hasType = false
    local cols = MySQL.query.await('SHOW COLUMNS FROM `owned_vehicles`')
    if cols then
        for i = 1, #cols do
            if cols[i].Field == 'type' then
                hasType = true
                break
            end
        end
    end

    local sql, params
    if hasType and vtype then
        sql = 'UPDATE `owned_vehicles` SET `stored` = 1, `parking` = ?, `vehicle` = ?, `type` = ? WHERE `plate` = ?'
        params = { garage, vehicleJson, vtype, plate }
    else
        sql = 'UPDATE `owned_vehicles` SET `stored` = 1, `parking` = ?, `vehicle` = ? WHERE `plate` = ?'
        params = { garage, vehicleJson, plate }
    end

    local changed = MySQL.update.await(sql, params) or 0
    return changed
end

-- Marquer un véhicule (rangé / sorti) pour un owner
function db.UpdateStored(plate, identifier, stored)
    plate = strtrim(plate)
    return MySQL.update.await(
        'UPDATE `owned_vehicles` SET `stored` = ? WHERE `plate` = ? AND `owner` = ?',
        { stored, plate, identifier }
    ) or 0
end

-- Véhicules du joueur rangés dans un garage donné
function db.GetPlayerVehicles(identifier, garage)
    local data = {}
    local rows = MySQL.query.await(
        'SELECT `vehicle` FROM `owned_vehicles` WHERE `owner` = ? AND `parking` = ? AND `stored` = 1',
        { identifier, garage }
    )
    if rows and rows[1] then
        for i = 1, #rows do
            local mods = json.decode(rows[i].vehicle)
            if mods and mods.plate then
                mods.plate = strtrim(mods.plate)
                data[mods.plate] = mods
            end
        end
    end
    return data
end

-- Liste fourrière (par type) pour un joueur
local GetVehicleNumberPlateText = GetVehicleNumberPlateText
local GetVehiclePetrolTankHealth = GetVehiclePetrolTankHealth
local GetVehicleBodyHealth = GetVehicleBodyHealth

function db.GetImpoundList(numb, identifier)
    local cfg = ImpoundList[numb]
    if not cfg then return false end

    local class = cfg.type
    local list = {}

    local rows = MySQL.query.await(
        'SELECT `vehicle` FROM `owned_vehicles` WHERE `owner` = ? AND `type` = ? AND `stored` = 0',
        { identifier, class }
    )
    if not rows or not rows[1] then return false end

    local worldVehicles = GetGamePool and GetGamePool('CVehicle') or {}
    for i = 1, #rows do
        local mods = json.decode(rows[i].vehicle)
        if mods and mods.plate then
            local modPlate = strtrim(mods.plate)
            local foundInWorld = false

            if worldVehicles and worldVehicles[1] then
                for _, veh in ipairs(worldVehicles) do
                    if DoesEntityExist(veh) then
                        local plate = strtrim(GetVehicleNumberPlateText(veh))
                        if plate == modPlate then
                            foundInWorld = true
                            break
                        end
                    end
                end
            end

            if not foundInWorld then
                list[modPlate] = mods
            end
        end
    end

    return next(list) and list or false
end

return db


--if not lib then return end
--
--local db = {}
--
--function db.GetVehicleOwner(plate)
--    local cb = MySQL.query.await('SELECT `owner` FROM `owned_vehicles` WHERE `plate` = ?', { plate })
--
--    if not cb[1] then return false end
--
--    return cb[1].owner or false
--end
--
--
--function db.StoreVehicle(plate, garage, properties)
--   -- local cb = MySQL.update.await('UPDATE `owned_vehicles` SET `stored` = ?, `parking` = ?, `vehicle` = ? WHERE `plate` = ?', { 1, garage, json.encode(properties), plate })
--local cb = MySQL.update.await('UPDATE `owned_vehicles` SET `stored` = ?, `parking` = ?, `vehicle` = ? WHERE `plate` = ?', { 1, garage, plate })
--    return cb
--end
--
--
--function db.GetPlayerVehicles(identifier, name)
--    local data = {}
--    local vehicles = MySQL.query.await('SELECT `vehicle` FROM `owned_vehicles` WHERE `owner` = ? AND `parking` = ?', { identifier, name })
--
--    if vehicles[1] then
--        for i = 1, #vehicles do
--            local mods = json.decode(vehicles[i].vehicle)
--            mods.plate = string.strtrim(mods.plate)
--
--            data[mods.plate] = mods
--        end
--    end
--
--    return data
--end
--
--
--function db.UpdateStored(plate, identifier, stored)
--    MySQL.update('UPDATE `owned_vehicles` SET `stored` = ? WHERE `plate` = ? AND `owner` = ?', { stored, plate, identifier })
--end
--
--
--local ImpoundList = lib.load 'config.impound'.Locations
--local strtrim = string.strtrim
--
--local GetVehicleNumberPlateText = GetVehicleNumberPlateText
--local GetVehiclePetrolTankHealth = GetVehiclePetrolTankHealth
--local GetVehicleBodyHealth = GetVehicleBodyHealth
--
---- credit to: https://github.com/LukeWasTakenn/luke_garages/blob/master/server/server.lua#L54
--function db.GetImpoundList(numb, identifier)
--    if ImpoundList[numb] then
--        local class = ImpoundList[numb].type
--        local list = {}
--
--        local vehicles = MySQL.query.await('SELECT `vehicle` FROM `owned_vehicles` WHERE `owner` = ? and type = ? AND `stored` = 0', { identifier, class })
--
--        if vehicles[1] then
--            local worldVehicles = GetAllVehicles()
--
--            for i = 1, #vehicles do
--                local mods = json.decode(vehicles[i].vehicle)
--                local modPlate = strtrim(mods.plate)
--
--                if #worldVehicles ~= nil and #worldVehicles > 0 then
--                    for index = 1, #worldVehicles do
--                        local vehicle = worldVehicles[index]
--                        local plate = strtrim(GetVehicleNumberPlateText(vehicle))
--
--                        if plate == modPlate then
--                            if GetEntityRoutingBucket(vehicle) > 0 then
--                                SetEntityRoutingBucket(vehicle, 0)
--                                DeleteEntity(vehicle)
--                                list[modPlate] = mods
--                                break
--                            end
--
--                            if GetVehiclePetrolTankHealth(vehicle) > 0 and GetVehicleBodyHealth(vehicle) > 0 then break end
--                            if GetVehiclePetrolTankHealth(vehicle) <= 0 and GetVehicleBodyHealth(vehicle) <= 0 then
--                                DeleteEntity(vehicle)
--                                list[modPlate] = mods
--                            end
--                            break
--                        elseif index == #worldVehicles then
--                            list[modPlate] = mods
--                        end
--                    end
--                else
--                    list[modPlate] = mods
--                end
--            end
--
--            return list
--        end
--    end
--
--    return false
--end
--
--return db

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
