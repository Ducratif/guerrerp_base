--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()
local pets = {}
loadingAttemps = false
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    Wait(1200)
    TriggerEvent('lab-pet:server:getPeds')
  
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    if json.encode(pets) ~= "[]" then
        for k, v in pairs(pets) do
            DeleteEntity(NetworkGetEntityFromNetworkId(k))
        end
    end
end)





--Threads
CreateThread(function() -- Açlıkların güncellendiği yer.
    while true do
        if loadingAttemps then
            TriggerEvent('lab-pet:server:uptadePetsNeeds', pets)
            Wait(PET.UpdateInterval * 10000)
        else
            Wait(0)
        end
    end
end)
CreateThread(function() -- XP lerin kazandığı kısım
    while true do
        if loadingAttemps then
            TriggerEvent('lab-pet:server:earnXP', pets)
            Wait(PET.UpdateInterval * 10000)
        else
            Wait(0)
        end
    end
end)
CreateThread(function() -- Health Animasyonları tetiklenmesi, Eğer ki sağlıkları bittiyse otomatik olarak ölü animasyonuna sokacak
    while true do
        if loadingAttemps then
            if json.encode(pets) ~= "[]" then
                for k,v in pairs(pets) do
                    if pets[k].dead ~= nil then
                        if pets[k].dead then
                            TriggerEvent('lab-pet:server:checkDeaths',k)
                        end
                    end
                end
            end
        end
        Wait(500)
    end
end)


-- Callback
RegisterNetEvent('lab-pet:server:getPeds', function() -- Sunucuya ilk giriş ya da sunucu ilk load'da kullaıcak
    local result = ExecuteSql("SELECT * FROM `lab_pet` ORDER BY `id` ASC")
    totalPet = 0
    for i= 1, #result do
        TriggerEvent('lab-pet:client:startingSpawner', result[i])
        Wait(500)
        totalPet = totalPet + 1
    end
    TriggerClientEvent('lab-pet:client:loadingAttemps', -1)
    loadingAttemps = true
    Wait(1200)
    TriggerClientEvent('lab-pet:client:petLongerNeeded', -1)
    print('^2 -- [Ducratif-Animalerie] Animaux spawn ! Nombre : ',totalPet,'-- ')
end)


RegisterNetEvent('lab-pet:client:startingSpawner', function(v)
    local petPosition = json.decode(v.petPosition)
    local pedHash = GetHashKey(v.petHash)
    local animalPet = CreatePed(9, pedHash, petPosition.x, petPosition.y, petPosition.z, 50.0, true, true)
    local pedEntityID =  NetworkGetNetworkIdFromEntity(animalPet)
    if PET.debugMode then
        print('^2 -- [Ducratif-Animalerie] Animal spawned, ID de l\'animal ID => : ',pedEntityID,animalPet, pedHash,'-- ')
    end

    -- SetPedComponentVariation(v.pet)
    if v.petHash ~= "a_c_pug" then
        SetPedComponentVariation(animalPet, 0 , 0, v.petTexureID, 2) -- body Renk
    else
        SetPedComponentVariation(animalPet, 4 , 0, v.petTexureID, 2) -- 3(torso)   |  Rengi değiştiriyor
    end
    if v.petLeash then
        SetPedComponentVariation(animalPet, 3 , 0, v.petLeashID, 2) -- 3(torso)   |  Tasma değiştiriyor

    end

    if PET.debugMode then
        print('::STARTING SPAWNER:: =>', pedEntityID, v.netID,v.petName, petPosition.x, petPosition.y, petPosition.z)
    end  
    TriggerEvent('lab-pet:server:updateNetID', pedEntityID, v.netID, animalPet)
   
    pets[pedEntityID] = v
    pets[pedEntityID].netID = pedEntityID
    pets[pedEntityID].followThePlayer = false
    pets[pedEntityID].rope = false
    pets[pedEntityID].vehicleSeat = false
end)

-- Events

RegisterNetEvent('lab-pet:server:buyPet', function(data)
    local src = source
    local ply = ESX.GetPlayerFromId(src)
    if ply.getAccount("money").money > tonumber(data.petPrice) then
        ply.removeMoney(tonumber(data.petPrice))
        pedHash = GetHashKey(data.pedHash)
        plCoords = GetEntityCoords(GetPlayerPed(src))
        herPed = CreatePed(9, pedHash, plCoords.x, plCoords.y, plCoords.z, 50.0, true, true)
        pedEntityID =  NetworkGetNetworkIdFromEntity(herPed)
        pets[pedEntityID] = data
        pets[pedEntityID].netID = pedEntityID
        pets[pedEntityID].followThePlayer = false
        pets[pedEntityID].rope = false
        pets[pedEntityID].vehicleSeat = false
        pets[pedEntityID].petOwner = ply.getIdentifier()
        ExecuteSql("INSERT INTO `lab_pet` (`netID`, `petHash`, `petTexureID`, `petLeash`, `petLeashID`, `petOwner`,`petGender`,`petName`,`petLabel`,`hungryDecrase`,`petHungryLevel`,`thirstDecrase`,`petThirstLevel`,`petEnergyLevel`,`petHealthLevel`,`petXP`,`lastXP`,`petLevel`,`petPosition`, `listOf`) VALUES ('"..pedEntityID.."','"..data.pedHash.."','"..data.petTexureID.."',false,0,'"..ply.getIdentifier().."','"..data.petGender.."','"..data.petName.."','"..data.petLabel.."','"..data.hungryDecrase.."','"..data.petHungryLevel.."','"..data.thirstDecrase.."','"..data.petThirstLevel.."','"..data.petEnergyLevel.."','"..data.petHealthLevel.."',0,100,'"..data.petLevel.."','"..json.encode(plCoords).."', '"..data.animalList.."')")
        TriggerClientEvent('lab-pet:client:uptadePets', -1,pedEntityID, data)
    else
        TriggerClientEvent('lab-pet:client:sendNotify', src, Locales.EnoughMoney)
    end
    TriggerClientEvent('lab-pet:client:petLongerNeeded', -1)
end)

RegisterNetEvent('lab-pet:server:updateNetID', function(newID, oldID)
    if PET.debugMode then
        print('::UPDATING NETWORKID::', '| OLD => ', oldID, '| NEW => ',newID)
    end
    ExecuteSql("UPDATE `lab_pet` SET `netID` = '"..newID.."' WHERE `netID` = '"..oldID.."'")
    Wait(400)
end)

RegisterNetEvent('lab-pet:server:changeVariable', function(netID, data, variable)
    if variable == "img" then
        pets[netID].petIMG = data
        ExecuteSql("UPDATE `lab_pet` SET `petIMG` = '"..data.."' WHERE `netID` = '"..netID.."'") 
    end
    if variable == "name" then
        pets[netID].petName = data
        ExecuteSql("UPDATE `lab_pet` SET `petName` = '"..data.."' WHERE `netID` = '"..netID.."'") 
    end
end)



RegisterNetEvent('lab-pet:server:earnXP', function(Pets)
    if Pets ~= nil then
        for k ,v in pairs(Pets) do    
            if not pets[k].dead then
                pets[k].petXP = pets[k].petXP + PET.earnXPAmount
                if tonumber(pets[k].petXP) >= tonumber(pets[k].lastXP) then
                    currentlevel = pets[k].lastXP
                    pets[k].lastXP = math.ceil( 100 + (currentlevel * ((PET.LevelingDifficulty + 100) * 0.01)) )
                    pets[k].petLevel = pets[k].petLevel + 1
                    if ESX.GetPlayerFromIdentifier(pets[k].petOwner) then
                        TriggerClientEvent('lab-pet:client:sendNotify', ESX.GetPlayerFromIdentifier(pets[k].petOwner), Locales.levelUP..""..pets[k].petName, pets[k].petLevel, "levelupping",k)
                    end
                end    
                if PET.debugMode then
                    print('::UPDATING PETS XP::   ','| NETID => ', k, '| XP => ', pets[k].petXP, '| LEVEL => ',pets[k].petLevel)
                end  
                ExecuteSql("UPDATE `lab_pet` SET `petXP` = '"..pets[k].petXP.."' , `petLevel` = '"..pets[k].petLevel.."', `lastXP` = '"..pets[k].lastXP.."' WHERE `netID` = '"..k.."'")
                TriggerClientEvent('lab-pet:client:uptadePets', -1, k,v)   
            end
        end
    end
end)

RegisterNetEvent('lab-pet:server:uptadePetsNeeds', function(Pets)
    if Pets ~= nil then
        for k ,v in pairs(Pets) do
            local petCoords = GetEntityCoords(NetworkGetEntityFromNetworkId(k))
            v.petHungryLevel = v.petHungryLevel - v.hungryDecrase
            v.petThirstLevel = v.petThirstLevel - v.thirstDecrase
            petHealth = v.petHealthLevel
            if v.petHungryLevel <= 0 then
                v.petHungryLevel = 0
                if v.petHealthLevel <= 0 then
                    v.petHealthLevel = 0
                else
                    v.petHealthLevel = petHealth - PET.lossOfLife_hungry
                end
            end
            if v.petThirstLevel <= 0 then
                v.petThirstLevel = 0
                if v.petHealthLevel <= 0 then
                    v.petHealthLevel = 0
                else
                    v.petHealthLevel = petHealth - PET.lossOfLife_thirst
                end
            end
            if PET.debugMode then
                print('::UPDATING PETS NEEDS::','| NETID => ', k, '| HUNGRY => ', v.petHungryLevel, '| THRIST => ',v.petThirstLevel, '| HEALTH => ',v.petHealthLevel, '| POSITION =>', petCoords)
            end  
            if tonumber(pets[k].petHealthLevel) <= 0 then
                pets[k].dead = true
            else
                pets[k].dead = false
                
            end
            ExecuteSql("UPDATE `lab_pet` SET `petHungryLevel` = '"..v.petHungryLevel.."' , `petThirstLevel` = '"..v.petThirstLevel.."', `petHealthLevel` = '"..v.petHealthLevel.."', `petPosition` = '"..json.encode(petCoords).."' WHERE `netID` = '"..k.."'")
            TriggerClientEvent('lab-pet:client:uptadePets', -1, k,v)
        end
    end
end)



RegisterNetEvent('lab-pet:server:DeletePet', function(petIndex, petValues)
    ExecuteSql("DELETE FROM lab_pet WHERE `netID` = '"..petIndex.."'")
end)

RegisterNetEvent('lab-pet:server:fill', function(netID, amount, type)
    if type == "heal" then
        pets[netID].petHealthLevel = amount
        ExecuteSql("UPDATE `lab_pet` SET `petHealthLevel` = '"..amount.."' WHERE `netID` = '"..netID.."'")
    end
    if type == "hungry" then
        pets[netID].petHungryLevel = amount
        ExecuteSql("UPDATE `lab_pet` SET `petHungryLevel` = '"..amount.."' WHERE `netID` = '"..netID.."'")
    end
    if type == "thirst" then
        pets[netID].petThirstLevel = amount
        ExecuteSql("UPDATE `lab_pet` SET `petThirstLevel` = '"..amount.."' WHERE `netID` = '"..netID.."'")
    end
end)

RegisterNetEvent('lab-pet:server:changeToBoolean', function(petNetworkID,boolName, status)
    -- print(boolName, pets[petNetworkID].boolName)
    if boolName == "followThePlayer" then
        pets[petNetworkID].followThePlayer = status
    elseif boolName == "rope" then
        pets[petNetworkID].rope = status
    elseif boolName == "vehicleSeat" then
        pets[petNetworkID].vehicleSeat = status
    end
end)

-- Rendre la balle au joueur (fix ESX vs QB)
RegisterNetEvent('lab-pet:server:returnBall', function()
    local src = source
    if useOx then
        exports.ox_inventory:AddItem(src, PET.petBallItem, 1)
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            --xPlayer.addInventoryItem(PET.petBallItem, 1)
            return;
        end
    end
end)


RegisterNetEvent('lab-pet:server:checkDeaths', function(animalNetworkID)
    if  pets[animalNetworkID].listOf == "dog" then
        SetAnimServer("creatures@rottweiler@move", "dead_right",NetworkGetEntityFromNetworkId(animalNetworkID))
    elseif  pets[animalNetworkID].listOf == "cat" then
        SetAnimServer("creatures@cat@move", "dead_right", NetworkGetEntityFromNetworkId(animalNetworkID))
    elseif  pets[animalNetworkID].listOf == "bird" then
        SetAnimServer("creatures@chickenhawk@move", "dying", NetworkGetEntityFromNetworkId(animalNetworkID))
    elseif  pets[animalNetworkID].listOf == "coguar" then
        SetAnimServer("creatures@chickenhawk@move", "dead_right",NetworkGetEntityFromNetworkId(animalNetworkID))
    end
    FreezeEntityPosition(NetworkGetEntityFromNetworkId(animalNetworkID), true)
    -- TriggerClientEvent('lab-pet:client:setDeathAnim', source, tonumber(animalNetworkID), pets[animalNetworkID].listOf)
end)



SetAnimServer = function(animName, animID, targetPed)
    TaskPlayAnim(targetPed, animName, animID, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
end


--  ITEMS (ESX usable; ox_inventory pour add/remove si présent)

local useOx = (GetResourceState('ox_inventory') == 'started')

-- helper: enregistre un consommable (nourrit/eau/soin) via ESX (compatible ox_inventory)
local function registerConsumable(itemName, amount, fillType)
    ESX.RegisterUsableItem(itemName, function(source)
        -- on applique côté client; la conso réelle est faite après succès
        TriggerClientEvent('lab-pet:client:useConsumable', source, amount, fillType, itemName, nil)
    end)
end

registerConsumable(PET.petHealFillItem,   PET.petHealFillAmount,   'heal')
registerConsumable(PET.petHungryFillItem, PET.petHungryFillAmount, 'hungry')
registerConsumable(PET.petThirstFillItem, PET.petThirstFillAmount, 'thirst')

-- Laisse (pas consommée)
ESX.RegisterUsableItem(PET.ropeItem, function(source)
    TriggerClientEvent('lab-pet:client:useRope', source)
end)

-- Balle (consommée au lancer, rendue si le chien la ramène)
ESX.RegisterUsableItem(PET.petBallItem, function(source)
    TriggerClientEvent('lab-pet:client:useTennisBall', source)
    if useOx then
        exports.ox_inventory:RemoveItem(source, PET.petBallItem, 1)
    else
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then xPlayer.removeInventoryItem(PET.petBallItem, 1) end
    end
end)

-- Consommation réelle d’un item après réussite côté client
RegisterNetEvent('lab-pet:server:consumeItem', function(itemName)
    local src = source
    if useOx then
        exports.ox_inventory:RemoveItem(src, itemName, 1)
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then xPlayer.removeInventoryItem(itemName, 1) end
    end
end)

-- Rendre la balle au joueur
RegisterNetEvent('lab-pet:server:returnBall', function()
    local src = source
    if useOx then
        exports.ox_inventory:AddItem(src, PET.petBallItem, 1)
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then xPlayer.addInventoryItem(PET.petBallItem, 1) end
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
