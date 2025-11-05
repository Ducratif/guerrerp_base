--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register("jg-vehiclemileage:server:get-mileage", function(_, plate)
  if not plate then return { error = true } end
  
  local vehicle = MySQL.single.await("SELECT mileage FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate})
  if not vehicle then return { error = true } end

  return { mileage = vehicle.mileage }
end)

RegisterNetEvent("jg-vehiclemileage:server:update-mileage", function(plate, mileage)
  if not plate then return end

  MySQL.update("UPDATE " .. Framework.VehiclesTable .. " SET mileage = ? WHERE plate = ?", {mileage, plate})
end)

---@param plate string
---@return number|false, string
exports("GetMileage", function(plate)
  local vehicle = MySQL.single.await("SELECT mileage FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate})
  if not vehicle then return false end
  return vehicle.mileage, Config.Unit
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
