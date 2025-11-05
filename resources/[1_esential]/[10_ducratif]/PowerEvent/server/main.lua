--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports['es_extended']:getSharedObject()

-- Charger la langue en fonction de la configuration
----print(Config.fr.langage_actuel)


if Config.langage.choix == "fr" then
    Lang = Config.fr
    --print(Lang.langage_actuel)
elseif Config.langage.choix == "en" then
    Lang = Config.en
    --print(Lang.langage_actuel)
else
    Lang = Config.fr
    --print("[LANG] Langue par défaut chargée : FR")
end

local activeGroups = {}


---------------------------------------------------------------------
------------Ajout des logs dans le fichier-----------
---------------------------------------------------------------------
function WriteLog(message)
    local date = os.date('%Y-%m-%d')
    local time = os.date('%H:%M:%S')

    local logLine = ("[%s] %s\n"):format(time, message)

    local resourcePath = GetResourcePath(GetCurrentResourceName())
    local logDir = resourcePath .. "/logs"
    local logPath = ("%s/%s.log"):format(logDir, date)

    os.execute("mkdir -p \"" .. logDir .. "\"")

    local file, err = io.open(logPath, "a")
    if not file then
        --print(Lang.log_erreur .. ":" .. logPath .. " (" .. tostring(err) .. ")")
        return
    end

    file:write(logLine)
    file:close()
end




---------------------------------------------------------------------------------------------------------------------
------------Détecter quand un joueur quitte la zone du groupe sans avoir tué tous les PNJ-----------
---------------------------------------------------------------------------------------------------------------------
function CheckPlayersInZone(groupName)
    local group = activeGroups[groupName]
    if not group then return end

    group.playersInvolved = group.playersInvolved or {}
    group.hasEnteredZone = group.hasEnteredZone or {}

    local playersStillInZone = {}

    for playerId, _ in pairs(group.playersInvolved) do
        local playerPed = GetPlayerPed(tonumber(playerId))
        if not DoesEntityExist(playerPed) then
            goto continue
        end

        local playerPos = GetEntityCoords(playerPed)
        local distance = #(playerPos - group.position)

        --print((Lang.CheckPlayersInZone):format(playerId, distance, groupName))

        if distance <= Config.Distance then
            playersStillInZone[tostring(playerId)] = true
                
            if not group.hasEnteredZone[playerId] then
                group.hasEnteredZone[playerId] = true
            
                -- Notification unique à l'entrée dans la zone
                TriggerClientEvent('ox_lib:notify', tonumber(playerId), {
                    title = Lang.enter_zone,
                    description = Lang.enter_zone1,
                    type = 'error',
                    duration = 10000
                })
            end


        else
            if group.hasEnteredZone[playerId] then
                TriggerClientEvent('ox_lib:notify', tonumber(playerId), {
                    title = Lang.Sortie_de_zone,
                    description = Lang.Sortie_de_zone1,
                    type = 'error',
                    duration = 10000
                })
            end
        end

        ::continue::
    end

    -- 🔄 Mise à jour
    group.playersStillInZone = playersStillInZone

    -- ❌ Si plus personne dans la zone
    if next(playersStillInZone) == nil then
        group.etat = "cooldown"
        group.cadeaux = false
        WriteLog("[COOLDOWN] Tous les joueurs ont quitté le groupe : " .. groupName)
        TriggerEvent("groupepnj:resetGroup", groupName)
    end
end

---------------------------------------------------------------------
------------Gérer le cooldown dynamique entre les respawns-----------
---------------------------------------------------------------------
function manageRespawnCooldown(groupName)
    local group = activeGroups[groupName]
    
    if group and group.etat == "cooldown" then
        local delay = Config.Groups[groupName].spawnTime * 60 * 1000 -- temps de respawn en ms
        --print((Lang.cooldown):format(groupName, delay / 60000))
        WriteLog(("[COOLDOWN] Groupe %s en cooldown pour %.2f minutes"):format(groupName, delay / 60000))

        -- Attendre le délai avant de réinitialiser le groupe
        Wait(delay)

        -- Une fois le cooldown écoulé, réinitialiser le groupe
        activeGroups[groupName] = nil
        --print((Lang.cooldown1):format(groupName))
        WriteLog(("[READY] Groupe %s prêt pour un nouveau spawn."):format(groupName))
    end
end

---------------------------------------------------------------------
------------SYSTEME PRINCIPAL----------- 
---------------------------------------------------------------------
CreateThread(function()
    while true do
        for groupName, data in pairs(Config.Groups) do
            local group = activeGroups[groupName]

            if group and group.etat == "cooldown" then
                --print(Lang.system_principal .. groupName .. Lang.system_principals)
                WriteLog("[Serveur] Le groupe '" .. groupName .. "' est en cooldown.")
                --Envoie du blip
                TriggerClientEvent('groupepnj:updateBlip', -1, groupName, Config.Groups[groupName].position, "cooldown")
                goto continue_group
            end

            if not group or group.etat == "mort" then
                if not data or not data.position or not data.pnj or not data.pnj.count then
                    --print(Lang.system_principal1 .. " : " .. groupName)
                    WriteLog("[ERREUR] Données manquantes pour le groupe : " .. groupName)
                    goto continue_group
                end

                --Envoie du blips:
                TriggerClientEvent('groupepnj:updateBlip', -1, groupName, data.position, "disponible")

                local players = GetPlayers()
                local spawnedForSomeone = false

                local closestPlayer = nil
                local closestDistance = 99999

                for _, playerId in ipairs(players) do
                    local playerPed = GetPlayerPed(tonumber(playerId) or -1)
                    if not playerPed or playerPed == 0 then goto continue end
                
                    local playerPos = GetEntityCoords(playerPed)
                    local distance = #(playerPos - data.position)
                
                    --print((Lang.inforamtion_distance):format(playerId, distance, groupName))
                    WriteLog(("[CHECK] Joueur %s est à %.2f mètres du groupe %s"):format(playerId, distance, groupName))
                TriggerClientEvent('groupepnj:updateBlip', -1, groupName, Config.Groups[groupName].position, "disponible")
                    if distance <= Config.Distance and distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = tonumber(playerId)
                    end
                
                    ::continue::
                end

                if closestPlayer then
                    --print((Lang.system_principal2):format(groupName))
                    WriteLog(("[SPAWN] Groupe demandé pour spawn : %s"):format(groupName))
                    TriggerClientEvent("groupepnj:spawn", closestPlayer, groupName, data)
                    spawnedForSomeone = true
                    --Envoie du blip
                    TriggerClientEvent('groupepnj:updateBlip', -1, groupName, data.position, "en_cours")
                end


                if not spawnedForSomeone then
                    goto continue_group
                end

                -- Détermination des joueurs impliqués
                local involved = {}
                for _, playerId in ipairs(players) do
                    local playerPed = GetPlayerPed(tonumber(playerId) or -1)
                    if playerPed and playerPed ~= 0 then
                        local playerPos = GetEntityCoords(playerPed)
                        local distance = #(playerPos - data.position)
                        if distance <= Config.Distance then
                            involved[tonumber(playerId)] = true
                        end
                    end
                end

                activeGroups[groupName] = {
                    etat = "en_attente",
                    playersInvolved = involved,
                    rewarded = false,
                    count = data.pnj.count,
                    joueursDansZone = {},
                    playersStillInZone = {},
                    participants = {}, -- 👈 liste des joueurs ayant tué un PNJ
                    position = data.position,
                    cadeaux = true
                }

            elseif group.etat == "actif" then
                --print((Lang.system_principal3):format(groupName, group.count))
                WriteLog(("[ACTIF] Groupe %s encore actif, PNJ restants : %d"):format(groupName, group.count))
                CheckPlayersInZone(groupName)
            end

            ::continue_group::
        end
        Wait(10 * 1000)
    end
end)



---------------------------------------------------------------------------------------------------------
------------EVITE QUE LE GROUPE DE LA MEME PUISSANCE SPAWN AVANT LA MORT DE L'ANCIENNE-----------
---------------------------------------------------------------------------------------------------------
RegisterNetEvent("groupepnj:resetGroup")
AddEventHandler("groupepnj:resetGroup", function(groupName)
    local group = activeGroups[groupName]
    if not group then
        --print(Lang.resetGroup, groupName, Lang.resetGroups)
        return
    end

    -- ❗ Marque le groupe comme en cooldown
    group.etat = "cooldown"
    --print((Lang.resetGroup_cooldown):format(groupName, Config.Groups[groupName].spawnTime))
    WriteLog(("[COOLDOWN] Groupe %s en cooldown pendant %.2f minutes"):format(groupName, Config.Groups[groupName].spawnTime))

    -- Lance le thread de délai
    CreateThread(function()
        activeGroups[groupName].joueursDansZone = {}
        activeGroups[groupName].participants = {}

        Wait(Config.Groups[groupName].spawnTime * 60 * 1000) -- minutes en ms

        -- ❗ NE PAS supprimer le groupe, mais réinitialiser son état
        if activeGroups[groupName] then
            activeGroups[groupName].etat = 'mort'
            --print((Lang.resetGroup_spawn):format(groupName))
            WriteLog(("[READY] Groupe %s peut à nouveau être spawné."):format(groupName))
            --Envoie du blip
            TriggerClientEvent('groupepnj:updateBlip', -1, groupName, Config.Groups[groupName].position, "disponible")
        end
    end)
end)






---------------------------------------------------------------------
------------CONFIRMATION DU GROUPE AVANT RESPAWN-----------
---------------------------------------------------------------------
RegisterNetEvent("groupepnj:confirmSpawn", function(groupName)
    local group = activeGroups[groupName]
    if group and group.etat == "en_attente" then
        group.etat = "actif" -- ✅ Nécessaire pour CheckPlayersInZone
        --print((Lang.confirmSpawn):format(groupName))
        WriteLog(("[CONFIRMATION] Le groupe %s est maintenant ACTIF (confirmation client)"):format(groupName))
        
        -- ✅ Notification à tous les joueurs (ou adapte pour un groupe ciblé si besoin)
        TriggerClientEvent('ox_lib:notify', -1, {
            title = Lang.notification_spawn,
            description = (Lang.notification_spawn1):format(groupName),
            type = "inform"
        })

    end
end)




---------------------------------------------------------------------
------------START SPAWN GROUPE-----------
---------------------------------------------------------------------
function SpawnGroup(name, data)
    -- Bloc un second spawn si un joueur arriver alors qu'un autre l'a déjà fait.
    if activeGroups[name] and (activeGroups[name].etat == "actif" or activeGroups[name].etat == "en_attente") then
        --print(Lang.SpawnGroup .. " : " .. name)
        return
    end

    --print(Lang.SpawnGroup1 .. " :", name)
    WriteLog("[Serveur] Spawn du groupe :", name)
    TriggerClientEvent("groupepnj:spawn", -1, name, data)
    return
end


---------------------------------------------------------------------
------------PNJ MORT-----------
---------------------------------------------------------------------
RegisterNetEvent("groupepnj:pnjMort")
AddEventHandler("groupepnj:pnjMort", function(group)
    local src = source
    local groupData = activeGroups[group]
                      

    if not groupData then
        --print(Lang.pnjMort, group, Lang.pnjMort1)
        WriteLog("[SERVER] Le groupe " .. group .. " n'existe pas ou a déjà été supprimé.")
        return
    end

    if not groupData.participants[src] then
        groupData.participants[src] = true
        --print((Lang.pnjMort2):format(src, group))
    end

    -- Ajouter le joueur dans les impliqués même s'il arrive après le début
    if not groupData.playersInvolved[src] then
        groupData.playersInvolved[src] = true
        --print(Lang.pnjMort3, src, Lang.pnjMort4)
        WriteLog("[INFO] Le joueur " .. src .. " a été ajouté à la liste des participants.")
    end

    --print(Lang.pnjMort5, group)
    WriteLog("[SERVER] PNJ BIEN MORT pour le groupe : " .. group)
    
    groupData.count = (groupData.count or Config.Groups[group].pnj.count) - 1

    --print((Lang.pnjMort6):format(group, groupData.count))
    WriteLog(("[MORT] PNJ restants pour le groupe %s : %d"):format(group, groupData.count))

    local remaining = groupData.count or 0
    TriggerClientEvent('ox_lib:notify', src, {
        title = Lang.pnjMort7,
        description = Lang.pnjMort8 .. ' : ' .. remaining,
        type = 'error',
        duration = 8000
    })
    

    if groupData.count <= 0 and not groupData.rewarded then
        groupData.rewarded = true
        groupData.etat = "mort"
        
        local rewardedCount = 0
        
        -- SYSTEM REWARD DE BASE (utilise les joueurs ayant tué au moins un PNJ)
        for playerId, _ in pairs(groupData.participants) do  -- Utiliser groupData.participants ici
            if groupData.playersStillInZone then
                for playerId, _ in pairs(groupData.participants) do
                    if groupData.playersStillInZone[tostring(playerId)] then
                        RewardPlayer(group, tonumber(playerId))
                        rewardedCount = rewardedCount + 1
                    end
                end
            else
                --print((Lang.pnjMort9):format(group))
                WriteLog(("[ERREUR] playersStillInZone est nil pour le groupe %s"):format(group))
            end

        end

        if groupData.count <= 0 and not groupData.rewarded then
            --print(Lang.pnjMort10 .. group .. Lang.pnjMorts10)
            WriteLog("[REWARD] Tous les PNJ du groupe " .. group .. " sont morts, distribution des récompenses.")
            TriggerEvent("groupepnj:rewardAll", group)
        end


        --print((Lang.pnjMort11):format(rewardedCount))
        WriteLog(("[REWARD] Récompenses envoyées à %d joueur(s) dans la zone."):format(rewardedCount))

        TriggerEvent("groupepnj:resetGroup", group)
    end
end)



----------------------------------------------------------------------------------------------
------------🔍 Fonction pour logger la récompense de chaque joueur dans un fichier-----------
----------------------------------------------------------------------------------------------
function LogReward(group, playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if not xPlayer then return end

    local logLine = string.format(
        Lang.LogReward,
        os.date("%Y-%m-%d %H:%M:%S"),
        group,
        xPlayer.getName(),
        xPlayer.getIdentifier(),
        playerId
    )

    local file = io.open("reward_logs.txt", "a")
    if file then
        file:write(logLine)
        file:close()
    else
        return
        ----print("[ERREUR] Impossible d'écrire dans reward_logs.txt")
    end
end


---------------------------------------------------------------------
------------REWARD PLAYER-----------
---------------------------------------------------------------------

function RewardPlayer(group, player)

    if activeGroups[group] and activeGroups[group].cadeaux == false then
    TriggerClientEvent('ox_lib:notify', player, {
        title = Lang.RewardPlayer,
        description = Lang.RewardPlayer1,
        type = 'error',
        duration = 10000
    })
    return
end

    --print(Lang.RewardPlayer2, player)
    WriteLog("[REWARD] function RewardPlayer lancée pour joueur ID :", player)
    local data = Config.Groups[group]
    local items = {}

    if not data then
        --print(Lang.RewardPlayer3, group)
        WriteLog("[ERREUR] Données de récompense introuvables pour le groupe : " .. tostring(group))
        return
    end

    for rarity, info in pairs(data.items) do
        if math.random(1, 100) <= info.chance then
            local itemList = Config.ItemList[rarity]
            if itemList and #itemList > 0 then
                table.insert(items, itemList[math.random(#itemList)])
            end
        end
    end

    -- Bonus item (20% de chance)
    if math.random(1, 100) <= 20 then
        for rarity, info in pairs(data.items) do
            if math.random(1, 100) <= info.chance then
                local itemList = Config.ItemList[rarity]
                if itemList and #itemList > 0 then
                    table.insert(items, itemList[math.random(#itemList)])
                    break
                end
            end
        end
    end

    local xPlayer = ESX.GetPlayerFromId(player)
    if not xPlayer then
        --print(Lang.RewardPlayer4, player)
        WriteLog("[ERREUR] Impossible de trouver le joueur ESX avec l’ID :", player)
        return
    end

    --Envoie de la récompense au joueur
    for _, item in ipairs(items) do
        local minMax = Config.Groups[group].ItemValeur[item]
        local amount = 1

        if minMax then
            local min = tonumber(minMax[1]) or 1
            local max = tonumber(minMax[2]) or min
            amount = math.random(min, max)
        end

        xPlayer.addInventoryItem(item, amount)
        --print((Lang.RewardPlayer5):format(item, GetPlayerName(player)))
        WriteLog(('[GIVE] %s x%s donné à %s'):format(item, amount, GetPlayerName(player)))

        TriggerClientEvent('ox_lib:notify', player, {
            title = Lang.RewardPlayer6,
            description = (Lang.RewardPlayer7):format(item .. " x" .. amount),
            type = 'success',
            duration = 10000
        })
    end


    --for _, item in ipairs(items) do
    --    xPlayer.addInventoryItem(item, 1)
    --    ----print(('[DEBUG] Don de l’item %s au joueur %s'):format(item, GetPlayerName(player)))
    --    --print((Lang.RewardPlayer5):format(item, GetPlayerName(player)))
    --    WriteLog(('[GIVE] %s donné à %s'):format(item, GetPlayerName(player)))
--
    --    TriggerClientEvent('ox_lib:notify', player, {
    --        title = Lang.RewardPlayer6,
    --        description = (Lang.RewardPlayer7):format(item),
    --        type = 'success',
    --        duration = 10000 -- 10 secondes
    --    })
--
    --end
end

---------------------------------------------------------------------
------------PLAYER IN ZONE-----------
---------------------------------------------------------------------

RegisterNetEvent("groupepnj:rewardAll")
AddEventHandler("groupepnj:rewardAll", function(group)
    local groupData = activeGroups[group]
    if not groupData or groupData.rewarded then return end

    groupData.rewarded = true
    local stillInZone = groupData.playersStillInZone or {}

    for playerIdStr, _ in pairs(groupData.playersInvolved) do
        local playerId = tonumber(playerIdStr)

        if stillInZone[tostring(playerId)] then
            RewardPlayer(group, playerId)
        else
            -- Le joueur a quitté la zone → pas de récompense
            TriggerClientEvent('ox_lib:notify', playerId, {
                title = Lang.rewardAll,
                description = Lang.rewardAll1,
                type = 'error',
                duration = 10000
            })
            WriteLog("[REWARD] Récompense annulée pour le joueur ID " .. playerId)
        end
    end
end)





-- Version locale
local localVersion = "1.0.0"
local repoURL = "https://raw.githubusercontent.com/Ducratif/script_fivem/refs/heads/main/ducratif_pnjgroup/version.txt"

CreateThread(function()
    PerformHttpRequest(repoURL, function(code, data, headers)
        if code == 200 and data then
            local remoteVersion = data:gsub("%s+", "") -- Nettoyage du contenu
            if localVersion ~= remoteVersion then
                print("^3[ALERTE VERSION]^0 Une nouvelle version du script est disponible !")
                print("Version actuelle : ^1" .. localVersion .. "^0 | Version disponible : ^2" .. remoteVersion .. "^0")
                print("Télécharge la nouvelle version ici: https://discord.gg/kpD8pQBBWm")
            else
                print("^2[VERSION OK]^0 Le script est à jour (version " .. localVersion .. ")")
            end
        else
            print("^1[ERREUR]^0 Impossible de vérifier la version du script (Code HTTP: " .. tostring(code) .. ")")
        end
    end, "GET", "", {["Content-Type"] = "text/plain"})
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
