--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.Version == "esxold" then
    ESX = nil
    CreateThread(function()
        while ESX == nil do
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
            Wait(100)
        end
    end)
elseif Config.Version == "esxnew" then
    ESX = exports['es_extended']:getSharedObject()
end

TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})


ESX.RegisterUsableItem('repairkit', function(source)
	local source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('repairkit', 1)

	TriggerClientEvent('esx_mechanicjob:onFixkit', source)
	TriggerClientEvent('esx:showNotification', source, "Vous avez utiliser un kit de reparation")
end)

ESX.RegisterUsableItem('chiffon', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chiffon', 1)
	TriggerClientEvent('mechanic:clean', source)
end)


ESX.RegisterServerCallback('Mechanic:count', function(_, cb)
    local xPlayers = ESX.GetPlayers()
    local chiffon = 0

    for _, playerId in ipairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.job.name == 'mechanic' then
            chiffon = chiffon + 1
        end
    end

    cb(chiffon)
end)

RegisterServerEvent('white:renfortDemande')
AddEventHandler('white:renfortDemande', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'mechanic' then
        local xPlayers = ESX.GetPlayers()
        local coords = GetEntityCoords(GetPlayerPed(source))
        for i = 1, #xPlayers, 1 do
            local target = ESX.GetPlayerFromId(xPlayers[i])
            if target.job.name == 'mechanic' then
                TriggerClientEvent('white:setBlip', xPlayers[i], coords)
            end
        end
    end
end)

RegisterServerEvent('oliann:add')
AddEventHandler('oliann:add', function(type, amount, name)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if type == 'money' then
        xPlayer.addMoney(amount)
    elseif type == 'item' then
        xPlayer.addInventoryItem(name, amount)
    end
end)

RegisterServerEvent('oliann:remove')
AddEventHandler('oliann:remove', function(type, amount, name)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if type == 'money' then
        xPlayer.removeMoney(amount)
    elseif type == 'item' then
        xPlayer.removeInventoryItem(name, amount)
    end
end)

RegisterServerEvent('oliann:RemoveAccount')
AddEventHandler('oliann:RemoveAccount', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('money', amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
        print(account)
        account.addMoney(amount)
    end)
end)

ESX.RegisterServerCallback('white:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)


RegisterServerEvent('white:removeItem')
AddEventHandler('white:removeItem', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(item, 1)
end)

RegisterNetEvent('WLTD:RemoveItem')
AddEventHandler('WLTD:RemoveItem', function(Nom, Item)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.removeInventoryItem(Item, 1)
end)


RegisterServerEvent('Mechanic:Ouvert')
AddEventHandler('Mechanic:Ouvert', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i] , 'Mecano','', 'Le Los Santos ouvre ses portes','CHAR_LS_CUSTOMS', 8)
    end
end)

RegisterServerEvent('Mechanic:Fermer')
AddEventHandler('Mechanic:Fermer', function()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Mecano', '', 'Le Los Santos est fermé repassez plus tard!', 'CHAR_LS_CUSTOMS', 8)
    end
end)

RegisterNetEvent('Mecaperso')
AddEventHandler('Mecaperso', function(msg)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Mécano','', msg, 'CHAR_LS_CUSTOMS', 8)
    end
end)

ESX.RegisterServerCallback('Mechanic:getItemAmount', function(source, cb, item)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

RegisterNetEvent('Mechanic:removeItem')
AddEventHandler('Mechanic:removeItem', function(item)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(item, 1)
end)


RegisterServerEvent('ledjo_meca:add')
AddEventHandler('ledjo_meca:add', function(type, amount, name)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if type == 'money' then
		xPlayer.addMoney(amount)
	TriggerClientEvent('esx:showNotification', source, 'Tu a recu $'..amount 'success')
	elseif type == 'item' then
		xPlayer.addInventoryItem(name, amount)
	end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
