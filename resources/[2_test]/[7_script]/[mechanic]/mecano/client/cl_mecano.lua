--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local diag = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = ""
local CurrentActionMsg = ""
local CurrentActionData = {}
local CurrentlyTowedVehicle = nil
local Blips = {}
local NPCOnJob = false
local NPCTargetTowable = nil
local NPCTargetTowableZone = nil
local NPCHasSpawnedTowable = false
local NPCLastCancel = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local NPCTargetDeleterZone = false
local isDead = false
local isBusy = false

Citizen.CreateThread(function()
	ESX = exports["es_extended"]:getSharedObject()
    while ESX == nil do Citizen.Wait(100) end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

------Diagnostique


local options = {
    {
        name = 'mechanic_diagnostic',
        event = 'esx_mecanojob:menu-diag',
        icon = 'fa-solid fa-road',
        label = 'Diagnostiquer le vehicule',
		groups= {['mechanic'] = 0}

	
    },
}
  
  exports.ox_target:addGlobalVehicle(options)

  RegisterNetEvent("esx_mecanojob:menu-diag")
  AddEventHandler("esx_mecanojob:menu-diag", function(data)
	  ESX.TriggerServerCallback("white:getItemAmount", function(amount)
		  if amount >= 1 then
			  local playerPed = PlayerPedId()
			  local vehicle = data.entity
			  local carModel = GetEntityModel(data.entity)
			  local coords = GetEntityCoords(playerPed)
			  local text = "* L'individu diagnostique le véhicule *"
  
			  if IsPedSittingInAnyVehicle(playerPed) then
				  lib.notify({
					  title = 'Erreur',
					  description = "Ne fait pas ça à l'intérieur du véhicule",
					  type = 'error'
				  })
				  return
			  end
  
			  if DoesEntityExist(vehicle) then
				  SetVehicleDoorOpen(data.id, 4, false)
				  IsBusy = true
				  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_VEHICLE_MECHANIC", 0, true)
				  lib.progressBar({
								duration = 15000,
								label = "L'individu diagnostique le véhicule...",
								disable = {
									move = true,
									car = true,
									combat = true,
								}
							})
				  Citizen.CreateThread(function()
					  TriggerServerEvent('3dme:shareDisplay', text)
					  Citizen.Wait(1)
					  local veh_prop = ESX.Game.GetVehicleProperties(data.entity)
					  local etat_moteur = "Inconnu"
  
					  print(veh_prop)
					  print("ETAT MOTEUR : " .. tonumber(veh_prop.engineHealth))
  
					  if tonumber(veh_prop.engineHealth) >= 950 then
						  etat_moteur = "Bon état\n\nTemps de réparation : 5 min\nTarif : 100$"
					  elseif tonumber(veh_prop.engineHealth) < 950 and tonumber(veh_prop.engineHealth) >= 900 then
						  etat_moteur = "Correct\n\nTemps de réparation : 10 min\nTarif : 125$"
					  elseif tonumber(veh_prop.engineHealth) < 900 and tonumber(veh_prop.engineHealth) >= 850 then
						  etat_moteur = "Médiocre\n\nTemps de réparation : 30 min\nTarif : 150$"
					  elseif tonumber(veh_prop.engineHealth) < 850 then
						  etat_moteur = "DANGER\n\nTemps de réparation : 60 min\nTarif : 175$"
					  end
  
					  diag = veh_prop.plate
					  lib.notify({
						  title = 'Mécano',
						  description = 'Diagnostique du véhicule :\nMoteur : ' .. etat_moteur,
						  type = 'success',
						  position = 'top'
					  })
  
					  ClearPedTasksImmediately(playerPed)
					  SetVehicleDoorShut(data.id, 4, false)
				  end)
			  else
				  lib.notify({
					  title = 'Erreur',
					  description = 'Pas de voiture à côté',
					  type = 'error'
				  })
			  end
		  else
			  lib.notify({
				  title = 'Mécano Job',
				  description = "Vous devez avoir l'objet 'diag' pour effectuer un diagnostic",
				  type = 'error'
			  })
		  end
	  end, "diag")
  end)
  


-----Reparation


local options = {
    {
        name = 'mechanic_repair',
        event = 'esx_mecanojob:menu-repair',
        icon = 'fa-solid fa-road',
        label = 'Reparer le vehicule',
		groups= 'mechanic',
    },
}
  
  exports.ox_target:addGlobalVehicle(options)

  RegisterNetEvent("esx_mecanojob:menu-repair")
  AddEventHandler("esx_mecanojob:menu-repair", function(data)
	  local playerPed = PlayerPedId()
	  local vehicle = data.entity
	  local coords = GetEntityCoords(playerPed)
	  local text = "* L'individu répare le véhicule *"
  
	  if IsPedSittingInAnyVehicle(playerPed) then
		  lib.notify({
			title = 'Notification',
			description = 'Vous devez être dans une voiture',
			type = 'error'
		})
		  
		  return
	  end
  
	  if not DoesEntityExist(vehicle) then
		  lib.notify({
			  title = 'Notification',
			  description = 'Pas de voiture à côté',
			  type = 'error'
		  })
		  return
	  end
  
	  if ESX.Game.GetVehicleProperties(vehicle).plate ~= diag then
		  lib.notify({
			  title = 'Mécano Job',
			  description = "Vous n'avez pas fait le diagnostique du véhicule.",
			  type = 'error'
		  })
		  return
	  end
  
	  IsBusy = true
	  SetVehicleDoorOpen(data.id, 4, false)
	  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
	  TriggerServerEvent('3dme:shareDisplay', text)
  
	  Citizen.Wait(15000)
  
	  local fuel = GetVehicleFuelLevel(vehicle)
	  SetVehicleFixed(vehicle)
	  SetVehicleFuelLevel(vehicle, fuel)
	  SetVehicleDeformationFixed(vehicle)
	  SetVehicleUndriveable(vehicle, false)
	  SetVehicleEngineOn(vehicle, true, true)
	  ClearPedTasksImmediately(playerPed)
	  SetVehicleDoorShut(data.id, 4, false)
  
	  lib.notify({
		  title = 'Mécano Infos',
		  description = 'Véhicule réparé',
		  type = 'success'
	  })
	  IsBusy = false
  end)

    RegisterNetEvent("esx_mecanojob:menu-repair")
  AddEventHandler("esx_mecanojob:menu-repair", function(data)
	  local playerPed = PlayerPedId()
	  local vehicle = data.entity
	  local coords = GetEntityCoords(playerPed)
	  local text = "* L'individu répare le véhicule *"
  
	  if IsPedSittingInAnyVehicle(playerPed) then
		  lib.notify({
			title = 'Notification',
			description = 'Vous devez être dans une voiture',
			type = 'error'
		})
		  
		  return
	  end
  
	  if not DoesEntityExist(vehicle) then
		  lib.notify({
			  title = 'Notification',
			  description = 'Pas de voiture à côté',
			  type = 'error'
		  })
		  return
	  end
  
	  if ESX.Game.GetVehicleProperties(vehicle).plate ~= diag then
		  lib.notify({
			  title = 'Mécano Job',
			  description = "Vous n'avez pas fait le diagnostique du véhicule.",
			  type = 'error'
		  })
		  return
	  end
  
	  IsBusy = true
	  SetVehicleDoorOpen(data.id, 4, false)
	  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_VEHICLE_MECHANIC", 0, true)
	  lib.progressBar({
		duration = 15000,
		label = "Reparation Du Vehicule...",
		disable = {
			move = true,
			car = true,
			combat = true,
		}
	})
	  TriggerServerEvent('3dme:shareDisplay', text)
  
	  Citizen.Wait(1)
  
	  local fuel = GetVehicleFuelLevel(vehicle)
	  SetVehicleFixed(vehicle)
	  SetVehicleFuelLevel(vehicle, fuel)
	  SetVehicleDeformationFixed(vehicle)
	  SetVehicleUndriveable(vehicle, false)
	  SetVehicleEngineOn(vehicle, true, true)
	  ClearPedTasksImmediately(playerPed)
	  SetVehicleDoorShut(data.id, 4, false)
  
	  lib.notify({
		  title = 'Mécano Infos',
		  description = 'Véhicule réparé',
		  type = 'success'
	  })
	  IsBusy = false
  end)
  


AddEventHandler('esx_mechanicjob:hasExitedMarker', function(zone)
    if zone == 'VehicleDelivery' then
        NPCTargetDeleterZone = false
    end
    CurrentAction = nil
end)


AddEventHandler('esx_mechanicjob:hasEnteredMarker', function(zone)
    if zone == NPCJobTargetTowable then
        -- Code à exécuter lorsque le joueur entre dans la zone du véhicule cible pour la mission NPC (non spécifié dans votre code d'origine)

    elseif zone == 'VehicleDelivery' then
        NPCTargetDeleterZone = true
        local playerPed = PlayerPedId()

        if not IsPedInAnyVehicle(playerPed, false) then
            return
        end

        local vehicle = GetVehiclePedIsIn(playerPed,  false)

        CurrentAction = 'delete_vehicle'
        CurrentActionMsg = ('veh_stored')
        CurrentActionData = { vehicle = vehicle }
    end
end)



---------------TowTruck Remoquarge



local options = {
    {
        name = 'mechanic_flatbed',
        event = 'mech:flatbedveh',
        icon = 'fa-solid fa-road',
        label = 'Flatbed',
		groups= {['mechanic'] = 0}
    },
}
  
  exports.ox_target:addGlobalVehicle(options)

  RegisterNetEvent('mech:flatbedveh')
  AddEventHandler('mech:flatbedveh', function()
	  local playerPed = PlayerPedId()
	  local vehicle = GetVehiclePedIsIn(playerPed, true)
	  local car = "flatbed"
	  local carHash = GetHashKey(car)
	  local isVehicleTow = IsVehicleModel(vehicle, carHash)
  
	  if not isVehicleTow then
		  ESX.ShowAdvancedNotification('Mecano','', "Vous devez avoir une dépanneuse à plateau pour faire cela !", 'CHAR_CARSITE3', 8)
		  return
	  end
  
	  local targetVehicle = ESX.Game.GetVehicleInDirection()
  
	  if CurrentlyTowedVehicle == nil then
		  if targetVehicle == 0 then
			  ESX.ShowAdvancedNotification('Mecano','',"Il n'y a pas de véhicule à attacher !", 'CHAR_CARSITE3', 8)
			  return
		  end
  
		  if IsPedInAnyVehicle(playerPed, true) then
			  return
		  end
  
		  if vehicle == targetVehicle then
			  ESX.ShowAdvancedNotification('Mecano','',"Vous ne pouvez pas attacher votre propre véhicule de dépannage !", 'CHAR_CARSITE3', 8)
			  return
		  end
  
		  TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
		  Citizen.Wait(500)
		  ClearPedTasksImmediately(playerPed)
		  AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
		  CurrentlyTowedVehicle = targetVehicle
  
		  ESX.ShowAdvancedNotification('Mecano',"Le véhicule est chargé sur le plateau.", 'CHAR_CARSITE3', 8)
  
		  if NPCOnJob and NPCTargetTowable == targetVehicle then
			  lib.notify({
				title = 'Mécano Job',
				description = 'Veuillez déposer le véhicule',
				type = 'error'
			})
			  Config.Zones.VehicleDelivery.Type = -1
  
			  if Blips['NPCTargetTowableZone'] then
				  RemoveBlip(Blips['NPCTargetTowableZone'])
				  Blips['NPCTargetTowableZone'] = nil
			  end
  
			  Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
			  SetBlipRoute(Blips['NPCDelivery'], true)
		  end
	  else
		  AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
		  DetachEntity(CurrentlyTowedVehicle, true, true)
		  
		  if NPCOnJob and NPCTargetDeleterZone then
			  if CurrentlyTowedVehicle == NPCTargetTowable then
				  ESX.Game.DeleteVehicle(NPCTargetTowable)
				  TriggerServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
				  StopNPCJob()
				  NPCTargetDeleterZone = false
			  else
				  ESX.ShowAdvancedNotification('Mecano','',"Ce n'est pas le bon véhicule !", 'CHAR_CARSITE3', 8)
			  end
		  else
			  ESX.ShowAdvancedNotification('Mecano','',"Vous n'êtes pas au bon endroit pour faire cela !", 'CHAR_CARSITE3', 8)
		  end
  
		  CurrentlyTowedVehicle = nil
  
		  ESX.ShowAdvancedNotification('Mecano','',"Le véhicule est descendu du plateau.", 'CHAR_CARSITE3', 8)
	  end
  end)
  






-------------Lave Auto


local options = {
  {
	  name = 'mechanic_cleaning',
	  event = 'LaverVoiture',
	  icon = 'fa-solid fa-eraser fa-beat',--<<font-awesome-icon :icon="['fat', 'car-wash']" />
	  label = 'Laver la voiture',
	  groups= 'mechanic',
  },
}

exports.ox_target:addGlobalVehicle(options)

RegisterNetEvent("LaverVoiture")
AddEventHandler("LaverVoiture", function(data)
    ESX.TriggerServerCallback("white:getItemAmount", function(amount)
        if amount >= 1 then
            local vehicle = ESX.Game.GetVehicleInDirection()
            TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_MAID_CLEAN', 0, true)
            Citizen.Wait(10 * 1000)
            ClearPedTasks(PlayerPedId())
            SetVehicleDirtLevel(vehicle, 0)
            ClearPedTasksImmediately(playerPed)
            TriggerServerEvent('white:removeItem', 'chiffon')
            lib.notify({
                title = 'Mécano Job',
                description = 'Le véhicule est maintenant propre.',
                type = 'success'
            })
        else
            lib.notify({
                title = 'Mécano Job',
                description = "Tu n'as pas de chiffon sur toi",
                type = 'error'
            })
        end
    end, "chiffon")
end)




------------------Menu Annonce

RegisterNetEvent('Mechanic:ouvert')
AddEventHandler('Mechanic:ouvert', function()
TriggerServerEvent('Mechanic:Ouvert')
end)

RegisterNetEvent('Mechanic:fermer')
AddEventHandler('Mechanic:fermer', function()
TriggerServerEvent('Mechanic:Fermer')
end)

RegisterNetEvent('Mecaperso')
AddEventHandler('Mecaperso', function()
local msg = KeyboardInput("Message", "", 100)
TriggerServerEvent('Mecaperso', msg)
end)

CreateThread(function()
	for k, v in pairs(Config.Ano) do
  exports.ox_target:addBoxZone({
    coords = vec3(v.coords),
    size = vec3(1, 1, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'box',
			event = "white:annonce",
            icon = 'fa-brands fa-snapchat fa-beat',
            label = 'Annonce Mécano',
        }
    }
})
end
end)

RegisterNetEvent('white:annonce', function(data)
	lib.registerContext({
		id = 'Menu Annonce',
		title = 'Menu Annonce',
		onExit = function()
			print('Menu fermer')
		end,
		options = {
			{
				title = 'Annonce Ouverture ',
				description = 'Faire une annonce d\'ouverture',
				arrow = true,
				event = "Mechanic:ouvert",
			},
			{
				title = 'Annonce Fermeture',
				description = "Faire une annonce pour la fermeture",
				arrow = true,
				event = 'Mechanic:fermer',
			},
			{
				title = 'Annonce Perso',
				description = "Faire une annonce personalisée",
				arrow = true,
				event = 'Mecaperso',
			}
			
		},
	})

	lib.showContext('Menu Annonce')
	
end)


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

---------------Bossss

--CreateThread(function()
--	for k, v in pairs(Config.Boss) do
	--	exports.ox_target:addBoxZone({
	--		coords = vec3(v.coords),
	--		size = vec3(1, 1, 2),
	--		rotation = 45,
	--		debug = drawZones,
	--		options = {
		--		{
		--			name = 'box',
		--			event = "Mecanojob:OpenBossMenu",
			--		icon = 'fa-solid fa-desktop',
			--		label = 'Menu Patron',
			--	}
		--	}
		--})
	--end
--end)



--RegisterNetEvent('Mecanojob:OpenBossMenu')
--AddEventHandler('Mecanojob:OpenBossMenu',function()
 --   OpenBossMenu()
--end)

--function OpenBossMenu()
	--TriggerEvent('esx_society:openBossMenu', 'mechanic', function()
	--end, { wash = false })
--end

------------------------------------------ Vetements --------------------------------------------

exports.qtarget:AddBoxZone("MecaCloak", vector3(-328.4421, -130.1952, 38.9859), 1, 2, {
    name="MecaCloak",
    heading=265,
    minZ=7.04,
    maxZ=9.00
      }, {
          options = {
              {
                  event = "Mecaclothe", 
                  icon = "fa fa-clock",
                  label = "Menu vêtements",
                  job = "mechanic",
              },
          },
          distance = 3.5
  })
  
  RegisterNetEvent('Mecaclothe')
AddEventHandler('Mecaclothe', function()
	lib.registerContext({
		id = 'Mecaclothe',
		title = 'Vetements Mecano',
		onExit = function()
		end,
		options = {
			{
				title = 'Vos Vêtements',
				icon = "fas fa-tshirt",
				description = 'Prendre vos vêtements',
                onSelect = function(args)
                lib.progressCircle({
                    duration = 5000,
                    label = "Recuperer ses vêtements...",
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                    }
                })
				
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
					end)
                    ESX.ShowNotification('Vous avez Recuperé Vos Vetements Civil')
				end,
			},
			{
				title = 'Vêtements Mecano ',
				icon = "fas fa-tshirt",
				description = 'Vêtements de travail',
                onSelect = function(args)
                lib.progressCircle({
                    duration = 5000,
                    label = "Mettre la tenue de travail...",
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                    }
                })
					local playerPed = PlayerPedId()
					setUniform('mechanic_wear', playerPed)
					ESX.ShowNotification('Prêt a travailler')
				end,
			},
		},
	})
	lib.showContext('Mecaclothe')
end)


RegisterNetEvent('Mecclothe')
AddEventHandler('Mecclothe', function()
	local playerPed = PlayerPedId()
	setUniform('mechanic_wear', playerPed)
end)


function setUniform(job)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            if Config.Uniforms[job].male ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
            else
                ESX.ShowNotification("Pas de vêtements")
            end

            if job == 'mechanic_wear' then
				SetPedArmour(playerPed, 0)
            end
        else
            if Config.Uniforms[job].female ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
            else
                ESX.ShowNotification("Pas de vêtements")
            end

            if job == 'mechanic_wear' then
                SetPedArmour(playerPed, 0)
            end
        end
    end)
end

CreateThread(function()
	for k,v in pairs(Config.MecanoStation) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.Blip.Name)
		EndTextCommandSetBlipName(blip)
	end
end)

if Config.TargetJoueur then
    exports.qtarget:Player({
        options = {
            {
                icon = Config.Mecano.FactureIcon,
                label = Config.Mecano.FactureLabel,
                event = "facture",
                job = 'mechanic'
            },
        },
        distance = 2.0
    })
end

---------------Menu F6

RegisterNetEvent('white:annonce')
AddEventHandler('white:annonce', function(data)
    lib.registerContext({
        id = 'Menu Annonce',
        title = 'Menu Annonce',
        onExit = function()
            print('Hello there')
        end,
        options = {
            {
                title = 'Annonce Ouverture',
                description = "Faire l'annonce d'ouverture",
                arrow = true,
                event = "Mechanic:ouvert",
            },
            {
                title = 'Annonce Fermeture',
                description = "Faire l'annonce de la fermeture",
                arrow = true,
                event = 'Mechanic:fermer',
            },
            {
                title = 'Annonce Perso',
                description = 'Faire une annonce personnalisée',
                arrow = true,
                event = 'Mecaperso',
            },
			{
				title = 'Back',
				icon = 'arrow-left',
				onSelect = function()
					lib.showContext('mecanof6')
				end
                }
            }
    })

    lib.showContext('Menu Annonce')
end)


function menuf6mecano()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
        local contextOptions = {
            {
                title = '💻 Annonce',
                description = 'Annonce',
                event = 'white:annonce'
            },
            {
                title = '💻 Diagnostique des upgrades',
                description = 'Annonce',
                event = 'white:upgrade'
            },
            {
                title = '💻 Demande de renfort',
                description = "Demande de renfort sur l'intervention",
                event = 'white:test'
            },
            {
                title = '💸 Facturer le client',
                description = 'Facturer',
                event = 'White:sendbill'
            }
        }

        lib.registerContext({
            id = 'mecanof6',
            title = 'Menu Mecano',
            options = contextOptions
        })

        lib.showContext('mecanof6')
    end
end



RegisterCommand("mecano", function()
    menuf6mecano()
end)

RegisterKeyMapping("mecano", "Menu F6 Mecano", "keyboard", "F6")



------ Fourrierre

local options = {
    {
        name = 'mechanic_fourrierre',
        event = 'fourriere',
        icon = 'fa-solid fa-road',
        label = 'Mettre en fourrière',
		groups= {['mechanic'] = 0}
    },
}
  
  exports.ox_target:addGlobalVehicle(options)

  RegisterNetEvent("fourriere")
  AddEventHandler("fourriere", function()
	  local playerPed = PlayerPedId()
  
	  if IsPedSittingInAnyVehicle(playerPed) then
		  local vehicle = GetVehiclePedIsIn(playerPed, false)
  
		  if GetPedInVehicleSeat(vehicle, -1) == playerPed then
			  lib.notify({
				  title = 'Mécano Infos',
				  description = 'La voiture a été mise en fourrière',
				  type = 'success'
			  })
			  ESX.Game.DeleteVehicle(vehicle)
		  else
			  lib.notify({
				  title = 'Mécano Infos',
				  description = 'Prenez la place du conducteur ou sortez de la voiture',
				  type = 'error'
			  })
		  end
	  else
		  local vehicle = ESX.Game.GetVehicleInDirection()
  
		  if DoesEntityExist(vehicle) then
			  TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
			  Citizen.Wait(5000)
			  ClearPedTasks(playerPed)
			  lib.notify({
				  title = 'Mécano Infos',
				  description = 'La voiture a été mise en fourrière',
				  type = 'success'
			  })
			  ESX.Game.DeleteVehicle(vehicle)
		  else
			  lib.notify({
				  title = 'Mécano Infos',
				  description = 'Aucune voiture à proximité',
				  type = 'error'
			  })
		  end
	  end
  end)

-----Facture
RegisterNetEvent('White:sendbill')
AddEventHandler('White:sendbill', function()
      local input = lib.inputDialog('Facture Mécano', {'Amount'})

           if input then
                local amount = tonumber(input[1])

                if amount == nil or amount < 0 then
					lib.notify({
						title = 'Mécano',
						description = 'Montant Invalide!',
						type = 'erorr',
						position = 'top'
					})
                else
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer == -1 or closestDistance > 4.0 then
					lib.notify({
						title = 'Mécano',
						description = 'Personne proche!',
						type = 'erorr',
						position = 'top'
					})
                else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_mechanic', 'Facture Mecano', amount)
            end
        end
    end
end)

RegisterNetEvent('esx_mechanicjob:onFixkit')
AddEventHandler('esx_mechanicjob:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			CreateThread(function()
				Wait(20000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleUndriveable(vehicle, false)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification('Vehicule fixé !')
			end)
		end
	end
end)

RegisterNetEvent("mechanic:clean")
AddEventHandler("mechanic:clean", function()
	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()
	local coords    = GetEntityCoords(playerPed)

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification('Tu ne peux pas faire ceci dedans le vehicule')
		return
	end

	if DoesEntityExist(vehicle) then
		isBusy = true

		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
		Wait(10000)

		Citizen.CreateThread(function()
			SetVehicleDirtLevel(vehicle, 0)

			ESX.ShowNotification('Le vehicule est bien nettoyé!')
			isBusy = false
		end)

		ClearPedTasks(PlayerPedId())
		ClearPedTasksImmediately(playerPed)
	else
		ESX.ShowNotification("Il n'y a pas de vehicule à proximité")
	end
end)


---------------------------------- Fabrication Items --------------------------------------

exports.qtarget:AddBoxZone("Recupitems", vector3(-331.5987, -140.6217, 37.7991), 3.0, 3, {
	name="Recupitems",
	heading=35,
	debugPoly=false,
	minZ=12.98,
	maxZ=14.98,
	}, {
		options = {
			{
				event = "recupitems",
				label = "Récuperer le materiel",
				job = "mechanic",
				icon = "fa fa-wrench",
			},
		},
		distance = 2.5
})

RegisterNetEvent('recupitems')
AddEventHandler('recupitems', function()
	lib.registerContext({
		id = 'recupitems',
		title = 'Fabriquer Le Materiel Du Mecano',
		onExit = function()
		end,
		options = {
			{
				title = 'Fabriquer des Chiffons',
				icon = 'fa fa-wrench',
				image = 'https://cdn.discordapp.com/attachments/1366885013810843780/1366888935313375292/chiffon.png?ex=68129605&is=68114485&hm=2f534045c2e374f884e5f25f74644d37028da8ed4d6fcdb83c2112312b71d170&',
				description = 'Requis pour Nettoyer les voitures',
				onSelect = function(args)
					ESX.TriggerServerCallback('Mechanic:getItemAmount', function(quantity)
                        if quantity >= 0 then
							TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_HAMMERING", 0, true)
							lib.progressCircle({
								duration = 10000,
								label = "Fabrications de chiffons...",
								disable = {
									move = true,
									car = true,
									combat = true,
								}
							})
					TriggerServerEvent('ledjo_meca:add', 'item', 1, 'chiffon')
					ESX.ShowNotification('Tu as fabriqué un chiffon')
					ClearPedTasksImmediately(PlayerPedId())
            else
                ESX.ShowNotification('')
            end
        end, 'chiffon')
				end,
			},
			{
				title = 'Fabriquer Une Valise A Diagnostique',
				icon = 'fa fa-wrench',
				image = 'https://cdn.discordapp.com/attachments/1366885013810843780/1366888947757617162/diag.png?ex=68129608&is=68114488&hm=b7eaeda022e58db1e111160141e5f4d6a6f00276fbb24825e8dd6af581b03201&',
				description = 'Requis pour Diagnostiquer Les Vehicules',
				onSelect = function(args)
					ESX.TriggerServerCallback('Mechanic:getItemAmount', function(quantity)
                        if quantity >= 0 then
							TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_HAMMERING", 0, true)
							lib.progressCircle({
								duration = 10000,
								label = "Fabrication de la valise de diagnostique...",
								disable = {
									move = true,
									car = true,
									combat = true,
								}
							})
					TriggerServerEvent('ledjo_meca:add', 'item', 1, 'diag')
					ESX.ShowNotification('Tu as fabriqué une valise de Diagnostique')
					ClearPedTasksImmediately(PlayerPedId())
            else
                ESX.ShowNotification('')
            end
        end, 'diag')
				end,
			},
			{
				title = 'Fabriquer des Kits de Reparations',
				icon = 'fa fa-wrench',
				image = 'https://cdn.discordapp.com/attachments/1366885013810843780/1366888954510573669/repairkit.png?ex=6812960a&is=6811448a&hm=8788eeb703a618af42a2134184e46033b9c3a8c326081c7a3f6f45fceff58a82&',
				description = 'Requis pour Reparer les Vehicules',
				onSelect = function(args)
					ESX.TriggerServerCallback('Mechanic:getItemAmount', function(quantity)
                        if quantity >= 0 then
							TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_HAMMERING", 0, true)
							lib.progressCircle({
								duration = 10000,
								label = "Fabrication de Kit De Reparation...",
								disable = {
									move = true,
									car = true,
									combat = true,
								}
							})
					TriggerServerEvent('ledjo_meca:add', 'item', 1, 'repairkit')
					ESX.ShowNotification('Tu as fabriqué un kit de Reparation')
					ClearPedTasksImmediately(PlayerPedId())
            else
                ESX.ShowNotification('')
            end
        end, 'repairkit')
				end,
			},
		},
	})
	lib.showContext('recupitems')
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
