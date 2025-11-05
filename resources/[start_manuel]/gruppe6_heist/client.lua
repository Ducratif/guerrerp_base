--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]

ESX = exports["es_extended"]:getSharedObject()

local pos = GetEntityCoords(GetPlayerPed(-1),  true)
local s1, s2 = GetStreetNameAtCoord( pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
local street1 = GetStreetNameFromHashKey(s1)
local street2 = GetStreetNameFromHashKey(s2)
local isRobbing = false
local hasRobbed = false
local looting = false


Citizen.CreateThread(function()
    while not ESX do
        Citizen.Wait(0)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('gruppe6heist:Blip')
AddEventHandler('gruppe6heist:Blip', function(x,y,z)
  Blip = AddBlipForCoord(x,y,z)
    SetBlipSprite(Blip,  477)
    SetBlipColour(Blip,  1)
    SetBlipAlpha(Blip,  250)
    SetBlipDisplay(Blip, 4)
    SetBlipScale(Blip, 1.2)
    SetBlipFlashes(Blip, true)
    SetBlipAsShortRange(Blip,  true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Vol en cours | Camion')
    EndTextCommandSetBlipName(Blip)
    Wait(Config.BlipTimer * 1000)
    RemoveBlip(Blip)
end)

function DrawText3Ds(x,y,z,text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


RegisterNetEvent('gruppe6heist:rob')
AddEventHandler('gruppe6heist:rob', function()
    local Ped = GetPlayerPed(-1)

    -- Load the animation dictionary
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end

    -- Play the animation
    if not IsEntityPlayingAnim(Ped, "mini@repair", "fixing_a_player", 3) then
        ClearPedSecondaryTask(Ped)
        TaskPlayAnim(Ped, "mini@repair", "fixing_a_player", 8.0, -8.0, -1, 1, 0, false, false, false) 
        FreezeEntityPosition(Ped, true)  -- Freeze the player's position
    end
    
    Wait(Config.Timer * 1000)

    ClearPedTasksImmediately(Ped)
    FreezeEntityPosition(Ped, false)
end)


RegisterNetEvent('gruppe6heist:crowbar')
AddEventHandler('gruppe6heist:crowbar', function()
    local Ped = GetPlayerPed(-1)

    -- Load the specified animation for using the crowbar
    RequestAnimDict("weapons@first_person@aim_idle@p_m_zero@melee@small_wpn@crowbar@fidgets@c")
    while not HasAnimDictLoaded("weapons@first_person@aim_idle@p_m_zero@melee@small_wpn@crowbar@fidgets@c") do
        Citizen.Wait(0)
    end

    -- Attach the crowbar prop to the player's hand
    local crowbarModel = GetHashKey("prop_ing_crowbar") -- Model for the crowbar prop
    RequestModel(crowbarModel)
    while not HasModelLoaded(crowbarModel) do
        Citizen.Wait(0)
    end

    -- Create the crowbar object and attach it to the player's hand
    local crowbar = CreateObject(crowbarModel, 0, 0, 0, true, true, true)
    AttachEntityToEntity(crowbar, Ped, GetPedBoneIndex(Ped, 57005), 0.12, 0.02, 0.02, 260.0, 180.0, 0.0, true, true, false, true, 1, true)

    -- Start the button mash minigame
    isHacking = true
    exports['boii_minigames']:button_mash({
        style = 'default',  -- Style template
        difficulty = 2      -- Difficulty setting; increase to make it harder
    }, function(success)   -- Game callback function
        -- Cleanup after the hacking attempt
        ClearPedTasksImmediately(Ped) -- Clear the animation task
        DeleteObject(crowbar) -- Remove the crowbar from the player's hand

        if success then
            -- If successful, give the reward and end the hacking
            TriggerEvent('gruppe6heist:getReward')
        else
            -- If the player fails, give a penalty and wait 30 seconds
            ESX.ShowNotification("Vos bras sont fatigués, faites une pause de 30 secondes.")
            isHacking = false
            Wait(30 * 1000) -- Penalty time (30 seconds)
            ESX.ShowNotification("Vous pouvez essayer d'ouvrir à nouveau le camion.")
            TriggerServerEvent('gruppe6heist:moneytruck_false')
        end

        isHacking = false  -- Stop the hacking process
    end)

    -- Play the crowbar prying animation in a loop while hacking
    while isHacking do
        -- Check if the animation is already playing; if not, play it
        if not IsEntityPlayingAnim(Ped, "weapons@first_person@aim_idle@p_m_zero@melee@small_wpn@crowbar@fidgets@c", "fidget_low_loop", 3) then
            TaskPlayAnim(Ped, "weapons@first_person@aim_idle@p_m_zero@melee@small_wpn@crowbar@fidgets@c", "fidget_low_loop", 8.0, -8.0, -1, 49, 0, 0, 0, 0)
        end

        Citizen.Wait(100)  -- Adjust as necessary for your game’s performance
    end

    -- Cleanup after stopping the animation
    if isHacking == false then
        ClearPedTasksImmediately(Ped) -- Ensure any remaining animation is cleared
        DeleteObject(crowbar) -- Remove the crowbar from the player's hand
    end
end)


RegisterNetEvent('gruppe6heist:getReward')
AddEventHandler('gruppe6heist:getReward', function()
  local pos = GetEntityCoords(GetPlayerPed(-1))
  local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, 0, 70)

    if vehicle == GetHashKey('stockade') or GetEntityModel(vehicle) then
      createped()
      pedSpawned = true
    end
    Citizen.Wait(0)
end)


function Timeout(hasRobbed)
    local timer = math.random(0,6400)
    while hasRobbed == true do
        Citizen.Wait(1000)

        if timer > 0 then
            timer = timer -1
        end

        if timer == 1 then
            hasRobbed = false
            finished = false
            break
        end
    end
end

RegisterNetEvent('gruppe6heist:robbingtimer')
AddEventHandler('gruppe6heist:robbingtimer', function ()

    if isRobbing == true then
        local timer = Config.Timer

        Citizen.CreateThread(function()
            while timer > 0 and isRobbing do
                Citizen.Wait (1000)

                if  timer > 0 then
                    timer = timer -1
                end

                if timer == 1 then
                    finished = true
                    break
                end
            end
        end)
    end
end)


function PlateCheck(CurPlate, CurrentPlate)
    if CurrentPlate ~= CurPlate then
        return
    else
        looting = true
        TriggerEvent('gruppe6heist:rob')
        TriggerServerEvent('gruppe6heist:Payout')
        TriggerEvent('gruppe6heist:robbingtimer')
        FreezeEntityPosition(Ped, true)  -- Freeze the player's position
        exports.rprogress:Start("Robbing Truck", Config.Timer * 1000)
        Wait(Config.Timer * 1000)
        FreezeEntityPosition(Ped, false)  -- Freeze the player's position
    end
end

RobbedPlates = {}
local stockadeHash = GetHashKey('stockade') -- Model hash for the armored truck (stockade)

Citizen.CreateThread(function()
    -- Register ox_target interaction for the stockade vehicle model
    exports['ox_target']:addGlobalVehicle({
        name = 'heist_truck_robbery',
        icon = 'fa-solid fa-sack-dollar',
        label = 'Rob the Armored Truck',
        bones = { 'door_dside_r', 'bonnet' }, -- Adjust target location on vehicle
        distance = 5.0,
        canInteract = function(entity, distance, coords, name)
            local vehicleModel = GetEntityModel(entity)
            local Plate = GetVehicleNumberPlateText(entity)
            -- Ensure the vehicle is the stockade and has not already been robbed
            return vehicleModel == stockadeHash and distance <= 5.0 and not RobbedPlates[Plate]
        end,
        onSelect = function(data)
            local vehicle = data.entity
            local Plate = GetVehicleNumberPlateText(vehicle)

            -- Check if the vehicle has already been robbed
            if not RobbedPlates[Plate] then
                CurPlate = Plate
                TriggerServerEvent('gruppe6heist:Itemcheck', 1) -- Trigger the robbery check on the server side
            else
                -- Notify the player that the truck has already been robbed
                ESX.ShowNotification("Quelqu'un a déjà volé le camion.")
            end
        end
    })

    while true do
        Citizen.Wait(0) -- Check every second to reduce load

        local pos = GetEntityCoords(GetPlayerPed(-1))
        local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, stockadeHash, 70) -- Find the closest stockade vehicle

        if DoesEntityExist(vehicle) and pedSpawned then
            local text = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -4.25, 0.0)
            local dstCheck = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, GetEntityCoords(vehicle), true)

            if not IsEntityDead(GetPlayerPed(-1)) then
                DrawText3Ds(text.x, text.y, text.z, "~r~[E]~w~ Pour voler")
                
                if dstCheck < 5.0 then
                    if IsControlJustReleased(0, 38) and not looting then
                        CurrentPlate = GetVehicleNumberPlateText(vehicle)
                        PlateCheck(CurPlate, CurrentPlate)
                        isRobbing = true
                    end
                end

                if finished then
                    SetPedAsNoLongerNeeded(guard)
                    SetPedAsNoLongerNeeded(guard2)
                    SetPedAsNoLongerNeeded(guard3)
                    pedSpawned = false
                    isRobbing = false
                    looting = false
                    Timeout(true)
                    RobbedPlates[GetVehicleNumberPlateText(vehicle)] = true
                    TriggerServerEvent('gruppe6heist:UpdatePlates', RobbedPlates, GetVehicleNumberPlateText(vehicle))
                    TriggerServerEvent('gruppe6heist:moneytruck_false')
                end
            end
        else
            Citizen.Wait(500) -- Wait if no vehicle is found
        end
    end
end)

RegisterNetEvent('gruppe6heist:newTable')
AddEventHandler('gruppe6heist:newTable', function(UpdatedTable)
    RobbedPlates = UpdatedTable
end)


function createped()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local hashKey = GetHashKey("ig_casey")
    local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.001, 0, 70)
    local pedType = 5

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(500)
    end

    guard = CreatePedInsideVehicle(vehicle, pedType, hashKey, 0, 1, 1)
    guard2 = CreatePedInsideVehicle(vehicle, pedType, hashKey, 1, 1, 1)
    guard3 =  CreatePedInsideVehicle(vehicle, pedType, hashKey, 2, 1, 1)


  --  Guard 1

    SetPedShootRate(guard,  750)
    SetPedCombatAttributes(guard, 46, true)
    SetPedFleeAttributes(guard, 0, 0)
    SetPedAsEnemy(guard,true)
    SetPedMaxHealth(guard, 900)
    SetPedAlertness(guard, 3)
    SetPedCombatRange(guard, 0)
    SetPedCombatMovement(guard, 3)
    TaskCombatPed(guard, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard, vehicle, 0)
    GiveWeaponToPed(guard, GetHashKey("WEAPON_CARBINERIFLE"), 5000, true, true)
    SetPedRelationshipGroupHash( guard, GetHashKey("HATES_PLAYER"))


    --  Guard 2

    SetPedShootRate(guard2,  750)
    SetPedCombatAttributes(guard2, 46, true)
    SetPedFleeAttributes(guard2, 0, 0)
    SetPedAsEnemy(guard2,true)
    SetPedMaxHealth(guard2, 900)
    SetPedAlertness(guard2, 3)
    SetPedCombatRange(guard2, 0)
    SetPedCombatMovement(guard2, 3)
    TaskCombatPed(guard2, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard2, vehicle, 0)
    GiveWeaponToPed(guard2, GetHashKey("WEAPON_SMG"), 5000, true, true)
    SetPedRelationshipGroupHash( guard2, GetHashKey("HATES_PLAYER"))
  

    --  Guard3

    SetPedShootRate(guard3,  750)
    SetPedCombatAttributes(guard3, 46, true)
    SetPedFleeAttributes(guard3, 0, 0)
    SetPedAsEnemy(guard3,true)
    SetPedMaxHealth(guard3, 900)
    SetPedAlertness(guard3, 3)
    SetPedCombatRange(guard3, 0)
    SetPedCombatMovement(guard3, 3)
    TaskCombatPed(guard3, GetPlayerPed(-1), 0,16)
    TaskLeaveVehicle(guard3, vehicle, 0)
    GiveWeaponToPed(guard3, GetHashKey("WEAPON_SMG"), 5000, true, true)
    SetPedRelationshipGroupHash( guard3, GetHashKey("HATES_PLAYER"))
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
