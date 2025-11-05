--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Variables globales
Core = nil
cooldowns = {}
playerJobData = {}

-- Thread d'initialisation du Core
Citizen.CreateThread(function()
    Core = GetCore()
end)
-- Thread de chargement des données de la base de données
Citizen.CreateThread(function()
    local results = ExecuteSql("SELECT * FROM `codem_busjob`")
    
    for i = 1, #results do
        local row = results[i]
        local playerData = {}
        
        -- Décoder les données JSON
        playerData.profiledata = json.decode(row.profiledata)
        playerData.historydata = json.decode(row.historydata)
        playerData.dailymission = json.decode(row.dailymission)
        
        -- Stocker les données du joueur
        if not playerJobData[row.identifier] then
            playerJobData[row.identifier] = playerData
        end
        playerJobData[row.identifier] = playerData
    end
end)
-- Gestionnaire d'événement pour la déconnexion des joueurs
AddEventHandler("playerDropped", function(reason)
    local playerId = source
    local identifier = GetIdentifier(playerId)
    
    -- Vérifier si le joueur a des données
    if not playerJobData[identifier] then
        return
    end
    
    -- Sauvegarder les données du joueur avant sa déconnexion
    savePlayerData(playerId)
end)
-- Thread d'enregistrement des callbacks
Citizen.CreateThread(function()
    -- Attendre que Core soit initialisé
    while Core == nil do
        Citizen.Wait(0)
    end
    
    -- Callback pour récupérer les données du joueur
    RegisterCallback("codem-busjob:getPlayerData", function(playerId, callback)
        local identifier = GetIdentifier(playerId)
        local existingData = playerJobData[identifier]
        
        if not existingData then
            -- Créer les premières données pour ce joueur
            firsData(playerId, function()
                local responseData = {
                    name = GetName(playerId),
                    allData = playerJobData[identifier]
                }
                
                -- Vérifier et mettre à jour les missions quotidiennes
                local dailyMissionData = checkTime(playerId)
                if dailyMissionData then
                    responseData.allData.dailymission = dailyMissionData
                end
                
                -- Calculer le classement
                calculateLeaderboard(playerId)
                callback(responseData)
            end)
        else
            -- Vérifier et mettre à jour les missions quotidiennes
            local dailyMissionData = checkTime(playerId)
            if dailyMissionData then
                playerJobData[identifier].dailymission = dailyMissionData
            end
            
            local responseData = {
                name = GetName(playerId),
                allData = playerJobData[identifier]
            }
            
            -- Calculer le classement
            calculateLeaderboard(playerId)
            callback(responseData)
        end
    end)
end)
-- Fonction pour calculer et envoyer le classement au joueur
function calculateLeaderboard(playerId)
    local levelGroups = {}
    
    -- Grouper les joueurs par niveau
    for identifier, playerData in pairs(playerJobData) do
        local profileData = playerData.profiledata
        if profileData.level then
            local level = profileData.level
            if not levelGroups[level] then
                levelGroups[level] = {}
            end
            
            table.insert(levelGroups[level], {
                name = profileData.name,
                avatar = profileData.avatar,
                xp = profileData.xp,
                level = profileData.level
            })
        end
    end
    
    -- Créer une liste des niveaux triés par ordre décroissant
    local sortedLevels = {}
    for level in pairs(levelGroups) do
        table.insert(sortedLevels, level)
    end
    table.sort(sortedLevels, function(a, b) return b < a end)
    
    -- Créer le classement final
    local leaderboard = {}
    for _, level in ipairs(sortedLevels) do
        -- Trier les joueurs du même niveau par XP décroissant
        table.sort(levelGroups[level], function(a, b)
            return a.xp > b.xp
        end)
        
        -- Ajouter tous les joueurs de ce niveau au classement
        for _, playerData in ipairs(levelGroups[level]) do
            table.insert(leaderboard, playerData)
        end
    end
    
    -- Limiter au top 50
    local top50 = {}
    for i = 1, math.min(50, #leaderboard) do
        top50[i] = leaderboard[i]
    end
    
    -- Envoyer le classement au client
    TriggerClientEvent("codem-busjob:top50", playerId, top50)
end
-- Fonction pour créer les premières données d'un nouveau joueur
function firsData(playerId, callback)
    local identifier = GetIdentifier(playerId)
    
    -- Créer la structure de données du joueur
    local newPlayerData = {
        identifier = identifier,
        historydata = {},
        profiledata = {
            xp = 0,
            level = 1,
            avatar = GetDiscordAvatar(playerId) or Config.ExampleProfilePicture,
            name = GetName(playerId),
            completejobs = 0,
            passenger = 0,
            totalearnings = 0,
            sincedate = os.date("%d.%m.%Y")
        },
        dailymission = {
            timestamp = os.time(),
            remainingtime = 24,
            transportpassenger = {
                complete = false,
                count = 0
            },
            completeoneroute = {
                complete = false,
                count = 0
            },
            earninoneroute = {
                complete = false,
                count = 0
            }
        }
    }
    
    -- Stocker les données en mémoire
    playerJobData[identifier] = newPlayerData
    
    -- Insérer dans la base de données
    ExecuteSql(
        "INSERT INTO codem_busjob (identifier, profiledata, historydata, dailymission) VALUES (:identifier, :profiledata, :historydata, :dailymission)",
        {
            identifier = identifier,
            profiledata = json.encode(newPlayerData.profiledata),
            historydata = json.encode(newPlayerData.historydata),
            dailymission = json.encode(newPlayerData.dailymission)
        }
    )
    
    -- Exécuter le callback
    callback()
end
-- Fonction pour sauvegarder les données d'un joueur
function savePlayerData(playerId)
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    -- Mettre à jour la base de données
    ExecuteSql(
        "UPDATE codem_busjob SET profiledata = :profiledata, historydata = :historydata, dailymission = :dailymission WHERE identifier = :identifier",
        {
            identifier = identifier,
            profiledata = json.encode(playerData.profiledata),
            historydata = json.encode(playerData.historydata),
            dailymission = json.encode(playerData.dailymission)
        }
    )
end
-- Événement serveur pour charger les données du joueur
RegisterServerEvent("codem-busjob:LoadData", function()
    local playerId = source
    loadPlayerBankData(playerId)
end)
-- Fonction pour charger les données bancaires du joueur
function loadPlayerBankData(playerId)
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        -- Créer les premières données si elles n'existent pas
        firsData(playerId, function()
            playerData = playerJobData[identifier]
        end)
    end
    
    -- Mettre à jour les données en mémoire
    playerJobData[identifier] = playerData
    
    -- Mettre à jour l'avatar et le nom
    local profileData = playerJobData[identifier].profiledata
    profileData.avatar = GetDiscordAvatar(playerId) or Config.ExampleProfilePicture
    profileData.name = GetName(playerId)
    
    -- Sauvegarder les modifications
    savePlayerData(playerId)
end
-- Fonction pour vérifier et réinitialiser le timestamp
function checkAndResetTimestamp(timestamp)
    local nextResetTime = timestamp + 86400 -- 24 heures en secondes
    local currentTime = os.time()
    local timeDifference = nextResetTime - currentTime
    local hoursRemaining = timeDifference / 3600
    local shouldReset = nextResetTime < currentTime
    
    return shouldReset, hoursRemaining
end
-- Fonction pour vérifier et gérer le temps des missions quotidiennes
function checkTime(playerId)
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    local dailyMission = playerData.dailymission
    local shouldReset, hoursRemaining = checkAndResetTimestamp(dailyMission.timestamp)
    
    if shouldReset then
        -- Réinitialiser les missions quotidiennes après 24h
        Citizen.Wait(500)
        
        dailyMission.timestamp = os.time()
        dailyMission.earninoneroute.count = 0
        dailyMission.earninoneroute.complete = false
        dailyMission.completeoneroute.count = 0
        dailyMission.completeoneroute.complete = false
        dailyMission.transportpassenger.count = 0
        dailyMission.transportpassenger.complete = false
        dailyMission.remainingtime = 24
        
        -- Sauvegarder les changements
        savePlayerData(playerId)
    else
        -- Mettre à jour le temps restant
        dailyMission.remainingtime = hoursRemaining
    end
    
    return dailyMission
end
-- Fonction pour ajouter de l'XP au joueur
function AddXPBusJob(playerId, xpAmount)
    if not xpAmount or xpAmount <= 0 then
        return
    end
    
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    local profileData = playerData.profiledata
    local currentXP = tonumber(profileData.xp)
    local xpToAdd = tonumber(xpAmount)
    
    -- Ajouter l'XP
    profileData.xp = currentXP + xpToAdd
    
    -- Vérifier si le joueur peut monter de niveau
    local newXP = tonumber(profileData.xp)
    local requiredXP = tonumber(Config.RequiredXP[profileData.level])
    
    if newXP >= requiredXP then
        local newLevel = tonumber(profileData.level) + 1
        profileData.level = newLevel
        profileData.xp = 0
    end
    
    -- Envoyer une notification au joueur
    Config.Notification(
        string.format(Config.NotificationText.newxp.text, xpAmount),
        Config.NotificationText.newxp.type,
        true,
        playerId
    )
end
-- Fonction pour définir l'XP du joueur
function SetXPBusJob(playerId, xpAmount)
    if not xpAmount or xpAmount <= 0 then
        return
    end
    
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    local profileData = playerData.profiledata
    profileData.xp = tonumber(xpAmount)
    
    -- Vérifier si le joueur peut monter de niveau
    local currentXP = tonumber(profileData.xp)
    local requiredXP = tonumber(Config.RequiredXP[profileData.level])
    
    if currentXP >= requiredXP then
        local newLevel = tonumber(profileData.level) + 1
        profileData.level = newLevel
        profileData.xp = 0
    end
end
-- Fonction pour ajouter un niveau au joueur
function AddLevelBusJob(playerId, levelAmount)
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    local profileData = playerData.profiledata
    profileData.level = levelAmount
    
    -- Vérifier si le niveau existe dans la configuration
    local requiredXP = Config.RequiredXP[profileData.level]
    if not requiredXP then
        -- Si le niveau n'existe pas, définir au niveau maximum
        local maxLevel = #Config.RequiredXP
        profileData.level = maxLevel
        profileData.xp = Config.RequiredXP[maxLevel]
    else
        profileData.xp = 0
    end
    
    -- Envoyer une notification au joueur
    Config.Notification(
        string.format(Config.NotificationText.newlevel.text, profileData.level),
        Config.NotificationText.newlevel.type,
        true,
        playerId
    )
end
-- Fonction pour retirer des niveaux au joueur
function RemoveLevelBusJob(playerId, levelAmount)
    local identifier = GetIdentifier(playerId)
    local playerData = playerJobData[identifier]
    
    if not playerData then
        return
    end
    
    local profileData = playerData.profiledata
    local currentLevel = tonumber(profileData.level)
    local newLevel = currentLevel - levelAmount
    
    -- S'assurer que le niveau ne descend pas en dessous de 1
    if newLevel <= 0 then
        profileData.level = 1
    else
        profileData.level = newLevel
    end
    
    -- Envoyer une notification au joueur
    Config.Notification(
        string.format(Config.NotificationText.newlevel.text, profileData.level),
        Config.NotificationText.newlevel.type,
        true,
        playerId
    )
    
    -- Réinitialiser l'XP
    profileData.xp = 0
end
-- Système Discord pour récupérer les avatars
local DiscordAPI = {
    Avatars = {}
}
local botToken = "Bot " .. bot_Token

-- Fonction pour effectuer des requêtes Discord
function DiscordRequest(method, endpoint, data)
    local response = nil
    
    PerformHttpRequest("https://discordapp.com/api/" .. endpoint, function(statusCode, responseData, headers)
        response = {
            data = responseData,
            code = statusCode,
            headers = headers
        }
    end, method, (#data > 0) and json.encode(data) or "", {
        ["Content-Type"] = "application/json",
        Authorization = botToken
    })
    
    -- Attendre la réponse
    while response == nil do
        Citizen.Wait(0)
    end
    
    return response
end
-- Fonction pour récupérer l'avatar Discord d'un joueur
function GetDiscordAvatar(playerId)
    local discordId = nil
    local avatarUrl = nil
    
    -- Récupérer l'ID Discord du joueur
    for _, identifier in ipairs(GetPlayerIdentifiers(playerId)) do
        if string.match(identifier, "discord:") then
            discordId = string.gsub(identifier, "discord:", "")
            break
        end
    end
    
    if discordId then
        -- Vérifier si l'avatar est déjà en cache
        if DiscordAPI.Avatars[discordId] == nil then
            local endpoint = string.format("users/%s", discordId)
            local response = DiscordRequest("GET", endpoint, {})
            
            if response.code == 200 then
                local userData = json.decode(response.data)
                if userData and userData.avatar then
                    -- Vérifier si c'est un avatar animé (GIF)
                    local firstChar = userData.avatar:sub(1, 1)
                    if firstChar then
                        local secondChar = userData.avatar:sub(2, 2)
                        if secondChar == "_" then
                            -- Avatar animé
                            avatarUrl = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. userData.avatar .. ".gif"
                        else
                            -- Avatar statique
                            avatarUrl = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. userData.avatar .. ".png"
                        end
                    end
                end
            end
            
            -- Mettre en cache l'avatar
            DiscordAPI.Avatars[discordId] = avatarUrl
        else
            -- Récupérer depuis le cache
            avatarUrl = DiscordAPI.Avatars[discordId]
        end
    end
    
    return avatarUrl
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
