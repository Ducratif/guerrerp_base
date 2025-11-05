--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
---Returns a table with all vehicle properties
---@param entity number
function Luxu.getVehicleMods(entity)
      if Framework.name == "ox" or Config.vehicles.use_ox_lib_for_mods then
            return lib.getVehicleProperties(entity)
      elseif Framework.name == "qb" or Config.vehicles.use_qb_lib_for_mods then
            return QBCore.Functions.GetVehicleProperties(entity)
      elseif Framework.name == "esx" or Config.vehicles.use_esx_lib_for_mods then
            return ESX.Game.GetVehicleProperties(entity)
      else
            return {
                  plate = GetVehicleNumberPlateText(entity),
                  model = GetEntityModel(entity)
            }
      end
end

---Sets vehicle properties
---@param entity number
---@param mods table
function Luxu.setVehicleMods(entity, mods)
      if Framework.name == "ox" or Config.vehicles.use_ox_lib_for_mods then
            lib.setVehicleProperties(entity, mods)
      elseif Framework.name == "qb" or Config.vehicles.use_qb_lib_for_mods then
            QBCore.Functions.SetVehicleProperties(entity, mods)
      elseif Framework.name == "esx" or Config.vehicles.use_esx_lib_for_mods then
            ESX.Game.SetVehicleProperties(entity, mods)
      else
            SetVehicleNumberPlateText(entity, mods.plate)
      end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
