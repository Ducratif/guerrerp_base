--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local CurrentActionData, this_Spawner = {}, {}
local HasAlreadyEnteredMarker, IsInMainMenu = false, false
local LastZone, CurrentAction, CurrentActionMsg

-- Vehicle Spawn Menu
function OpenSpawnerMenu()
	local job = ESX.GetPlayerData().job.name
	local vehicleOptions = {}

	for i = 1, #Config.Vehicles, 1 do
		local veh = Config.Vehicles[i]
		if veh.job == job then
			table.insert(vehicleOptions, {
				title = veh.label,
				description = "Sortir ce véhicule",
				icon = "car",
				onSelect = function()
					if ESX.Game.IsSpawnPointClear(this_Spawner.Loc, 5.0) then
						SpawnVehicle(veh.model)
					else
						lib.notify({ type = 'error', description = _U('spawnpoint_blocked') })
					end
				end
			})
		end
	end

	if #vehicleOptions == 0 then
		lib.notify({ type = 'error', description = "Aucun véhicule disponible pour votre métier." })
		return
	end

	lib.registerContext({
		id = 'main_trailer_menu',
		title = _U('vehicle_spawner'),
		options = {
			{
				title = _U('dont_abuse'),
				icon = "triangle-exclamation",
				disabled = true
			},
			{
				title = _U('default_veh'),
				icon = "truck",
				description = "Voir la liste des véhicules",
				menu = 'veh_select_menu'
			}
		}
	})

	lib.registerContext({
		id = 'veh_select_menu',
		title = _U('default_veh'),
		menu = 'main_trailer_menu',
		options = vehicleOptions
	})

	lib.showContext('main_trailer_menu')
end


-- Vehicle Return Menu
function OpenReturnMenu()
	local playerCoords = GetEntityCoords(PlayerPedId())
	vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 5.0)

	if #vehicles > 0 then
		for i=1, #vehicles, 1 do
			Model = GetEntityModel(vehicles[i])

			if isVehicleListed(Model) then
				ESX.Game.DeleteVehicle(vehicles[i])
			else
				for k,v in pairs(Config.Zones) do
					--local distance2 = #(playerCoords - v.Del)
					delpost = v.Del
				if delpost (Config.Zones.delete_fourriere.del) then
				ESX.Game.DeleteVehicle(vehicles[i])
				end--end for k,v

				--for k,v in pairs(Config.Zones) do
				--	local distance = #(playerCoords - v.Pos)
				--	local distance2 = #(playerCoords - v.Del)
				end
			
			end
		end
	end
end

function isVehicleListed(Model)
	for _,listedVehicle in pairs(Config.ListedVehicles) do
		if Model == GetHashKey(listedVehicle) then
			return true
		end
	end
	return false
end

function SpawnVehicle(model)
	ESX.Game.SpawnVehicle(model, this_Spawner.Loc, this_Spawner.Heading)
end

-- Entered Marker
AddEventHandler('esx_vehiclespawner:hasEnteredMarker', function(zone)
	if zone == 'spawner_point' then
		CurrentAction = 'spawner_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'deleter_point' then
		CurrentAction = 'deleter_point'
		CurrentActionMsg = _U('press_to_enter2')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_vehiclespawner:hasExitedMarker', function()
	if not IsInMainMenu or IsInMainMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInMainMenu then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Create Blips
CreateThread(function()
	if Config.UseBlips then
		for k,v in pairs(Config.Zones) do
			local blip = AddBlipForCoord(v.Pos)

			SetBlipSprite (blip, Config.BlipVehicleSpawner.Sprite)
			SetBlipColour (blip, Config.BlipVehicleSpawner.Color)
			SetBlipDisplay(blip, Config.BlipVehicleSpawner.Display)
			SetBlipScale  (blip, Config.BlipVehicleSpawner.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('blip_spawner'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

		for k,v in pairs(Config.Zones) do
			local distance = #(playerCoords - v.Pos)
			local distance2 = #(playerCoords - v.Del)

			if distance < Config.DrawDistance then
				letSleep = false

				if Config.MenuMarker.Type ~= -1 then
					DrawMarker(Config.MenuMarker.Type, v.Pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MenuMarker.x, Config.MenuMarker.y, Config.MenuMarker.z, Config.MenuMarker.r, Config.MenuMarker.g, Config.MenuMarker.b, 100, false, true, 2, false, false, false, false)
				end

				if distance < Config.MenuMarker.x then
					isInMarker, this_Spawner, currentZone = true, v, 'spawner_point'
				end
			end

			if distance2 < Config.DrawDistance then
				letSleep = false

				if Config.DelMarker.Type ~= -1 then
					DrawMarker(Config.DelMarker.Type, v.Del, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.DelMarker.x, Config.DelMarker.y, Config.DelMarker.z, Config.DelMarker.r, Config.DelMarker.g, Config.DelMarker.b, 100, false, true, 2, false, false, false, false)
				end

				if distance2 < Config.DelMarker.x then
					isInMarker, this_Spawner, currentZone = true, v, 'deleter_point'
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			TriggerEvent('esx_vehiclespawner:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_vehiclespawner:hasExitedMarker', LastZone)
		end

		if letSleep then
			Wait(500)
		end
	end
end)

-- Key Controls
CreateThread(function()
	while true do
		Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'spawner_point' then
					OpenSpawnerMenu()
				elseif CurrentAction == 'deleter_point' then
					OpenReturnMenu()
				end

				CurrentAction = nil
			end
		else
			Wait(500)
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
