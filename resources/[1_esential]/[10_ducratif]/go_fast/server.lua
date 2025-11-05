--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

-- FILE: server.lua
ESX = exports['es_extended']:getSharedObject()

local startPNJ = nil
local deliveryPNJ = nil
local finalPNJ = nil
local indicePNJ = nil

local currentMissions = {}

-- Tableau pour suivre les missions et les derniers délais
local playerLastMissionTime = {}


--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
------------------------------------------------------------------
--ENVOIE DES POSITION AU CLIENT
------------------------------------------------------------------
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startPNJ = Config.StartPNJLocations[math.random(#Config.StartPNJLocations)]
        deliveryPNJ = Config.DeliveryPNJLocations[math.random(#Config.DeliveryPNJLocations)]
        finalPNJ = Config.FinalPNJLocations[math.random(#Config.FinalPNJLocations)]
        indicePNJ = Config.HelpPasswordPNJLocation[math.random(#Config.HelpPasswordPNJLocation)]

        print("GoFast PNJs position envoyée aux clients")
        TriggerClientEvent('goFast:spawnPNJs', -1, startPNJ, deliveryPNJ, finalPNJ, indicePNJ)

        --DEBUG
        --Citizen.CreateThread(function()
        --    Wait(999999000)
        --    TriggerEvent('onResourceStart', GetCurrentResourceName())
        --end)
        

    end
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
------------------------------------------------------------------
--ENVOIE DES PNJ SUR LA MAP
------------------------------------------------------------------
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startPNJ = Config.StartPNJLocations[math.random(#Config.StartPNJLocations)]
        deliveryPNJ = Config.DeliveryPNJLocations[math.random(#Config.DeliveryPNJLocations)]
        finalPNJ = Config.FinalPNJLocations[math.random(#Config.FinalPNJLocations)]
        indicePNJ = Config.HelpPasswordPNJLocation[math.random(#Config.HelpPasswordPNJLocation)]
        print("^2[GoFast]^0 PNJs position envoyée aux clients | SCRIPT BY Ducratif")
    else
        --print("^3[GoFast]^0 onResourceStart déclenché par une autre ressource :", resource)
            return
    end
end)


RegisterNetEvent('goFast:requestPNJSpawn', function()
    local src = source
    TriggerClientEvent('goFast:spawnPNJs', src, startPNJ, deliveryPNJ, finalPNJ, indicePNJ)
    print("PNJ envoyer sur la map | SCRIPT BY Ducratif")
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
----------------
--DEMANDE MDP
----------------
RegisterNetEvent('goFast:askPassword', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = currentMissions[src]

    if not data then return end

    -- Envoie au client l’UI pour taper le mot de passe
    TriggerClientEvent('goFast:receiveDelivery', src, data.password, deliveryPNJ)
end)


------------------------------------------------------------------
--VALIDATION DU MOT DE PASSE
------------------------------------------------------------------
RegisterNetEvent('goFast:validatePassword', function(password, stage)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local data = currentMissions[src]

    if not data or not data.password or data.stage ~= stage then return end

    if data.password ~= password then
        TriggerClientEvent('goFast:wrongPassword', src)
    else
        if stage == 2 then
            xPlayer.removeInventoryItem(data.item, 1)
            data.stage = 3
            TriggerClientEvent('goFast:goToFinalPNJ', src, finalPNJ)
        end
    end
end)

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--
------------------------------------------------------------------
--LANCEMENT DE LA MISSION
------------------------------------------------------------------
RegisterNetEvent('goFast:startMission', function(choice)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    -- Vérifie si le joueur a déjà terminé une mission récemment
    local lastMissionTime = playerLastMissionTime[src]
    local currentTime = os.time()
    
    if lastMissionTime and currentTime - lastMissionTime < 3600 then -- 3600 secondes = 1 heure
        -- Le joueur doit attendre encore
        local waitTime = 3600 - (currentTime - lastMissionTime)
        local minutesRemaining = math.ceil(waitTime / 60)
        
        TriggerClientEvent('goFast:showCooldown', src, minutesRemaining)
        return
    end

    --System de mot de passe
    local item = choice == 'money' and 'argentb' or choice == 'drug' and 'male_drogue' or 'boite_bijoux'
    --local password = GenerateRandomFrenchWord()
    
    local allPasswords = {}
    for k in pairs(Config.PasswordHintWords) do
        table.insert(allPasswords, k)
    end
    local selectedPassword = allPasswords[math.random(#allPasswords)]
    local hint = Config.PasswordHintWords[selectedPassword]

    currentMissions[src] = {
        stage = 2,
        item = item,
        password = selectedPassword,   -- ✅ ici c'est juste le mot
        passwordHint = hint,
        startTime = os.time()
    }

    --print("[GoFast] Mission créée pour", src, "Mot:", selectedPassword, "Indice:", hint)


    -- Ajout de l'heure de la mission en cours
    playerLastMissionTime[src] = os.time()

    --Ajoute l'item dans sont inventaire
    xPlayer.addInventoryItem(item, 1)

    -- Générer une position aléatoire autour du vrai PNJ dans un rayon de 100m
    local radius = 100.0
    local angle = math.random() * 2 * math.pi
    local offsetX = math.cos(angle) * radius
    local offsetY = math.sin(angle) * radius

    local hintCoords = {
        x = deliveryPNJ.x + offsetX,
        y = deliveryPNJ.y + offsetY,
        z = deliveryPNJ.z
    }

    -- Envoyer au client la zone d’indice
    TriggerClientEvent('goFast:setDeliveryHint', src, hintCoords)
    TriggerClientEvent('goFast:setRealDeliveryPNJ', src, deliveryPNJ)


end)


-- Serveur envoie l'indice au client quand il le demande
RegisterNetEvent('goFast:getPasswordHint', function()
    local src = source
    local data = currentMissions[src]

    if not data then
        --print("[GoFast] Le joueur n'a pas de mission en cours.")
        return
    end

    if not data.password then
        --DEBUG
        --print("[GoFast] Pas de mot de passe dans la mission du joueur.")
        return
    end

    --DEBUG
    --print("[GoFast] Envoi de l'indice au joueur :", src, "MDP: ", data.password, "Indice: ", data.passwordHint)

    -- Envoi de l'indice du mot de passe au client
    TriggerClientEvent('goFast:showPasswordHint', src, data.passwordHint)
end)


------------------------------------------------------------------
--FIN DE MISSION
------------------------------------------------------------------
RegisterNetEvent('goFast:completeFinalStep', function()
    local src = source
    local data = currentMissions[src]

    if not data then return end

    local timeTaken = os.time() - data.startTime
    local ratio = math.min(1.0, Config.FullRewardTime / timeTaken)
    local gain = math.floor(Config.Reward.min + (Config.Reward.max - Config.Reward.min) * ratio)

    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addAccountMoney('money', gain)

    TriggerClientEvent('goFast:missionSuccess', src, gain)
    currentMissions[src] = nil
end)

------------------------------------------------------------------
--GENERATION DE MOT DE PASSE
------------------------------------------------------------------
function GenerateRandomFrenchWord()
    --LES MOTS DOIVENT ÊTRE LES MEME QUE DANS LE FICHIER CONFIG!!!!!!!!!!!!!!!!!!!!!!!!
    local words = {'panthere', 'nuage', 'valise', 'carotte', 'telephone', 'lumiere', 'fusee', 'girafe', 'montagne', 'dragon'}
    return words[math.random(#words)]
end

--[[
    GO-FAST SCRIPT By Ducratif - ESX LEGACY + ox_lib + ox_inventory
]]--

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
