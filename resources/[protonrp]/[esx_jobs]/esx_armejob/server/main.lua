--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
TriggerEvent('::{Mark Lands#9396}::esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('::{Mark Lands#9396}::esx_phone:registerNumber', 'army', _U('alert_army'), true, true)
TriggerEvent('::{Mark Lands#9396}::esx_society:registerSociety', 'army', 'army', 'society_arme', 'society_arme', 'society_arme', {type = 'public'})

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:drag')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'army' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{Mark Lands#9396}::esx_armejob:drag', target, xPlayer.source)
		end
	else
		print(('esx_armejob: %s attempted to put in vehicle (not army)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:putInVehicle')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'army' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{Mark Lands#9396}::esx_armejob:putInVehicle', target)
		end
	else
		print(('esx_armejob: %s attempted to put in vehicle (not army)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:OutVehicle')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'army' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{Mark Lands#9396}::esx_armejob:OutVehicle', target)
		end
	else
		print(('esx_armejob: %s attempted to drag out from vehicle (not army)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:getStockItem')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_arme', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('have_withdrawn', count, inventoryItem.label))
				sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de prendre | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
			else
				TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
			end
		else
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getStockItems', function(source, cb)
	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_arme', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:putStockItems')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{Mark Lands#9396}::esx_addoninventory:getSharedInventory', 'society_arme', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('have_deposited', count, ESX.GetItem(itemName).label))
			sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de déposer | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
		else
			TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {
			name = GetPlayerName(target),
			job = xPlayer.job,
			job2 = xPlayer.job2,
			inventory = xPlayer.inventory,
			accounts = xPlayer.accounts,
			weapons = xPlayer.loadout,
			firstname = result[1]['firstname'],
			lastname = result[1]['lastname'],
			sex = result[1]['sex'],
			dob = result[1]['dateofbirth'],
			height = result[1]['height']
		}
	
		TriggerEvent('::{Mark Lands#9396}::esx_license:getLicenses', target, function(licenses)
			if licenses ~= nil then
				data.licenses = licenses
			end
		end)
	
		cb(data)
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getVehicleInfos', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)
		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)
				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
				['@identifier'] = result[1].owner
			}, function(result2)
				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end
			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('::{Mark Lands#9396}::esx_datastore:getSharedDataStore', 'society_arme', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de déposer une arme | NOM : ' ..weaponName.. '', 3145658)
	end

	TriggerEvent('::{Mark Lands#9396}::esx_datastore:getSharedDataStore', 'society_arme', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
	sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de prendre une arme | NOM : ' ..weaponName.. '', 3145658)

	TriggerEvent('::{Mark Lands#9396}::esx_datastore:getSharedDataStore', 'society_arme', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('::{Mark Lands#9396}::esx_armejob:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for i = 1, #authorizedWeapons, 1 do
		if authorizedWeapons[i].weapon == weaponName then
			selectedWeapon = authorizedWeapons[i]
			break
		end
	end

	if not selectedWeapon then
		print(('esx_armejob: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		if type == 1 then
			if xPlayer.getAccount('cash').money >= selectedWeapon.price then
				xPlayer.removeAccountMoney('cash', selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)
				sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de buy une arme | NOM : ' ..weaponName.. '', 3145658)

				cb(true)
			else
				cb(false)
			end
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getAccount('cash').money >= price then
					xPlayer.removeAccountMoney('cash', price)
					xPlayer.addWeaponComponent(weaponName, component.name)
					sendToDiscord('ProtonRP - LOGS', '[army-BITE] ' ..xPlayer.getName().. ' Vient de custom sur l\'arme | NOM : ' ..weaponName.. ' et à pris l\'objet ' ..component.name.. '', 3145658)

					cb(true)
				else
					cb(false)
				end
			else
				print(('esx_armejob: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('::{Mark Lands#9396}::esx_phone:removeNumber', 'army')
	end
end)

RegisterServerEvent('::{Mark Lands#9396}::esx_armejob:message')
AddEventHandler('::{Mark Lands#9396}::esx_armejob:message', function(target, msg)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'army' then
		TriggerClientEvent('::{Mark Lands#9396}::esx:showNotification', target, msg)
	end
end)

function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = "TON_WEBHOOK_DUCRATIF"
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
	{
		["title"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "By Ducratif - Heure: " ..date_local.. "",
		},
	}
}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
