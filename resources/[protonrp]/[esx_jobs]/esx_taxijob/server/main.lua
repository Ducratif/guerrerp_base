--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
TriggerEvent('::{Mark Lands#9396}::esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('::{Mark Lands#9396}::esx_service:activateService', 'taxi', Config.MaxInService)
end

TriggerEvent('::{Mark Lands#9396}::esx_phone:registerNumber', 'taxi', _U('taxi_client'), true, true)
TriggerEvent('::{Mark Lands#9396}::esx_society:registerSociety', 'taxi', 'Taxi', 'society_taxi', 'society_taxi', 'society_taxi', {type = 'public'})

RegisterServerEvent('::{Mark Lands#9396}::esx_taxijob:success')
AddEventHandler('::{Mark Lands#9396}::esx_taxijob:success', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'taxi' then
		math.randomseed(GetGameTimer())
		local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
		local societyAccount = nil

		if xPlayer.job.grade >= 3 then
			total = total * 2
		end

		TriggerEvent('::{Mark Lands#9396}::esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
			societyAccount = account
		end)

		if societyAccount ~= nil then
			local playerMoney = math.floor(total / 100 * 750)
			local societyMoney = math.floor(total / 100 * 1500)

			xPlayer.addAccountMoney('cash', playerMoney)
			societyAccount.addMoney(societyMoney)

			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('comp_earned') .. societyMoney)
		else
			xPlayer.addAccountMoney('cash', total)
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('have_earned') .. total)
		end
	end
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_taxijob:getStockItem')
AddEventHandler('::{Mark Lands#9396}::esx_taxijob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. inventoryItem.label)
			else
				TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			end
		else
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_taxijob:getStockItems', function(source, cb)
	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_taxijob:putStockItems')
AddEventHandler('::{Mark Lands#9396}::esx_taxijob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. ESX.GetItem(itemName).label)
		else
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_taxijob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
