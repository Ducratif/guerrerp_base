--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("illegal:buy")
AddEventHandler("illegal:buy", function(item, type, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then 
        print(("[IllegalShop] ERREUR: xPlayer nil pour source %s"):format(src))
        return 
    end

    for _, v in pairs(Config) do
        if item == v.item then
            if price ~= v.price then
                DropPlayer(src, "Kick ( IllégalShop )")
                return
            end
        end
    end

    if type == "weapon" then
        if xPlayer.getAccount('black_money').money >= tonumber(price) then
            xPlayer.removeAccountMoney('black_money', tonumber(price))
            exports.ox_inventory:AddItem(src, item, 1) -- arme (ox_inventory)
            xPlayer.showNotification("~o~GuerreRP Information\n~s~Merci maintenant casse toi !")
        else
            xPlayer.showNotification("~o~GuerreRP Information\n~s~Wsh ta pas une tune bouge de la !")
        end
    elseif type == "item" then
        if xPlayer.getAccount('black_money').money >= tonumber(price) then
            xPlayer.removeAccountMoney('black_money', tonumber(price))

            if item == "armor" then
                TriggerClientEvent('illegal:giveArmor', src, 100) -- 100 = armure max
            else
                exports.ox_inventory:AddItem(src, item, 1)
            end

            xPlayer.showNotification("~o~GuerreRP Information\n~s~Merci maintenant casse toi !")
        else
            xPlayer.showNotification("~o~GuerreRP Information\n~s~Wsh ta pas une tune bouge de la !")
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
