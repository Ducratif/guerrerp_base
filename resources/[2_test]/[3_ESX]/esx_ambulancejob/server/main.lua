--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local playersHealing, deadPlayers = {}, {}

if GetResourceState("esx_phone") ~= 'missing' then
	TriggerEvent('esx_phone:registerNumber', 'ambulance', TranslateCap('alert_ambulance'), true, true)
end

if GetResourceState("esx_society") ~= 'missing' then
	TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance',
		'society_ambulance', { type = 'public' })
end

local function isDeadState(src, bool)
	if not src or bool == nil then return end

	Player(src).state:set('isDead', bool, true)
end

-- ===== Revive EMS + Staff + Console (unifié) =====
RegisterNetEvent('esx_ambulancejob:revive', function(playerId)
    local src     = source or 0
    local xCaller = ESX.GetPlayerFromId(src)
    local isEMS   = xCaller and xCaller.job and xCaller.job.name == 'ambulance'
    --local canForce = hasPerm(src) or isEMS or src == 0
	local canForce = (xCaller and xCaller.getGroup() == "admin") or isEMS or src == 0

    playerId = tonumber(playerId) or src
    local xTarget = ESX.GetPlayerFromId(playerId)

    if not xTarget then
        if xCaller then xCaller.showNotification(TranslateCap('revive_fail_offline')) end
        return
    end

    local isMarkedDead = deadPlayers[playerId] ~= nil

    -- EMS doivent viser un joueur "dead" (évite les abus),
    -- le staff/console peut "forcer" même si pas marqué.
    if not isMarkedDead and not canForce then
        if xCaller then xCaller.showNotification(TranslateCap('player_not_unconscious')) end
        return
    end

    -- Récompense seulement pour EMS
    if isEMS then
        if Config.ReviveReward > 0 then
            xCaller.showNotification(TranslateCap('revive_complete_award', xTarget.name, Config.ReviveReward))
            xCaller.addMoney(Config.ReviveReward, "Revive Reward")
        else
            xCaller.showNotification(TranslateCap('revive_complete', xTarget.name))
        end
    end

    -- Revive client + reset état
    xTarget.triggerEvent('esx_ambulancejob:revive')
    isDeadState(xTarget.source, false)

    -- Notifier tous les EMS + nettoyer deadPlayers
    local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")
    for _, xP in pairs(Ambulance) do
        xP.triggerEvent('esx_ambulancejob:PlayerNotDead', playerId)
    end
    deadPlayers[playerId] = nil
end)


--AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
--	if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
--		return
--	end
--	if deadPlayers[eventData.id] then
--		TriggerClientEvent('esx_ambulancejob:revive', eventData.id)
--		local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")
--
--		for _, xPlayer in pairs(Ambulance) do
--			if xPlayer.job.name == 'ambulance' then
--				xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', eventData.id)
--			end
--		end
--		deadPlayers[eventData.id] = nil
--	end
--end)

-- ===== txAdmin heal → passe par le même event (cleanup + notify) =====
AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
        return
    end
    -- On utilise l'event serveur unifié (source = 0 → autorisé par hasPerm)
    TriggerEvent('esx_ambulancejob:revive', eventData.id)
end)


RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	local source = source
	deadPlayers[source] = 'dead'
	local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")
	isDeadState(source, true)

	for _, xPlayer in pairs(Ambulance) do
		xPlayer.triggerEvent('esx_ambulancejob:PlayerDead', source)
	end
end)



RegisterServerEvent('esx_ambulancejob:svsearch')
AddEventHandler('esx_ambulancejob:svsearch', function()
	TriggerClientEvent('esx_ambulancejob:clsearch', -1, source)
end)

RegisterNetEvent('esx_ambulancejob:onPlayerDistress')
AddEventHandler('esx_ambulancejob:onPlayerDistress', function()
	local source = source
	local injuredPed = GetPlayerPed(source)
	local injuredCoords = GetEntityCoords(injuredPed)

	if deadPlayers[source] then
		deadPlayers[source] = 'distress'
		local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

		for _, xPlayer in pairs(Ambulance) do
			xPlayer.triggerEvent('esx_ambulancejob:PlayerDistressed', source, injuredCoords)
		end
	end
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	local source = source
	if deadPlayers[source] then
		deadPlayers[source] = nil
		isDeadState(source, false)
		local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

		for _, xPlayer in pairs(Ambulance) do
			xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', source)
		end
	end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	if deadPlayers[playerId] then
		deadPlayers[playerId] = nil
		isDeadState(playerId, false)
		local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

		for _, xPlayer in pairs(Ambulance) do
			if xPlayer.job.name == 'ambulance' then
				xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', playerId)
			end
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:heal', target, type)
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:putInVehicle', target)
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.OxInventory and Config.RemoveItemsAfterRPDeath then
		exports.ox_inventory:ClearInventory(xPlayer.source)
		return cb()
	end

	if Config.RemoveCashAfterRPDeath then
		if xPlayer.getMoney() > 0 then
			xPlayer.removeMoney(xPlayer.getMoney(), "Death")
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0, "Death")
		end
	end

	if Config.RemoveItemsAfterRPDeath then
		for i = 1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end

	if Config.OxInventory then return cb() end

	local playerLoadout = {}
	if Config.RemoveWeaponsAfterRPDeath then
		for i = 1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else -- save weapons & restore em' since spawnmanager removes them
		for i = 1, #xPlayer.loadout, 1 do
			table.insert(playerLoadout, xPlayer.loadout[i])
		end

		-- give back wepaons after a couple of seconds
		CreateThread(function()
			Wait(5000)
			for i = 1, #playerLoadout, 1 do
				if playerLoadout[i].label ~= nil then
					xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
				end
			end
		end)
	end

	cb()
end)

if Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money

		cb(bankBalance >= Config.EarlyRespawnFineAmount)
	end)

	RegisterNetEvent('esx_ambulancejob:payFine')
	AddEventHandler('esx_ambulancejob:payFine', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local fineAmount = Config.EarlyRespawnFineAmount

		xPlayer.showNotification(TranslateCap('respawn_bleedout_fine_msg', ESX.Math.GroupDigits(fineAmount)))
		xPlayer.removeAccountMoney('bank', fineAmount, "Respawn Fine")
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_ambulancejob:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price, "Job Vehicle Purchase")

			MySQL.insert('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (?, ?, ?, ?, ?, ?)',
				{ xPlayer.identifier, json.encode(vehicleProps), vehicleProps.plate, type, xPlayer.job.name, true },
				function(rowsChanged)
					cb(true)
				end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:storeNearbyVehicle', function(source, cb, plates)
	local xPlayer = ESX.GetPlayerFromId(source)

	local plate = MySQL.scalar.await('SELECT plate FROM owned_vehicles WHERE owner = ? AND plate IN (?) AND job = ?',
		{ xPlayer.identifier, plates, xPlayer.job.name })

	if plate then
		MySQL.update('UPDATE owned_vehicles SET `stored` = true WHERE owner = ? AND plate = ? AND job = ?',
			{ xPlayer.identifier, plate, xPlayer.job.name },
			function(rowsChanged)
				if rowsChanged == 0 then
					cb(false)
				else
					cb(plate)
				end
			end)
	else
		cb(false)
	end
end)

function getPriceFromHash(vehicleHash, jobGrade, type)
	local vehicles = Config.AuthorizedVehicles[type][jobGrade]

	for i = 1, #vehicles do
		local vehicle = vehicles[i]
		if joaat(vehicle.model) == vehicleHash then
			return vehicle.price
		end
	end

	return 0
end

RegisterNetEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
		xPlayer.showNotification(TranslateCap('used_bandage'))
	elseif item == 'medikit' then
		xPlayer.showNotification(TranslateCap('used_medikit'))
	end
end)

RegisterNetEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'ambulance' then
		print(('[^2WARNING^7] Player ^5%s^7 Tried Giving Themselves -> ^5' .. itemName .. '^7!'):format(xPlayer.source))
		return
	elseif (itemName ~= 'medikit' and itemName ~= 'bandage') then
		print(('[^2WARNING^7] Player ^5%s^7 Tried Giving Themselves -> ^5' .. itemName .. '^7!'):format(xPlayer.source))
		return
	end

	if xPlayer.canCarryItem(itemName, amount) then
		xPlayer.addInventoryItem(itemName, amount)
	else
		xPlayer.showNotification(TranslateCap('max_item'))
	end
end)


--===========================================================================

-- ===== Permissions (ESX + ACE) =====
local function hasPerm(src)
    if src == 0 then return true end -- console / server-side
    if IsPlayerAceAllowed(src, 'revive.use') then return true end
    local xP = ESX.GetPlayerFromId(src)
    if not xP then return false end
    local g = xP.getGroup()
    return g and g ~= 'user' -- autorise mod/admin/superadmin/etc.
	--return g == 'mod' or g == 'admin' or g == 'superadmin'
end


local function doRevive(target)
    if target and GetPlayerName(target) ~= nil then
        TriggerClientEvent('esx_ambulancejob:revive', target)
        return true
    end
    return false
end

-- /revive (me | id) — robuste, sans typage ESX
RegisterCommand('revive', function(src, args)
    if not hasPerm(src) then
        if src > 0 then TriggerClientEvent('chat:addMessage', src, { args = { '^1Erreur', 'Permission refusée' } }) end
        return
    end

    local target = src
    local a1 = args[1] and tostring(args[1]):lower() or nil
    if a1 and a1 ~= 'me' then
        local id = tonumber(a1)
        if not doRevive(id) then
            if src > 0 then TriggerClientEvent('chat:addMessage', src, { args = { '^1Erreur', 'ID invalide ou hors-ligne' } }) end
            return
        end
        if src > 0 then TriggerClientEvent('chat:addMessage', src, { args = { '^2OK', ('Joueur %s réanimé'):format(id) } }) end
        return
    end

    doRevive(target)
end, false)

-- Alias utile si une autre ressource redéclare /revive
RegisterCommand('arevive', function(src, args)
    ExecuteCommand(('revive %s'):format(args[1] or 'me'))
end, false)

-- Event pour ton menu staff (client → serveur)
RegisterNetEvent('ducratif:reviveTarget', function(id)
    local src = source
    if not hasPerm(src) then return end
    local t = tonumber(id)
    if doRevive(t) then
        TriggerClientEvent('chat:addMessage', src, { args = { '^2OK', ('Joueur %s réanimé'):format(t) } })
    else
        TriggerClientEvent('chat:addMessage', src, { args = { '^1Erreur', 'ID invalide ou hors-ligne' } })
    end
end)

-- Suggestion (optionnel)
CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/revive', 'Revive un joueur (me ou id)', {{ name = 'who', help = 'me ou id' }})
end)

--TriggerServerEvent('ducratif:reviveTarget', targetId)


--===========================================================================




ESX.RegisterCommand('reviveall', "admin", function(xPlayer, args, showError)
	TriggerClientEvent('esx_ambulancejob:revive', -1)
end, false)

ESX.RegisterUsableItem('medikit', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('medikit', 1)

		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'medikit')

		Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('bandage', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('bandage', 1)

		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'bandage')

		Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeadPlayers', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == "ambulance" then
		cb(deadPlayers)
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.scalar('SELECT is_dead FROM users WHERE identifier = ?', { xPlayer.identifier }, function(isDead)
		cb(isDead)
	end)
end)

RegisterNetEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(isDead) == 'boolean' then
		MySQL.update('UPDATE users SET is_dead = ? WHERE identifier = ?', { isDead, xPlayer.identifier })
		isDeadState(source, isDead)
			
		if not isDead then
			local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")
			for _, xPlayer in pairs(Ambulance) do
				xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', source)
			end
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
