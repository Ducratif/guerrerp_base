--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- local ox = GetResourceState('ox_core'):find("start")
-- if not ox then return end

-- --- @param amount number
-- lib.callback.register('ledjo_tuning:hasMoney', function(source, amount)
--     local money = exports.ox_inventory:Search(source, "count", "money")

--     return money >= amount
-- end)

-- --- @param amount number
-- RegisterNetEvent("ledjo_tuning:payMods", function(amount, properties)
--     exports.ox_inventory:RemoveItem(source, "money", amount)

--     local properties = properties
--     local isVehicleOwned = MySQL.prepare.await('SELECT plate,data FROM vehicles WHERE plate = ?', { properties.plate })

--     if isVehicleOwned then
--         local data = json.decode(isVehicleOwned.data)
--         data.properties = properties

--         local newData = json.encode(data)

--         MySQL.update('UPDATE vehicles SET data = ? WHERE plate = ?', { newData, properties.plate })
--     end
-- end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
