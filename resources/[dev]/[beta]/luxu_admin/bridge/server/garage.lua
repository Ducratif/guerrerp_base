--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Framework.name == "esx" then
    ESXMODELLIST = {} -- A table of all registered vehicles modes <hash, name>
    MySQL.ready(function()
        local models = MySQL.query.await("SELECT model, name FROM vehicles")
        for _, model in pairs(models) do
            ESXMODELLIST[joaat(model.model)] = { model = model.model, label = model.name }
        end
    end)
end

---@class GarageUtils
local garage = {}

--- Returns a table, with model and plate, of all owned vehicles for a character
---@param charId number
---@return {model: string, plate: string}[]
function garage.getOwnedVehicles(charId)
    if Framework.name == "esx" then
        local result = MySQL.query.await("SELECT plate, vehicle FROM owned_vehicles WHERE owner = ?", { charId })

        for _, veh in pairs(result) do
            veh.model = json.decode(veh.vehicle)?.model or "unknown"
        end

        return result
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        local result = MySQL.query.await("SELECT vehicle as model, plate FROM player_vehicles WHERE citizenid = ?",
            { charId })
        return result
    elseif Framework.name == "ox" then
        local result = MySQL.query.await("SELECT model, plate FROM vehicles WHERE owner = ?", { charId })
        return result
    else
        return {}
    end
end

--- Updates the plate of a vehicle
---@param originalPlate string
---@param newPlate string
function garage.updateVehiclePlate(originalPlate, newPlate)
    if Framework.name == "esx" then
        return MySQL.update.await("UPDATE owned_vehicles SET plate = ? WHERE plate = ?", { newPlate, originalPlate }) ==
            1
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        return MySQL.update.await("UPDATE player_vehicles SET plate = ? WHERE plate = ?", { newPlate, originalPlate }) ==
            1
    elseif Framework.name == "ox" then
        return false
    end
end

--- Gives a vehicle to a character
---@param license string
---@param charId string
---@param plate string
---@param model string
---@param mods table
---@param vehicleType string ("automobile", "bike", "boat", "heli", "plane", ...)
function garage.giveVehicle(license, charId, plate, model, mods, vehicleType)
    if Framework.name == "esx" then
        return MySQL.insert.await(
            'INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (?,?,?,?)',
            { charId, plate, json.encode(mods), 1 }
        )
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        return MySQL.insert.await(
            'INSERT INTO player_vehicles (license, citizenid, plate, vehicle, hash, mods, state) VALUES (?,?,?,?,?,?,1)',
            { license, charId, plate, model, joaat(model), json.encode(mods) }
        )
    elseif Framework.name == "ox" then
    end
end

--- Deletes a vehicle from the database
---@param plate string
function garage.deleteVehicle(plate)
    if Framework.name == "esx" then
        return MySQL.update.await("DELETE FROM owned_vehicles WHERE plate = ?", { plate }) == 1
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        return MySQL.update.await("DELETE FROM player_vehicles WHERE plate = ?", { plate }) == 1
    elseif Framework.name == "ox" then
        return MySQL.update.await("DELETE FROM vehicles WHERE plate = ?", { plate }) == 1
    end
end

function garage.setVehicleStored(plate)
    if Framework.name == "esx" then
        return MySQL.update.await("UPDATE owned_vehicles SET stored = ? WHERE plate = ?", { 1, plate }) == 1
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        return MySQL.update.await("UPDATE player_vehicles SET state = ? WHERE plate = ?", { 1, plate }) == 1
    elseif Framework.name == "ox" then
    end
end

--- Changes the owner of a vehicle
---@param plate string
---@param charId number
function garage.changeVehicleOwner(plate, charId)
    if Framework.name == "esx" then
        MySQL.update.await("UPDATE owned_vehicles SET owner = ? WHERE plate = ?", { charId, plate })
    elseif Framework.name == "qb" or Framework.name == "qbx" then
        MySQL.update.await("UPDATE player_vehicles SET citizenid = ? WHERE plate = ?", { charId, plate })
    elseif Framework.name == "ox" then
        MySQL.update.await("UPDATE vehicles SET owner = ? WHERE plate = ?", { charId, plate })
    end
end

return garage

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
