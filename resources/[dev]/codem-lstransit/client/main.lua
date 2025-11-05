--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Variables globales
local timeCounter, currentStopIndex, busVehicleModel, currentRoute, busVehicle, plateNumber
local visitedStops, textUIOpen

-- Variables d'état du core et de l'UI
Core = nil
nuiLoaded = false
menuOpen = false

-- Compteurs et indices
timeCounter = 0
currentStopIndex = 1
busVehicleModel = nil
currentRoute = nil
busVehicle = nil
plateNumber = nil
loadedlocales = false
key = false

-- Données du travail de bus
busJobData = {
    startMission = false,
    missionComplete = false,
    busStopFinish = false,
    incomePrice = 0,
    deliverTheVehicle = false,
    bindirilenNpcSayisi = 0
}
-- Fonction pour envoyer des messages NUI
function NuiMessage(action, payload)
    while not nuiLoaded do
        Wait(0)
    end
    SendNUIMessage({
        action = action,
        payload = payload
    })
end
-- Callbacks NUI pour l'initialisation
RegisterNUICallback("loaded", function(data)
    nuiLoaded = true
end)

RegisterNUICallback("loadedlocales", function(data)
    loadedlocales = true
end)
-- Thread d'initialisation du Core et NUI
CreateThread(function()
    -- Attendre que le Core soit initialisé
    while Core == nil do
        Wait(0)
    end
    
    -- Attendre que NUI soit chargé
    while not nuiLoaded do
        if NetworkIsSessionStarted() then
            SendNUIMessage({
                action = "CHECK_NUI"
            })
        end
        Wait(2000)
    end
end)
-- Callback pour fermer le menu
RegisterNUICallback("closeMenu", function(data, cb)
    SetNuiFocus(false, false)
    menuOpen = false
    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(cam, true)
    ClearFocus()
    cb("ok")
end)
-- Thread d'initialisation des données de configuration
Citizen.CreateThread(function()
    -- Attendre que le Core soit initialisé
    while Core == nil do
        Citizen.Wait(0)
    end
    
    -- Attendre que NUI soit chargé
    while not nuiLoaded do
        Citizen.Wait(0)
    end
    
    -- Déclencher l'ouverture du trigger de configuration
    Config.OpenTrigger()
    
    -- Traiter les routes de bus et calculer les profits
    for _, route in pairs(Config.BusjobSettings.busRouteSettings) do
        local busStops = Config.BusjobSettings.busStops[route.name]
        route.stopName = {}
        route.busStopCount = 0
        route.Profit = 0
        
        if busStops then
            for _, stop in ipairs(busStops) do
                local streetName = findStreetName(stop.coords)
                route.busStopCount = route.busStopCount + 1
                route.Profit = route.Profit + (stop.npcPrice * stop.npcCount)
                table.insert(route.stopName, streetName)
            end
        end
    end
    
    -- Envoyer les données de configuration au NUI
    NuiMessage("configRoutes", Config.BusjobSettings.busRouteSettings)
    NuiMessage("configBusVehicle", Config.BusjobSettings.busJobVehicle)
    NuiMessage("requiredXp", Config.RequiredXP)
    NuiMessage("configCurrencyUnit", Config.CurrencyUnit)
    NuiMessage("configCategories", Config.BusjobSettings.categories)
    NuiMessage("configDailyMission", Config.BusjobSettings.dailyMission)
    NuiMessage("configlocales", Config.Locales)
end)
-- Fonction pour ouvrir le menu de bus
function openBusMenu()
    if not menuOpen and loadedlocales then
        CreateCamera()
        SetNuiFocus(true, true)
        menuOpen = true
        
        local playerData = TriggerCallback("codem-busjob:getPlayerData")
        NuiMessage("OPEN_MENU", {
            playerData = playerData
        })
    end
end
-- Fonction pour trouver le nom de rue à partir de coordonnées
function findStreetName(coords)
    local x, y, z = table.unpack(coords)
    local streetHash, crossingHash = GetStreetNameAtCoord(x, y, z)
    local streetName = GetStreetNameFromHashKey(streetHash)
    local crossingName = GetStreetNameFromHashKey(crossingHash)
    local zoneHash = tostring(GetNameOfZone(x, y, z))
    local zoneName = GetLabelText(zoneHash)
    
    if not zoneHash then
        zoneHash = "UNKNOWN"
    end
    
    if crossingName ~= nil and crossingName ~= "" then
        return streetName
    elseif streetName ~= nil and streetName ~= "" then
        return streetName
    else
        return zoneName
    end
end
-- Fonction pour faire apparaître un bus
function spawnBus(vehicleModel)
    local availableSpawns = {}
    busVehicleModel = vehicleModel
    
    -- Vérifier les points de spawn disponibles
    for _, spawnCoord in ipairs(Config.BusjobSettings.busSpawnCoords) do
        local spawnPos = vector4(spawnCoord.x, spawnCoord.y, spawnCoord.z, spawnCoord.w)
        local vehiclesInArea = CodemGetVehiclesInArea(spawnPos, 5.0)
        
        if next(vehiclesInArea) == nil then
            table.insert(availableSpawns, spawnPos)
        end
    end
    
    if #availableSpawns > 0 then
        -- Choisir un spawn aléatoire
        local randomSpawn = availableSpawns[math.random(#availableSpawns)]
        
        -- Charger le modèle du véhicule
        RequestModel(GetHashKey(busVehicleModel))
        while not HasModelLoaded(GetHashKey(busVehicleModel)) do
            Wait(0)
        end
        
        -- Créer le véhicule
        busVehicle = CreateVehicle(GetHashKey(busVehicleModel), randomSpawn, true, true)
        plateNumber = GetVehicleNumberPlateText(busVehicle)
        
        -- Configurer le véhicule
        Config.SetVehicleFuel(busVehicle, 100)
        
        -- Donner les clés si configuré
        if Config.Vehiclekey then
            Config.GiveVehicleKey(GetVehicleNumberPlateText(busVehicle), GetHashKey(busVehicleModel), busVehicle)
        end
        
        -- Téléporter le joueur dans le véhicule
        TaskWarpPedIntoVehicle(PlayerPedId(), busVehicle, -1)
        SetVehicleOnGroundProperly(busVehicle)
        
        -- Démarrer la mission
        busJobData.startMission = true
        startJob()
    else
        -- Aucun spawn disponible
        NuiMessage("CLOSE_MENU_JOB")
        Wait(250)
        Config.Notification(
            Config.NotificationText.notspawnvehicle.text,
            Config.NotificationText.notspawnvehicle.type,
            false
        )
    end
end
-- Fonction pour faire monter les NPC dans le bus
function NpcOtobuseBindir(stopData)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle and vehicle ~= 0 then
        local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)
        local availableSeats = {}
        
        -- Trouver les sièges disponibles
        for seatIndex = -1, maxPassengers - 1 do
            if IsVehicleSeatFree(vehicle, seatIndex) then
                table.insert(availableSeats, seatIndex)
            end
        end
        
        local maxNpcsToBoard = math.min(#stopData.npcList, #availableSeats)
        local boardedCount = 0
        
        -- Faire monter les NPC
        for _, npc in pairs(stopData.npcList) do
            if maxNpcsToBoard > boardedCount then
                local seatIndex = availableSeats[boardedCount + 1]
                
                ClearPedTasksImmediately(npc)
                FreezeEntityPosition(npc, false)
                TaskEnterVehicle(npc, vehicle, -1, seatIndex, 1.5, 1, 0)
                
                boardedCount = boardedCount + 1
                
                -- Mettre à jour l'argent du travail
                local currentMoney = TriggerCallback("codem-busjob:getJobMoney")
                if tonumber(currentMoney) ~= tonumber(busJobData.incomePrice) then
                    TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice, true)
                end
                
                busJobData.incomePrice = currentMoney
                busJobData.incomePrice = busJobData.incomePrice + stopData.npcPrice
                TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice)
                busJobData.bindirilenNpcSayisi = busJobData.bindirilenNpcSayisi + 1
            else
                break
            end
        end
        
        -- Notification
        Config.Notification(
            string.format(Config.NotificationText.passengerin.text, boardedCount),
            Config.NotificationText.passengerin.type,
            false
        )
        
        -- Supprimer le blip
        if stopData.blip then
            RemoveBlip(stopData.blip)
            stopData.blip = nil
        end
    end
end
-- Fonction pour faire descendre un nombre spécifique de NPC du bus
function NpcDurakOtobustenIndir(npcCount)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle and vehicle ~= 0 then
        local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)
        local passengersInVehicle = {}
        
        -- Trouver tous les passagers dans le véhicule
        for seatIndex = -1, maxPassengers - 1 do
            local ped = GetPedInVehicleSeat(vehicle, seatIndex)
            if ped and ped ~= 0 and ped ~= playerPed then
                table.insert(passengersInVehicle, ped)
            end
        end
        
        local exitedCount = 0
        if npcCount <= #passengersInVehicle then
            -- Faire descendre le nombre spécifié de passagers
            for i = 1, npcCount do
                local passenger = passengersInVehicle[i]
                TaskLeaveVehicle(passenger, vehicle, 0)
                SetEntityAsMissionEntity(passenger, false, true)
                SetEntityAsNoLongerNeeded(passenger)
                FreezeEntityPosition(passenger, false)
                exitedCount = exitedCount + 1
            end
            
            -- Notification
            Config.Notification(
                string.format(Config.NotificationText.passengerout.text, exitedCount),
                Config.NotificationText.passengerout.type,
                false
            )
        end
    end
end
-- Fonction pour faire descendre tous les NPC du bus
function NpcOtobustenIndir()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle and vehicle ~= 0 then
        local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)
        
        -- Faire descendre tous les passagers
        for seatIndex = -1, maxPassengers - 1 do
            local passenger = GetPedInVehicleSeat(vehicle, seatIndex)
            if passenger and passenger ~= 0 and passenger ~= playerPed then
                TaskLeaveVehicle(passenger, vehicle, 0)
                SetEntityAsMissionEntity(passenger, false, true)
                SetEntityAsNoLongerNeeded(passenger)
                FreezeEntityPosition(passenger, false)
            end
        end
    end
end
-- Fonction pour réinitialiser les données de mission
function resetJobData()
    busJobData.startMission = false
    busJobData.missionComplete = false
    busJobData.busStopFinish = false
    busJobData.deliverTheVehicle = false
    
    if busVehicle then
        if busVehicleModel then
            Config.RemoveVehiclekey(GetVehicleNumberPlateText(busVehicle), GetHashKey(busVehicleModel), busVehicle)
            DeleteEntity(busVehicle)
        end
    end
    
    timeCounter = 0
    busJobData.incomePrice = 0
    TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice)
    
    busVehicleModel = nil
    busVehicle = nil
    plateNumber = nil
    currentRoute = nil
    busJobData.bindirilenNpcSayisi = 0
    visitedStops = {}
    currentStopIndex = 1
    
    NuiMessage("OPEN_METERS", false)
end

-- Thread de surveillance du véhicule (si activé dans la config)
if Config.NoCarTypebool then
    Citizen.CreateThread(function()
        while true do
            local playerPed = PlayerPedId()
            local waitTime = 1500
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if busJobData.startMission then
                waitTime = 1000
                
                if IsPedInAnyVehicle(playerPed, false) then
                    local vehicleModel = GetEntityModel(vehicle)
                    local isValidBusModel = false
                    
                    -- Vérifier si le véhicule est un modèle de bus valide
                    for _, busModel in pairs(Config.BusjobSettings.busJobVehicle) do
                        if vehicleModel == GetHashKey(busModel.vehiclename) then
                            isValidBusModel = true
                            break
                        end
                    end
                    
                    if not isValidBusModel then
                        -- Le joueur n'est pas dans un bus valide
                        for _, route in pairs(Config.BusjobSettings.busRouteSettings) do
                            if route.name == currentRoute then
                                timeCounter = timeCounter + 1
                                local timeLimit = (route.time * 60) / Config.NoCarTime
                                
                                if tonumber(timeCounter) >= tonumber(timeLimit) then
                                    if busJobData.startMission then
                                        -- Nettoyer les blips
                                        local busStops = Config.BusjobSettings.busStops[currentRoute]
                                        for _, stop in ipairs(busStops) do
                                            if stop.blip then
                                                RemoveBlip(stop.blip)
                                            end
                                        end
                                        
                                        -- Faire descendre tous les NPC
                                        NpcOtobustenIndir()
                                        
                                        -- Réinitialiser les données de mission
                                        resetJobData()
                                        
                                        -- Notification
                                        Config.Notification(
                                            Config.NotificationText.nocar.text,
                                            Config.NotificationText.nocar.type,
                                            false
                                        )
                                    end
                                end
                            end
                        end
                    end
                else
                    -- Le joueur n'est dans aucun véhicule
                    for _, route in pairs(Config.BusjobSettings.busRouteSettings) do
                        if route.name == currentRoute then
                            timeCounter = timeCounter + 1
                            local timeLimit = (route.time * 60) / Config.NoCarTime
                            
                            if tonumber(timeCounter) >= tonumber(timeLimit) then
                                if busJobData.startMission then
                                    -- Nettoyer les blips
                                    local busStops = Config.BusjobSettings.busStops[currentRoute]
                                    for _, stop in ipairs(busStops) do
                                        if stop.blip then
                                            RemoveBlip(stop.blip)
                                        end
                                    end
                                    
                                    -- Faire descendre tous les NPC
                                    NpcOtobustenIndir()
                                    
                                    -- Réinitialiser les données de mission
                                    resetJobData()
                                    
                                    -- Notification
                                    Config.Notification(
                                        Config.NotificationText.nocar.text,
                                        Config.NotificationText.nocar.type,
                                        false
                                    )
                                end
                            end
                        end
                    end
                end
            end
            
            Citizen.Wait(waitTime)
        end
    end)
end
-- Initialisation des variables pour la mission
visitedStops = {}
textUIOpen = false

-- Fonction principale pour démarrer le travail de bus
function startJob()
    local busStops = Config.BusjobSettings.busStops[currentRoute]
    
    -- Créer les blips pour tous les arrêts
    for index, stop in ipairs(busStops) do
        if stop.blip then
            RemoveBlip(stop.blip)
        end
        stop.blip = AddBlipForCoord(stop.coords.x, stop.coords.y, stop.coords.z)
        SetBlipAttributes(stop.blip, index)
    end
    
    -- Mettre à jour le timer dans l'UI
    for _, route in pairs(Config.BusjobSettings.busRouteSettings) do
        if route.name == currentRoute then
            NuiMessage("UPDATE_TIMER", route.time)
            break
        end
    end
    
    -- Définir le premier arrêt comme destination
    local firstStop = busStops[currentStopIndex]
    local streetName = findStreetName(firstStop.coords)
    NuiMessage("STREET_NAME", streetName)
    SetNewWaypoint(firstStop.coords.x, firstStop.coords.y)
    NuiMessage("OPEN_METERS", true)
    
    -- Boucle principale de la mission
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local waitTime = 1500
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local showTextUI = false
        
        if busJobData.startMission then
            waitTime = 0
            local currentStop = busStops[currentStopIndex]
            
            -- Vérifier si cet arrêt n'a pas encore été visité
            if not visitedStops[currentStop.stopID] then
                local distanceToStop = #(playerCoords - currentStop.coords)
                
                if distanceToStop < 70 then
                    -- Faire apparaître les NPC si nécessaire
                    if #currentStop.npcList == 0 then
                        spawnBusStopNpc(currentStop)
                    end
                    
                    if distanceToStop < 15 then
                        if not currentStop.passengerPickedUp then
                            if IsControlJustPressed(0, 38) then -- Touche E
                                local vehiclePlate = GetVehicleNumberPlateText(vehicle)
                                local doorLockStatus = GetVehicleDoorLockStatus(vehicle)
                                local vehicleSpeed = GetEntitySpeed(vehicle)
                                
                                if vehicleSpeed > 0.2 then
                                    Config.Notification(
                                        Config.NotificationText.speedlimit.text,
                                        Config.NotificationText.speedlimit.type,
                                        false
                                    )
                                elseif doorLockStatus == 2 then
                                    Config.Notification(
                                        Config.NotificationText.lockvehicle.text,
                                        Config.NotificationText.lockvehicle.type,
                                        false
                                    )
                                else
                                    -- Vérifier si c'est le bon véhicule
                                    if vehiclePlate ~= nil and plateNumber ~= nil and vehiclePlate == plateNumber then
                                        FreezeEntityPosition(vehicle, true)
                                        NpcOtobuseBindir(currentStop)
                                        
                                        -- Faire descendre quelques passagers aléatoirement
                                        NpcDurakOtobustenIndir(math.random(1, 5))
                                        
                                        currentStop.passengerPickedUp = true
                                        visitedStops[currentStop.stopID] = true
                                        currentStopIndex = currentStopIndex + 1
                                        
                                        -- Vérifier s'il y a encore des arrêts
                                        if currentStopIndex <= #busStops then
                                            local nextStop = busStops[currentStopIndex]
                                            SetNewWaypoint(nextStop.coords.x, nextStop.coords.y)
                                            local nextStreetName = findStreetName(nextStop.coords)
                                            NuiMessage("STREET_NAME", nextStreetName)
                                        else
                                            -- Tous les arrêts sont terminés
                                            busJobData.busStopFinish = true
                                            FreezeEntityPosition(vehicle, false)
                                            
                                            -- Fermer le TextUI si activé
                                            if Config.PassengersText.codemtextui then
                                                exports["codem-textui"]:CloseTextUI()
                                                textUIOpen = false
                                            end
                                            break
                                        end
                                        
                                        -- Attendre le temps de gel configuré
                                        Wait(Config.PassengersText.freezetime)
                                        FreezeEntityPosition(vehicle, false)
                                    else
                                        Config.Notification(
                                            Config.NotificationText.wrongvehicle.text,
                                            Config.NotificationText.wrongvehicle.type,
                                            false
                                        )
                                    end
                                end
                            end
                        end
                    end
                    
                    -- Afficher le TextUI si le joueur est proche
                    if distanceToStop < Config.PassengersText.distance then
                        showTextUI = true
                        if Config.PassengersText.drawtext then
                            DrawText3D(
                                currentStop.coords.x,
                                currentStop.coords.y,
                                currentStop.coords.z + 1.0,
                                Config.PassengersText.text
                            )
                        else
                            if Config.PassengersText.codemtextui then
                                if not textUIOpen then
                                    exports["codem-textui"]:OpenTextUI(
                                        Config.PassengersText.codemtext,
                                        "E",
                                        Config.PassengersText.codemthema
                                    )
                                    textUIOpen = true
                                end
                            end
                        end
                    end
                end
                
                -- Fermer le TextUI si le joueur s'éloigne
                if textUIOpen and not showTextUI then
                    if Config.PassengersText.codemtextui then
                        exports["codem-textui"]:CloseTextUI()
                        textUIOpen = false
                    end
                end
            end
        end
        
        Citizen.Wait(waitTime)
    end
end
-- Thread pour gérer la fin de mission (livraison du bus)
Citizen.CreateThread(function()
    while true do
        local waitTime = 2000
        
        if busJobData.busStopFinish then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            waitTime = 0
            
            -- Définir le waypoint vers le point de fin
            SetNewWaypoint(
                Config.BusjobSettings.jobFinishCoords.x,
                Config.BusjobSettings.jobFinishCoords.y
            )
            
            -- Afficher le marqueur si configuré
            if Config.DrawMarkerSettings.finishCoordsDrawMarker then
                local distanceToFinish = #(playerCoords - Config.BusjobSettings.jobFinishCoords)
                if distanceToFinish < 15.0 then
                    DrawMarker(
                        22,
                        Config.BusjobSettings.jobFinishCoords.x,
                        Config.BusjobSettings.jobFinishCoords.y,
                        Config.BusjobSettings.jobFinishCoords.z,
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                        1.0, 2.5, 1.5,
                        255, 150, 0, 255,
                        0, 1, 0, 0, 0, 0, 0
                    )
                end
            end
            
            -- Vérifier si le joueur est proche du point de fin
            local distanceToFinish = #(playerCoords - Config.BusjobSettings.jobFinishCoords)
            if distanceToFinish < 7.5 then
                if IsControlJustPressed(0, 38) then -- Touche E
                    -- Faire descendre tous les passagers
                    NpcOtobustenIndir()
                    
                    -- Notification
                    Config.Notification(
                        Config.NotificationText.deliveryBus.text,
                        Config.NotificationText.deliveryBus.type,
                        false
                    )
                    
                    -- Passer à l'étape de livraison du véhicule
                    busJobData.deliverTheVehicle = true
                    busJobData.busStopFinish = false
                end
            end
        end
        
        Citizen.Wait(waitTime)
    end
end)
-- Thread pour gérer la livraison du véhicule
Citizen.CreateThread(function()
    while true do
        local waitTime = 2000
        local playerPed = PlayerPedId()
        
        if busJobData.deliverTheVehicle then
            local playerCoords = GetEntityCoords(playerPed)
            waitTime = 0
            
            -- Définir le waypoint vers le point de livraison
            SetNewWaypoint(
                Config.BusjobSettings.jobDeliverTheVehicleCoords.x,
                Config.BusjobSettings.jobDeliverTheVehicleCoords.y
            )
            
            -- Afficher le marqueur si configuré
            if Config.DrawMarkerSettings.deleteVehicleDrawMarker then
                local distanceToDelivery = #(playerCoords - Config.BusjobSettings.jobDeliverTheVehicleCoords)
                if distanceToDelivery < 15.0 then
                    DrawMarker(
                        22,
                        Config.BusjobSettings.jobDeliverTheVehicleCoords.x,
                        Config.BusjobSettings.jobDeliverTheVehicleCoords.y,
                        Config.BusjobSettings.jobDeliverTheVehicleCoords.z,
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                        1.0, 2.5, 1.5,
                        255, 150, 0, 255,
                        0, 1, 0, 0, 0, 0, 0
                    )
                end
            end
            
            -- Vérifier si le joueur est proche du point de livraison
            local distanceToDelivery = #(playerCoords - Config.BusjobSettings.jobDeliverTheVehicleCoords)
            if distanceToDelivery < 7.5 then
                if IsControlJustPressed(0, 38) then -- Touche E
                    -- Nettoyer tous les blips des routes
                    for routeKey, routeData in pairs(Config.BusjobSettings.busRouteSettings) do
                        local busStops = Config.BusjobSettings.busStops[currentRoute]
                        if busStops then
                            for stopIndex, stopData in ipairs(busStops) do
                                -- Réinitialiser les données des arrêts
                                stopData.passengerPickedUp = false
                                stopData.npcList = {}
                            end
                        end
                    end
                    
                    -- Réinitialiser les données de mission
                    busJobData.startMission = false
                    
                    -- Faire descendre tous les passagers
                    NpcOtobustenIndir()
                    
                    -- Réinitialiser tous les états
                    busJobData.missionComplete = false
                    busJobData.busStopFinish = false
                    busJobData.deliverTheVehicle = false
                    
                    -- Supprimer le véhicule si il existe
                    if busVehicle then
                        if busModel then
                            -- Retirer la clé du véhicule
                            Config.RemoveVehiclekey(
                                GetVehicleNumberPlateText(busVehicle),
                                GetHashKey(busModel),
                                busVehicle
                            )
                            DeleteEntity(busVehicle)
                        end
                    end
                    
                    -- Réinitialiser les compteurs
                    timeCounter = 0
                    
                    -- Récupérer l'argent du travail
                    local currentJobMoney = TriggerCallback("codem-busjob:getJobMoney")
                    local currentMoney = tonumber(currentJobMoney)
                    local expectedMoney = tonumber(busJobData.incomePrice)
                    
                    -- Mettre à jour l'argent si nécessaire
                    if currentMoney ~= expectedMoney then
                        TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice, true)
                    end
                    
                    busJobData.incomePrice = tonumber(currentJobMoney)
                    
                    -- Récupérer la clé
                    local keyData = TriggerCallback("codem-busjob:getKey")
                    local key = keyData or false
                    
                    -- Déclencher l'événement de fin de travail
                    TriggerServerEvent(
                        "codem-busjob:finishJob",
                        key,
                        busJobData.incomePrice,
                        busJobData.bindirilenNpcSayisi,
                        currentRoute,
                        currentStopIndex
                    )
                    
                    -- Réinitialiser l'argent
                    busJobData.incomePrice = 0
                    TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice)
                    
                    -- Nettoyer toutes les variables
                    busModel = nil
                    busVehicle = nil
                    plateNumber = nil
                    currentRoute = nil
                    busJobData.bindirilenNpcSayisi = 0
                    visitedStops = {}
                    currentStopIndex = 1
                    
                    -- Fermer les interfaces NUI
                    NuiMessage("OPEN_METERS", false)
                    NuiMessage("UPDATE_TIMER", false)
                end
            end
        end
        
        Citizen.Wait(waitTime)
    end
end)
-- Commande pour réinitialiser le travail de bus
RegisterCommand(Config.ResetJobPlayer, function()
    if busJobData.startMission then
        -- Supprimer tous les blips des arrêts
        local busStops = Config.BusjobSettings.busStops[currentRoute]
        if busStops then
            for stopIndex, stopData in ipairs(busStops) do
                if stopData.blip then
                    RemoveBlip(stopData.blip)
                end
            end
        end
        
        -- Faire descendre tous les passagers
        NpcOtobustenIndir()
        
        -- Réinitialiser tous les états de mission
        busJobData.startMission = false
        busJobData.missionComplete = false
        busJobData.busStopFinish = false
        busJobData.deliverTheVehicle = false
        
        -- Supprimer le véhicule si il existe
        if busVehicle then
            if busModel then
                -- Retirer la clé du véhicule
                Config.RemoveVehiclekey(
                    GetVehicleNumberPlateText(busVehicle),
                    GetHashKey(busModel),
                    busVehicle
                )
                DeleteEntity(busVehicle)
            end
        end
        
        -- Réinitialiser les compteurs
        timeCounter = 0
        busJobData.incomePrice = 0
        
        -- Mettre à jour l'argent sur le serveur
        TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice)
        
        -- Nettoyer toutes les variables
        busModel = nil
        busVehicle = nil
        plateNumber = nil
        currentRoute = nil
        busJobData.bindirilenNpcSayisi = 0
        visitedStops = {}
        currentStopIndex = 1
        
        -- Fermer l'interface NUI
        NuiMessage("OPEN_METERS", false)
        
        -- Notification de réinitialisation
        Config.Notification(
            Config.NotificationText.resetjob.text,
            Config.NotificationText.resetjob.type,
            false
        )
    end
end)
-- Callback NUI pour la fin du temps de mission
RegisterNUICallback("timeFinish", function()
    if busJobData.startMission then
        -- Supprimer tous les blips des arrêts
        local busStops = Config.BusjobSettings.busStops[currentRoute]
        if busStops then
            for stopIndex, stopData in ipairs(busStops) do
                if stopData.blip then
                    RemoveBlip(stopData.blip)
                end
            end
        end
        
        -- Faire descendre tous les passagers
        NpcOtobustenIndir()
        
        -- Réinitialiser tous les états de mission
        busJobData.startMission = false
        busJobData.missionComplete = false
        busJobData.busStopFinish = false
        busJobData.deliverTheVehicle = false
        
        -- Supprimer le véhicule si il existe
        if busVehicle then
            if busModel then
                -- Retirer la clé du véhicule
                Config.RemoveVehiclekey(
                    GetVehicleNumberPlateText(busVehicle),
                    GetHashKey(busModel),
                    busVehicle
                )
                DeleteEntity(busVehicle)
            end
        end
        
        -- Réinitialiser les compteurs
        timeCounter = 0
        busJobData.incomePrice = 0
        
        -- Mettre à jour l'argent sur le serveur
        TriggerServerEvent("codem-busjob:updateJobMoney", busJobData.incomePrice)
        
        -- Nettoyer toutes les variables
        busModel = nil
        busVehicle = nil
        plateNumber = nil
        currentRoute = nil
        busJobData.bindirilenNpcSayisi = 0
        visitedStops = {}
        currentStopIndex = 1
        
        -- Fermer l'interface NUI
        NuiMessage("OPEN_METERS", false)
        
        -- Notification de fin de temps
        Config.Notification(
            Config.NotificationText.timefinish.text,
            Config.NotificationText.timefinish.type,
            false
        )
    end
end)
-- Thread pour mettre à jour les informations de siège et de revenus
Citizen.CreateThread(function()
    while true do
        local routeAbbreviation = false
        
        -- Trouver l'abréviation de la route actuelle
        for routeKey, routeData in pairs(Config.BusjobSettings.busRouteSettings) do
            if routeData.name == currentRoute then
                routeAbbreviation = routeData.abbreviation
                break
            end
        end
        
        if busJobData.startMission then
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if vehicle and vehicle ~= 0 then
                local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                local emptySeats = 0
                
                -- Compter les sièges vides
                for seatIndex = -1, maxSeats - 1 do
                    if IsVehicleSeatFree(vehicle, seatIndex) then
                        emptySeats = emptySeats + 1
                    end
                end
                
                local occupiedSeats = maxSeats - emptySeats
                
                -- Envoyer les données à l'interface NUI
                NuiMessage("CHECK_SEAT", {
                    fullseat = occupiedSeats,
                    emptyseat = emptySeats,
                    incomePrice = busJobData.incomePrice,
                    abb = routeAbbreviation
                })
            end
        end
        
        Citizen.Wait(5000)
    end
end)
-- Callback NUI pour démarrer un travail de bus
RegisterNUICallback("startJob", function(data, callback)
    -- Vérifier si une mission est déjà en cours
    if busJobData.startMission then
        NuiMessage("CLOSE_MENU_JOB")
        Wait(250)
        
        Config.Notification(
            Config.NotificationText.notfinishjob.text,
            Config.NotificationText.notfinishjob.type,
            false
        )
        return
    end
    
    -- Vérifier si le modèle de véhicule est valide
    local validVehicle = false
    for vehicleKey, vehicleData in pairs(Config.BusjobSettings.busJobVehicle) do
        if vehicleData.vehiclename == data.busvehiclemodel then
            validVehicle = true
            break
        end
    end
    
    if validVehicle then
        -- Définir la route sélectionnée et faire apparaître le bus
        currentRoute = data.route
        spawnBus(data.busvehiclemodel)
    else
        print("Vehicle model not found.")
    end
    
    callback("ok")
end)
-- Événement réseau pour recevoir les données du top 50
RegisterNetEvent("codem-busjob:top50", function(data)
    if data then
        NuiMessage("top50", data)
    end
end)
-- Fonction pour déclencher un callback serveur de manière synchrone
function TriggerCallback(callbackName, ...)
    local result = false
    local status = "UNKNOWN"
    local attempts = 0
    
    -- Attendre que Core soit initialisé
    while Core == nil do
        Wait(0)
    end
    
    -- Déclencher le callback selon le framework
    if Config.Framework == "esx" then
        Core.TriggerServerCallback(callbackName, function(data)
            status = "SUCCESS"
            result = data
        end, ...)
    else
        Core.Functions.TriggerCallback(callbackName, function(data)
            status = "SUCCESS"
            result = data
        end, ...)
    end
    
    -- Thread pour gérer le timeout
    CreateThread(function()
        while status == "UNKNOWN" do
            Wait(1000)
            attempts = attempts + 1
            if attempts >= 4 then
                status = "FAILED"
                result = false
                break
            end
        end
    end)
    
    -- Attendre la réponse
    while status == "UNKNOWN" do
        Wait(0)
    end
    
    return result
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
