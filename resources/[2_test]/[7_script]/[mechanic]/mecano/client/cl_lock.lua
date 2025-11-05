--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
	local hash = GetHashKey("a_m_y_hasjew_01")
	while not HasModelLoaded(hash) do
	RequestModel(hash)
	Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_hasjew_01", -364.1453, -89.2099, 37.9913, 334.9738, false, true) 
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
	end)

exports.ox_target:addSphereZone({
	coords = vec3(0, 0, 0),
	radius = 0.8,
	debug = drawZones,
	minZ = 28.3,
	maxZ = 32.3,
options = {
		{
			name = 'Chiffons',
			event = 'shop:bitch',
			icon = 'fa-solid fa-circle',
			label = 'Chiffons',
		},
		{
			name = 'Kitrepair',
			event = 'shop:bitch2',
			icon = 'fa-solid fa-circle',
			label = 'Kit de reparations',
		}
	}
})

RegisterNetEvent('shop:bitch')
AddEventHandler('shop:bitch', function()
    ESX.TriggerServerCallback('Mechanic:count', function(chiffon)
        if chiffon < 0 then
            local input = lib.inputDialog(("Magasin"), {
                { type = 'input', label = ("Montant"), description = ("Acheter les chiffon 10$ pour 1 chiffon")},
            })
            if input then
                local montantchiffon = tonumber(input[1])
                if montantchiffon == nil or montantchiffon < 0 then
					lib.notify({
						title = 'Mécano Infos',
						description = 'Montant Invalide',
						type = 'error'
					})
                else
                    local chiffonprice = Config.OfflineChiffon
                    local totalPrice = chiffonprice * montantchiffon
                    local hasItem = exports.ox_inventory:Search('count', 'money')
                    if hasItem >= totalPrice then
						TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
                        FreezeEntityPosition(PlayerPedId(), true)
						lib.progressBar({
							duration = 2000,
							label = 'Achat de chiffon en cours',
							useWhileDead = false,
							canCancel = true,
						})
                        TriggerServerEvent('oliann:RemoveAccount', totalPrice)
                        TriggerServerEvent('oliann:add', 'item', input[1], 'chiffon')
                        FreezeEntityPosition(PlayerPedId(), false)
                        ClearPedTasks(PlayerPedId())
						lib.notify({
							title = 'Mécano Infos',
							description = 'Vous Avez Acheter le chiffon',
							type = 'succes'
						})
                    else
						lib.notify({
							title = 'Mécano Infos',
							description = 'Pas Asser d\'argent',
							type = 'error'
						})
                    end
                end
            end
        else
			lib.notify({
				title = 'Mécano Infos',
				description = 'Des employer son en service appele les',
				type = 'error'
			})
        end
    end)
end)

RegisterNetEvent('shop:bitch2')
AddEventHandler('shop:bitch2', function()
    ESX.TriggerServerCallback('Mechanic:count', function(repairkit)
        if repairkit < 1 then
            local input = lib.inputDialog(("Magasin"), {
                { type = 'input', label = ("Montant"), description = ("Acheter des repairkits 10$ pour 1 kit")},
            })
            if input then
                local montantkitrepair = tonumber(input[1])
                if montantkitrepair == nil or montantkitrepair < 0 then
					lib.notify({
						title = 'Mécano Infos',
						description = 'Montant Invalide',
						type = 'error'
					})
                else
                    local kitrepairprice = Config.OfflineKitrepair
                    local totalPrice = kitrepairprice * montantkitrepair
                    local hasItem = exports.ox_inventory:Search('count', 'money')
                    if hasItem >= totalPrice then
						TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
                        FreezeEntityPosition(PlayerPedId(), true)
						lib.progressBar({
							duration = 2000,
							label = 'Achat de kit de reparations en cours',
							useWhileDead = false,
							canCancel = true,
						})
                        TriggerServerEvent('oliann:RemoveAccount', totalPrice)
                        TriggerServerEvent('oliann:add', 'item', input[1], 'repair_kit')
                        FreezeEntityPosition(PlayerPedId(), false)
                        ClearPedTasks(PlayerPedId())
						lib.notify({
							title = 'Mécano Infos',
							description = 'Vous Avez Acheter le kit de reparations',
							type = 'succes'
						})
                    else
						lib.notify({
							title = 'Mécano Infos',
							description = 'Pas Asser d\'argent',
							type = 'error'
						})
                    end
                end
            end
        else
			lib.notify({
			title = 'Mécano Infos',
			description = 'Des employer son en service appele les',
				type = 'error'
			})
        end
    end)
end)

function ShowUpgradeLevels()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyVehicle(playerPed, false) then
        local vehicleUpgradeLevels = GetVehicleUpgradeLevels(vehicle)

		local contextOptions = {
			{
				title = 'Engine Level',
				description = tostring(vehicleUpgradeLevels.engine),
				onSelect = function()
					print("Engine Level Selected!")
				end
			},
			{
				title = 'Turbo Level',
				description = tostring(vehicleUpgradeLevels.turbo),
				onSelect = function()
					print("Turbo Level Selected!")
				end
			},
			{
				title = 'Brakes Level',
				description = tostring(vehicleUpgradeLevels.brakes),
				onSelect = function()
					print("Brakes Level Selected!")
				end
			},
			{
				title = 'Transmission Level',
				description = tostring(vehicleUpgradeLevels.transmission),
				onSelect = function()
					print("Transmission Level Selected!")
				end
			},
			{
				title = 'Back',
				icon = 'arrow-left',
				onSelect = function()
					lib.showContext('mecanof6')
				end
                }
            }
			lib.registerContext({
				id = 'test',
				title = 'Menu Upgrade',
				options = contextOptions
			})
	
			lib.showContext('test')
    end
end
-- Créer le menu contextuel avec les options existantes
RegisterNetEvent('white:upgrade', function(vehicle)
    if IsPedInAnyVehicle(PlayerPedId(), false) then -- Vérifier si le joueur est dans un véhicule
        lib.registerContext({
            id = 'Context',
            title = 'Context',
            options = {
                {
                    title = '📈 Diagnostique',
                    description = 'Diagnostique',
                    onSelect = ShowUpgradeLevels -- Utiliser la fonction ShowUpgradeLevels comme action
                }
            }
        })
        lib.showContext('Context')
    else
        TriggerEvent('ox_lib:notify', {
            title = 'Notification',
            description = 'Vous devez être dans un véhicule pour effectuer un diagnostic.',
            type = 'error',
			position = 'top'
        })
    end
end)

function GetVehicleUpgradeLevels(vehicle)
    local upgradeLevels = {}

    -- Récupérer le niveau d'amélioration moteur
    upgradeLevels.engine = GetVehicleMod(vehicle, 11)

    -- Récupérer le niveau d'amélioration turbo
    if IsToggleModOn(vehicle, 18) then
        upgradeLevels.turbo = 1
    else
        upgradeLevels.turbo = 0
    end

    -- Récupérer le niveau d'amélioration freins
    upgradeLevels.brakes = GetVehicleMod(vehicle, 12)

    -- Récupérer le niveau d'amélioration transmission
    upgradeLevels.transmission = GetVehicleMod(vehicle, 13)

    return upgradeLevels
end


RegisterNetEvent('Mechanic:upgrade')
AddEventHandler('Mechanic:upgrade', function(vehicle)
	GetVehicleUpgradeLevels()
end)

RegisterNetEvent('white:setBlip')
AddEventHandler('white:setBlip', function(coords)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    ESX.ShowAdvancedNotification('Los Santos', '~y~Demande d\'Assistance', 'Un Agent du ~y~Los Santos\'s~s~ demande une ~y~assistance supplémentaire~s~.\n[~y~Voir GPS~s~]', 'CHAR_LS_CUSTOMS', 1)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    local blipId = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blipId, 161)
    SetBlipScale(blipId, 1.2)
    SetBlipColour(blipId, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('[~y~Los Santos\'s~s~] Demande Assistance')
    EndTextCommandSetBlipName(blipId)
    Wait(20 * 1000)
    RemoveBlip(blipId)
end)

RegisterNetEvent('white:test')
AddEventHandler('white:test', function(coords)
	TriggerServerEvent('white:renfortDemande')
	lib.notify({
	  title = 'Renfort Mécano',
	  description = 'Demande de renfort envoyée',
	  type = 'success'
  })
end)

AddEventHandler('open_spawncar2', function(data)
	ESX.PlayerData = ESX.GetPlayerData()
	local Options = {}
	if Config.CarsList2[ESX.PlayerData.job.name] then
	  for _, info in pairs(Config.CarsList2[ESX.PlayerData.job.name]) do
		table.insert(Options, {
		  title = info.Name,
		  icon = "car",
		  onSelect = function()
			local pos = vector3(info.Coords.x, info.Coords.y, info.Coords.z)
			if not ESX.Game.IsSpawnPointClear(pos, 1.5) then
			  ESX.ShowNotification("Un vehicule bloque l'accès du garage")
			else
			  ESX.Game.SpawnVehicle(info.Hash, {
				x = info.Coords.x,
				y = info.Coords.y,
				z = info.Coords.z,
			  }, info.Coords.h, function(veh)
				SetVehicleNumberPlateText(veh, info.Plate)
				TaskWarpPedIntoVehicle(ESX.PlayerData.ped, veh, -1)
			  end)
			end
		  end,
		})
	  end
	end
	lib.registerContext({
	  id = 'spawncar2',
	  title = "Garage Depanneur",
	  options = Options
	})
	if Config.CarsList2[ESX.PlayerData.job.name] then
	  lib.showContext('spawncar2')
	else
	  ESX.ShowNotification("~r~Vous n'avez pas acces a se point")
	end
  end)

  exports.ox_target:addSphereZone({
	coords = vector3(-364.21, -89.22, 37.99),
	radius = 2,
	debug = drawZones,
	options = {
		{
			name = 'mechanic',
			event = 'mechanic:openCar2',
			icon = 'fa fa-automobile',
			label = 'Véhicule',
		},
  {
			name = 'mechanic',
			event = 'mechanic:deleteCar2',
			icon = 'fa fa-exchange',
			label = 'Ranger véhicule',
		}
	}
})

  RegisterNetEvent("mechanic:openCar2")
  AddEventHandler("mechanic:openCar2", function()
	  TriggerEvent("open_spawncar2")
  end)

  RegisterNetEvent('mechanic:deleteCar2')
  AddEventHandler('mechanic:deleteCar2',function()
	local veh = ESX.Game.GetClosestVehicle()
	DeleteEntity(veh)
  end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
