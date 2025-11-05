--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local lib = exports.ox_lib

local crashLock = false
local inPanel = false
local currentPlate = nil
local aiActive = false
local aiTarget = nil
local aiStart = nil
local aiLastTask = 0
local stuckTimer = 0
local policeNearTimer = 0
local lastPolicePrompt = 0
local durability = {
    driving_mode = 100,
    limiter = 100,
    cruise = 100,
    collision_avoid = 100
}
local calibrating = false
local calibrationPoints = {}
local uiState = {
    enabled = false,
    calibrated = false,
    driving_mode = 'souple',
    limiter_enabled = false,
    limiter_speed_kmh = 0,
    cruise_enabled = false,
    cruise_speed_kmh = 0,
    collision_avoid_enabled = false,
    lawless_enabled = false,
    lawless_active  = false,
}

local calibrationIndex = 0
local calibrationBlips = {}
local aiCalibrationLeg = false


--Blips sur la carte
CreateThread(function()
    for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.coords)

        SetBlipSprite(blip, v.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.scale)
        SetBlipColour(blip, v.colour)
        SetBlipAsShortRange(blip, v.shortRange)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.label)
        EndTextCommandSetBlipName(blip)
    end
end)
------------------------------------------------




-- Helpers
local function notify(msg) lib:notify({description = msg, type = 'inform'}) end
local function errorNotify(msg) lib:notify({description = msg, type = 'error'}) end
local function successNotify(msg) lib:notify({description = msg, type = 'success'}) end

local function getPlayerPed() return PlayerPedId() end
local function getVehiclePedIsIn() return GetVehiclePedIsIn(getPlayerPed(), false) end
local function isDriver()
    local veh = getVehiclePedIsIn()
    return veh ~= 0 and GetPedInVehicleSeat(veh, -1) == getPlayerPed()
end

-------

local function getPlate(veh)
    local plate = GetVehicleNumberPlateText(veh) or ''
    plate = plate:gsub('\194\160', ' ')                 -- remplace NBSP par espace normal
    plate = plate:gsub('^%s*(.-)%s*$', '%1')            -- trim bords
    return string.upper(plate)
end

--------

local function isBlacklisted(veh)
    local class = GetVehicleClass(veh)
    for _,c in ipairs(Config.BlacklistClasses) do
        if c == class then return true end
    end
    local model = GetEntityModel(veh)
    for _,name in ipairs(Config.BlacklistModels) do
        if model == GetHashKey(name) then return true end
    end
    return false
end

-- Recale un point au sol si possible
local function snapToGround(vec)
    if not (Config.Calibration and Config.Calibration.SnapToGround) then
        return vec
    end
    local x, y = vec.x + 0.0, vec.y + 0.0
    local probeHeights = { 1000.0, 500.0, 200.0, 60.0, 15.0 }
    local found, gz = GetGroundZFor_3dCoord(x, y, (vec.z or probeHeights[1]) + 0.0, false)
    local i = 1
    while not found and i <= #probeHeights do
        found, gz = GetGroundZFor_3dCoord(x, y, probeHeights[i], false)
        i = i + 1
    end
    if found then
        return vector3(x, y, gz + (Config.Calibration.GroundOffset or 0.35))
    end
    return vec
end



-- NUI
RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    inPanel = false
    cb(true)
end)

RegisterNUICallback('npc:enable', function(data, cb)
    TriggerServerEvent('ducratif_ai:toggleAI', data.plate, true)
    -- ferme la NUI tout de suite + petite anim
    SendNUIMessage({ type = 'panel:launchAnimation' })
    SetNuiFocus(false, false)
    inPanel = false
    cb(true)
end)

RegisterNUICallback('npc:disable', function(data, cb)
    TriggerServerEvent('ducratif_ai:toggleAI', data.plate, false)
    -- ferme la NUI tout de suite + petite anim
    SendNUIMessage({ type = 'panel:launchAnimation' })
    SetNuiFocus(false, false)
    inPanel = false
    cb(true)
end)

RegisterNUICallback('purchaseOption', function(data, cb)
    -- data.optionKey, data.args, data.plate (optional)
    ESX.TriggerServerCallback('ducratif_ai:purchaseOption', function(ok, err, arg)
        if ok then
            SendNUIMessage({ type = 'purchase:ok', option = data.optionKey })
        else
            SendNUIMessage({ type = 'purchase:fail', option = data.optionKey, reason = err, arg = arg })
            if err == 'money' then errorNotify('Fonds insuffisants.') end
        end
    end, data.plate, data.optionKey, data.args)
    cb(true)
end)

RegisterNUICallback('saveSettings', function(data, cb)
    -- data has: plate, settings (driving_mode, limiter_enabled, limiter_speed_kmh, cruise_enabled, cruise_speed_kmh)
    TriggerServerEvent('ducratif_ai:updateSettings', data.plate, data.settings)
    cb(true)
end)

RegisterNUICallback('getHistory', function(_, cb)
    ESX.TriggerServerCallback('ducratif_ai:history:get', function(data)
        cb(data or { history={}, favorites={}, slots = Config.DefaultFavSlots })
    end)
end)

RegisterNUICallback('history:add', function(data, cb)
    TriggerServerEvent('ducratif_ai:history:add', data.plate, data.from_label, data.to_label, data.from_coords, data.to_coords)
    cb(true)
end)

RegisterNUICallback('fav:add', function(data, cb)
    TriggerServerEvent('ducratif_ai:fav:add', data.label, data.coords)
    cb(true)
end)

RegisterNUICallback('fav:remove', function(data, cb)
    TriggerServerEvent('ducratif_ai:fav:remove', data.id)
    cb(true)
end)

-- Démarrer vers le point GPS + log dans l'historique
RegisterNUICallback('startAI', function(_, cb)
    local blip = GetFirstBlipInfoId(8)
    if blip == 0 then
        errorNotify('Aucun point GPS défini.')
        cb(false) 
        return
    end

    local coord = GetBlipInfoIdCoord(blip)
    aiTarget = vector3(coord.x, coord.y, coord.z)

    -- ---- Historique ----
    -- on prend la plaque actuelle (ou on retombe sur le véhicule)
    local veh   = getVehiclePedIsIn()
    local plate = currentPlate or (veh ~= 0 and getPlate(veh)) or ''

    -- position de départ = pos véhicule (ou ped si pas de véhicule)
    local fromPos = GetEntityCoords(veh ~= 0 and veh or getPlayerPed())

    TriggerServerEvent('ducratif_ai:history:add',
        plate,
        'Position actuelle',      -- from_label
        'GPS',                    -- to_label
        { x = fromPos.x, y = fromPos.y, z = fromPos.z },        -- from_coords
        { x = aiTarget.x, y = aiTarget.y, z = aiTarget.z }      -- to_coords
    )
    -- ---------------------

    -- petite anim + fermeture UI, puis lancement IA
    SendNUIMessage({ type = 'panel:launchAnimation' })
    SetTimeout(1200, function()
        SetNuiFocus(false, false)
        inPanel = false
        startAutopilot(aiTarget)
    end)

    cb(true)
end)



-- Démarrer l'IA directement vers des coords (favori)
RegisterNUICallback('startAITo', function(data, cb)
    local t = data and data.target
    if not t or t.x == nil or t.y == nil then
        cb(false); return
    end

    -- ferme la NUI + petite anim
    SendNUIMessage({ type = 'panel:launchAnimation' })
    local dest = vector3(tonumber(t.x)+0.0, tonumber(t.y)+0.0, tonumber(t.z or 0.0)+0.0)

    SetTimeout(1200, function()
        SetNuiFocus(false, false)
        inPanel = false
        aiTarget = dest
        startAutopilot(dest)

        -- Historique (optionnel mais pratique)
        local veh = getVehiclePedIsIn()
        if veh ~= 0 then
            local from = GetEntityCoords(veh)
            TriggerServerEvent('ducratif_ai:history:add',
                currentPlate or getPlate(veh),
                data.from_label or 'Position actuelle',
                data.to_label or 'Favori',
                { x = from.x, y = from.y, z = from.z },
                { x = dest.x, y = dest.y, z = dest.z }
            )
        end
    end)

    cb(true)
end)


-- Show panel (N key)
CreateThread(function()
    RegisterKeyMapping('ia_panel', 'Ouvrir panel IA', 'keyboard', Config.KeyOpenPanel)
    RegisterCommand('ia_panel', function()
        if isDriver() then
            local veh = getVehiclePedIsIn()
            local plate = getPlate(veh)
            ESX.TriggerServerCallback('ducratif_ai:getVehicleAI', function(row)
                --print('IA_PANEL ROW:', json.encode(row))
                if not row then
                    errorNotify('Véhicule non reconnu / pas d’IA enregistrée. Passe voir le PNJ.')
                    return
                end
            
                -- on n’empêche plus l’ouverture du panel si enabled == 0 ici
                currentPlate = plate
            
                uiState.enabled           = (tonumber(row.enabled)    or 0) == 1
                uiState.calibrated        = (tonumber(row.calibrated) or 0) == 1
                uiState.driving_mode      = row.driving_mode or 'souple'

                uiState.limiter_speed_kmh = tonumber(row.limiter_speed_kmh) or 0
                uiState.cruise_speed_kmh  = tonumber(row.cruise_speed_kmh)  or 0

                -- installé (acheté) vs actif (speed > 0)
                uiState.limiter_installed = ((tonumber(row.limiter_enabled) or 0) == 1)
                uiState.cruise_installed  = ((tonumber(row.cruise_enabled)  or 0) == 1)

                uiState.limiter_enabled   = uiState.limiter_installed and (uiState.limiter_speed_kmh > 0)
                uiState.cruise_enabled    = uiState.cruise_installed  and (uiState.cruise_speed_kmh  > 0)

                uiState.collision_avoid_enabled = (tonumber(row.collision_avoid_enabled) or 0) == 1

                uiState.lawless_enabled = (tonumber(row.lawless_enabled) or 0) == 1
                uiState.lawless_active  = (tonumber(row.lawless_active)  or 0) == 1



            
                SetNuiFocus(true, true)
                inPanel = true
                SendNUIMessage({
                    type = 'panel:open',
                    plate = plate,
                    state = uiState,
                    brand = Config.UI.Brand,
                    theme = Config.UI.ThemeColor
                })
            end, plate)

        else
            errorNotify('Vous devez être conducteur.')
        end
    end, false)
end)

-- NPC Target + open NPC view
local npcPed = 0
CreateThread(function()
    -- spawn NPC
    local model = GetHashKey(Config.NPC.model)
    RequestModel(model) while not HasModelLoaded(model) do Wait(10) end
    npcPed = CreatePed(4, model, Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z - 1.0, Config.NPC.coords.w, false, true)
    SetEntityAsMissionEntity(npcPed, true, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)

    exports.ox_target:addLocalEntity(npcPed, {
        {
            name = 'ducratif_ai_npc',
            icon = Config.NPC.targetIcon,
            label = 'Configurer IA',
            onSelect = function(data)
                local ped = PlayerPedId()
                local npcPos = vector3(Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z)
                        
                -- 1) Si tu es DANS un véhicule et qu'il est à portée du PNJ, on prend celui-là.
                local myVeh = GetVehiclePedIsIn(ped, false)
                local veh = 0
                        
                if myVeh ~= 0 then
                    local d = #(GetEntityCoords(myVeh) - npcPos)
                    if d <= Config.NPC.radiusDetectVeh then
                        veh = myVeh
                    end
                end
            
                -- 2) Sinon, on prend le plus proche du **PNJ** (pas du joueur).
                if veh == 0 then
                    veh = GetClosestVehicle(npcPos.x, npcPos.y, npcPos.z, Config.NPC.radiusDetectVeh, 0, 70)
                    if veh == 0 then
                        errorNotify('Aucun véhicule à proximité du PNJ.')
                        return
                    end
                    local d = #(GetEntityCoords(veh) - npcPos)
                    if d > Config.NPC.radiusDetectVeh then
                        errorNotify(('Votre véhicule doit être à moins de %dm du PNJ.'):format(math.floor(Config.NPC.radiusDetectVeh)))
                        return
                    end
                end
            
                local plate = getPlate(veh)
            
                -- Vérifie la propriété AVANT d’ouvrir l’UI
                ESX.TriggerServerCallback('ducratif_ai:getVehicleAI', function(row)
                    if not row then
                        errorNotify('~r~Ce véhicule ne vous appartient pas.')
                        return
                    end
                    currentPlate = plate
                    SetNuiFocus(true, true); inPanel = true
                    SendNUIMessage({
                      type = 'npc:open',
                      plate = plate,
                      state = {
                        enabled = tonumber(row.enabled) or 0,
                        calibrated = tonumber(row.calibrated) or 0,
                        driving_mode = row.driving_mode,
                        limiter_enabled = tonumber(row.limiter_enabled) or 0,
                        limiter_speed_kmh = tonumber(row.limiter_speed_kmh) or 0,
                        cruise_enabled = tonumber(row.cruise_enabled) or 0,
                        cruise_speed_kmh = tonumber(row.cruise_speed_kmh) or 0,
                        collision_avoid_enabled = tonumber(row.collision_avoid_enabled) or 0
                      },
                      brand = Config.UI.Brand,
                      theme = Config.UI.ThemeColor
                    })

                end, plate)
            end

        }
    })
end)

-- Calibration flow
RegisterNetEvent('ducratif_ai:calibration:start', function(plate)
    if not isDriver() then
        errorNotify('Montez côté conducteur pour calibrer.')
        return
    end

    calibrating = true
    calibrationIndex = 0
    calibrationPoints = {}

    -- Clean anciens blips
    for _,b in ipairs(calibrationBlips) do
        if DoesBlipExist(b) then RemoveBlip(b) end
    end
    calibrationBlips = {}

    -- Source des points : Config.Calibration.Points si non vide, sinon anneau autour du PNJ
    local cfg  = Config.Calibration or {}
    local list = (cfg.Points and #cfg.Points > 0) and cfg.Points or nil

    if list then
        for _,pt in ipairs(list) do
            local v = snapToGround(vector3(pt.x, pt.y, pt.z or 1000.0))
            table.insert(calibrationPoints, v)
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(blip, 280)
            SetBlipColour(blip, 2)
            SetBlipScale(blip, 0.85)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Calibration IA')
            EndTextCommandSetBlipName(blip)
            table.insert(calibrationBlips, blip)
        end
    else
        local base = vector3(Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z)
        local n = cfg.Checkpoints or 3
        local r = cfg.Radius or 120.0
        for i=1, n do
            local angle  = math.rad((i-1) * (360/n))
            local offset = vector3(math.cos(angle)*r, math.sin(angle)*r, 0.0)
            local pt     = snapToGround(base + offset)
            table.insert(calibrationPoints, pt)
            local blip = AddBlipForCoord(pt.x, pt.y, pt.z)
            SetBlipSprite(blip, 280)
            SetBlipColour(blip, 2)
            SetBlipScale(blip, 0.85)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Calibration IA')
            EndTextCommandSetBlipName(blip)
            table.insert(calibrationBlips, blip)
        end
    end

    if #calibrationPoints == 0 then
        calibrating = false
        errorNotify('Aucun point de calibration défini.')
        return
    end

    notify(('Calibration IA : %d points. Laissez l’IA les atteindre.'):format(#calibrationPoints))

    -- Lance l’étape 1 (startAutopilot gère isCalibration = true)
    calibrationIndex = 1
    startAutopilot(calibrationPoints[calibrationIndex], true)
end)


RegisterCommand('ia_calib', function()
    if isDriver() then
        TriggerEvent('ducratif_ai:calibration:start', currentPlate or getPlate(getVehiclePedIsIn()))
    else
        errorNotify('Conduisez le véhicule à calibrer.')
    end
end, false)



local function reached(a, b, thresh)
    return #(a - b) <= (thresh or 8.0)
end

local function desiredSpeedKmh()
    local kmh = Config.DrivingSpeeds[uiState.driving_mode] or 80
    if uiState.cruise_enabled and uiState.cruise_speed_kmh > 0 then
        kmh = math.min(kmh, uiState.cruise_speed_kmh)
    end
    if uiState.limiter_enabled and uiState.limiter_speed_kmh > 0 then
        kmh = math.min(kmh, uiState.limiter_speed_kmh)
    end
    return kmh
end


local function currentDrivingStyle()
    local style = Config.DrivingStyles[uiState.driving_mode] or 0x400C2
    if uiState.lawless_active and Config.DrivingStylesLawless and Config.DrivingStylesLawless[uiState.driving_mode] then
        style = Config.DrivingStylesLawless[uiState.driving_mode]
    end
    return style
end


-- Autopilot core
function startAutopilot(dest, isCalibration)
    if not isDriver() then errorNotify('Vous devez conduire votre véhicule.'); return end

    local veh = getVehiclePedIsIn()
    if veh == 0 then return end

    if isBlacklisted(veh) then
        errorNotify('IA interdite sur ce véhicule.')
        return
    end

    local pos = GetEntityCoords(veh)
    -- Zones interdites (on bloque même pour le calibrage)
    for _, z in ipairs(Config.ForbiddenZones) do
        if #(pos - z.coords) <= z.radius then
            errorNotify('~r~Zone interdite IA: ' .. (z.label or 'Zone'))
            return
        end
    end

    -- plaque normalisée (trim + upper)
    local plateRaw = getPlate(veh)
    local plate = (plateRaw and plateRaw:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    ESX.TriggerServerCallback('ducratif_ai:getVehicleAI', function(row)
        if not row then
            errorNotify('IA non disponible pour ce véhicule.')
            return
        end

        -- Cast sûr ('1' vs 1)
        local en  = tonumber(row.enabled) or 0
        local cal = tonumber(row.calibrated) or 0

        -- Autoriser le démarrage si c'est le calibrage, même si enabled n'est pas encore vu à 1
        if (en ~= 1) and (not isCalibration) then
            errorNotify('IA non disponible pour ce véhicule.')
            return
        end
        if (cal ~= 1) and (not isCalibration) then
            errorNotify('~y~Veuillez calibrer l\'IA d\'abord (voir PNJ).')
            return
        end

        currentPlate = plate
        uiState.enabled           = (tonumber(row.enabled)    or 0) == 1
        uiState.calibrated        = (tonumber(row.calibrated) or 0) == 1
        uiState.driving_mode      = row.driving_mode or 'souple'
            
        uiState.limiter_speed_kmh = tonumber(row.limiter_speed_kmh) or 0
        uiState.cruise_speed_kmh  = tonumber(row.cruise_speed_kmh)  or 0
            
        uiState.limiter_installed = ((tonumber(row.limiter_enabled) or 0) == 1)
        uiState.cruise_installed  = ((tonumber(row.cruise_enabled)  or 0) == 1)
            
        uiState.limiter_enabled   = uiState.limiter_installed and (uiState.limiter_speed_kmh > 0)
        uiState.cruise_enabled    = uiState.cruise_installed  and (uiState.cruise_speed_kmh  > 0)
            
        uiState.collision_avoid_enabled = (tonumber(row.collision_avoid_enabled) or 0) == 1



        -- Démarrage IA
        aiActive         = true
        aiTarget         = dest
        aiStart          = GetEntityCoords(veh)
        aiLastTask       = GetGameTimer()
        stuckTimer       = 0
        policeNearTimer  = 0
        aiCalibrationLeg = (isCalibration == true)   -- bloque l'autopark pendant les legs de calibrage

        notify('Conduite IA engagée. Tapez /' .. Config.CommandStop .. ' pour arrêter.')

        -- moteur ON
        SetVehicleEngineOn(veh, true, true, false)
            
        -- Coiffe de vitesse max via limitateur (en m/s)
        local cap = 999.0
        if uiState.limiter_enabled and uiState.limiter_speed_kmh > 0 then
            cap = math.min(cap, uiState.limiter_speed_kmh / 3.6)
        end
        SetEntityMaxSpeed(veh, cap)
        
        -- Vitesse de consigne pour la tâche (mode, puis régul/limiteur)
        local speedKmh = desiredSpeedKmh()
        
        -- Régulateur : fixe aussi la cruise speed du task
        if uiState.cruise_enabled and uiState.cruise_speed_kmh > 0 then
            SetDriveTaskCruiseSpeed(getPlayerPed(), uiState.cruise_speed_kmh / 3.6)
        end
        
        TaskVehicleDriveToCoordLongrange(
            getPlayerPed(), veh,
            aiTarget.x, aiTarget.y, aiTarget.z,
            speedKmh / 3.6,
            currentDrivingStyle(),
            20.0
        )

    end, plate)
end




-----------

local function stopAutopilot(reason)
    if not aiActive then return end
    aiActive = false
    local ped = getPlayerPed()
    local veh = getVehiclePedIsIn()
    ClearPedTasks(ped)
    if veh ~= 0 then
        TaskVehicleTempAction(ped, veh, 1, 500) -- handbrake briefly
    end
    if reason then notify(reason) end
end

RegisterCommand(Config.CommandStop, function()
    calibrating = false
    aiCalibrationLeg = false
    stopAutopilot('IA arrêtée.')
end, false)

-- Add favorite at current waypoint
RegisterCommand(Config.CommandFavAdd, function()
    local blip = GetFirstBlipInfoId(8)
    if blip == 0 then
        errorNotify('Aucun point GPS défini.')
        return
    end
    local coord = GetBlipInfoIdCoord(blip)
    local label = lib:inputDialog('Ajouter Favori', {'Nom du favori'})
    if not label or not label[1] or label[1] == '' then return end
    TriggerServerEvent('ducratif_ai:fav:add', label[1], { x = coord.x, y = coord.y, z = coord.z })
end, false)

-- Police proximity detection (client side rough + server prompt gating)
CreateThread(function()
    while true do
        Wait(500)
        if aiActive then
            local ped = PlayerPedId()
            local veh = getVehiclePedIsIn()
            if veh ~= 0 then
                -- Forbid zones during run
                local pos = GetEntityCoords(veh)
                for _,z in ipairs(Config.ForbiddenZones) do
                    if #(pos - z.coords) <= z.radius then
                        stopAutopilot('~r~Zone interdite IA, arrêt d\'urgence.')
                        goto continue_loop
                    end
                end

                                -- flat tyre + limitateur : coiffe commune
                local flat = false
                for i=0, 7 do
                    if IsVehicleTyreBurst(veh, i, true) then flat = true break end
                end

                local cap = 999.0
                if uiState.limiter_enabled and uiState.limiter_speed_kmh > 0 then
                    cap = math.min(cap, uiState.limiter_speed_kmh / 3.6)
                end
                if flat then
                    cap = math.min(cap, Config.FlatTyreLimitKmh / 3.6)
                    BeginTextCommandDisplayHelp('STRING')
                    AddTextComponentSubstringPlayerName('~y~Pneu défaillant: vitesse limitée à '..Config.FlatTyreLimitKmh..' km/h.')
                    EndTextCommandDisplayHelp(0, false, false, 1)
                end
                SetEntityMaxSpeed(veh, cap)

                -- Régulateur : réassigne périodiquement la consigne
                if uiState.cruise_enabled and uiState.cruise_speed_kmh > 0 then
                    SetDriveTaskCruiseSpeed(ped, uiState.cruise_speed_kmh / 3.6)
                end

                -- stuck detection
                local speed = GetEntitySpeed(veh)
                if speed <= Config.StuckSpeedThreshold then
                    stuckTimer = stuckTimer + 0.5
                else
                    stuckTimer = 0
                end
                -- stuck detection
                local speed = GetEntitySpeed(veh)
                if speed <= Config.StuckSpeedThreshold then
                    stuckTimer = stuckTimer + 0.5
                else
                    stuckTimer = 0
                end
                if stuckTimer >= Config.StuckTimeout then
                    -- retask
                    local s = desiredSpeedKmh()
                    TaskVehicleDriveToCoordLongrange(
                        ped, veh,
                        aiTarget.x, aiTarget.y, aiTarget.z,
                        s / 3.6,
                        currentDrivingStyle(),
                        20.0
                    )
                    stuckTimer = 0
                end


                -- collision avoidance simple (raycast)
                if uiState.collision_avoid_enabled then
                    local fwd = GetEntityForwardVector(veh)
                    local from = pos + fwd*2.0
                    local to = pos + fwd*10.0
                    local ray = StartShapeTestCapsule(from.x, from.y, from.z+0.5, to.x, to.y, to.z+0.5, 2.0, 10, veh, 7)
                    local _, hit, _ = GetShapeTestResult(ray)
                    if hit == 1 then
                        TaskVehicleTempAction(ped, veh, 3, 600)
                    end
                end

                -- near destination => autopark simple (jamais pendant le calibrage)
                if Config.AutoPark.Enabled and aiTarget and not aiCalibrationLeg then
                    local d = #(pos - aiTarget)
                    if d <= Config.AutoPark.DistanceToStart then
                        TaskVehicleDriveToCoordLongrange(
                            ped, veh, aiTarget.x, aiTarget.y, aiTarget.z,
                            20/3.6, Config.DrivingStyles['souple'], 5.0
                        )
                    end
                    if d <= Config.AutoPark.FinalStopDistance then
                        stopAutopilot('Arrivée à destination.')
                    end
                end

                ----
                -- Calibration: progression (enchaîne les checkpoints)
                if calibrating and aiTarget then
                    local ped = PlayerPedId()
                    local veh = getVehiclePedIsIn()
                    if veh ~= 0 then
                        local pos  = GetEntityCoords(veh)
                        local dcal = #(pos - aiTarget)
                    
                        local cfg = Config.Calibration or {}
                        local approachDist = cfg.ApproachDistance or 25.0
                        local reachDist    = cfg.ReachDistance    or 18.0
                        local approachKmh  = cfg.ApproachKmh      or 35.0
                    
                        -- Aimantation douce près du point
                        if dcal <= approachDist then
                            TaskVehicleDriveToCoordLongrange(
                                ped, veh,
                                aiTarget.x, aiTarget.y, aiTarget.z,
                                approachKmh / 3.6,
                                (Config.DrivingStyles[uiState.driving_mode] or 0x400C2),
                                5.0
                            )
                        end
                    
                        -- Point atteint
                        if dcal <= reachDist then
                            if calibrationBlips[calibrationIndex] and DoesBlipExist(calibrationBlips[calibrationIndex]) then
                                RemoveBlip(calibrationBlips[calibrationIndex])
                            end
                        
                            if calibrationIndex < #calibrationPoints then
                                calibrationIndex = calibrationIndex + 1
                                aiTarget         = calibrationPoints[calibrationIndex]
                                aiCalibrationLeg = true
                            
                                local s = desiredSpeedKmh()
                                TaskVehicleDriveToCoordLongrange(
                                    ped, veh,
                                    aiTarget.x, aiTarget.y, aiTarget.z,
                                    s / 3.6,
                                    (Config.DrivingStyles[uiState.driving_mode] or 0x400C2),
                                    20.0
                                )
                            
                                notify(('Point %d/%d atteint.'):format(calibrationIndex-1, #calibrationPoints))
                            else
                                for _,b in ipairs(calibrationBlips) do if DoesBlipExist(b) then RemoveBlip(b) end end
                                calibrationBlips = {}
                                calibrating      = false
                                aiCalibrationLeg = false
                                stopAutopilot('Calibration terminée.')
                                TriggerServerEvent('ducratif_ai:calibration:done', currentPlate or getPlate(getVehiclePedIsIn()))
                            end
                        end
                    end
                end


                ----

                -- Police siren proximity / prompt after 10s
                local nearPolice = false
                local players = GetActivePlayers()
                for _,pid in ipairs(players) do
                    if pid ~= PlayerId() then
                        local pPed = GetPlayerPed(pid)
                        if DoesEntityExist(pPed) then
                            local pVeh = GetVehiclePedIsIn(pPed, false)
                            if pVeh ~= 0 and IsVehicleSirenOn(pVeh) then
                                local dist = #(GetEntityCoords(pVeh) - pos)
                                if dist <= Config.PoliceDetectRadius then
                                    nearPolice = true
                                    break
                                end
                            end
                        end
                    end
                end
                if nearPolice then
                    policeNearTimer = policeNearTimer + 0.5
                    if policeNearTimer == 1.0 then
                        notify('~y~Police proche, restez prudent.')
                    end
                    if policeNearTimer >= Config.PoliceRequestDelay and (GetGameTimer() - lastPolicePrompt > Config.PoliceRequestOnceCooldown*1000) then
                        -- Find a police driver to prompt
                        local targetPolice = -1
                        for _,pid in ipairs(players) do
                            if pid ~= PlayerId() then
                                local pPed = GetPlayerPed(pid)
                                local pVeh = GetVehiclePedIsIn(pPed, false)
                                if pVeh ~= 0 and IsVehicleSirenOn(pVeh) then
                                    local dist = #(GetEntityCoords(pVeh) - pos)
                                    if dist <= Config.PoliceDetectRadius then
                                        targetPolice = GetPlayerServerId(pid)
                                        break
                                    end
                                end
                            end
                        end
                        if targetPolice ~= -1 then
                            lastPolicePrompt = GetGameTimer()
                            TriggerServerEvent('ducratif_ai:police:requestStop', targetPolice)
                        end
                    end
                else
                    policeNearTimer = 0
                end

                -- player tries to steer or exit
                if aiActive then
                    DisableControlAction(0, 59, true)  -- steer
                    DisableControlAction(0, 60, true)  -- steer alt
                    DisableControlAction(0, 71, true)  -- accelerate
                    DisableControlAction(0, 72, true)  -- brake
                    DisableControlAction(0, 75, true)  -- exit vehicle
                    DisableControlAction(27, 75, true)
                    if IsDisabledControlJustPressed(0, 71) or IsDisabledControlJustPressed(0, 72) or IsDisabledControlJustPressed(0, 59) or IsDisabledControlJustPressed(0, 60) or IsDisabledControlJustPressed(0, 75) then
                        BeginTextCommandThefeedPost('STRING')
                        AddTextComponentSubstringPlayerName("~r~ATTENTION: Conduite IA en cours. Utilisez /" .. Config.CommandStop .. " pour arrêter.")
                        EndTextCommandThefeedPostTicker(true, false)
                    end
                end

                ::continue_loop::
            end
        end
    end
end)

-- Police driver receive request (one-time)
RegisterNetEvent('ducratif_ai:police:requestStopClient', function(targetName)
    -- show non-intrusive prompt; press G to confirm
    local show = true
    CreateThread(function()
        local start = GetGameTimer()
        while show and (GetGameTimer() - start < 8000) do
            Wait(0)
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName('Appuyer ~INPUT_VEH_PUSHBIKE_SPRINT~ pour demander l\'arrêt de l\'IA de ~b~'..(targetName or 'véhicule')..'~s~.')
            EndTextCommandDisplayHelp(0, false, false, 1)
            if IsControlJustPressed(0, 21) then -- G default sprint on vehicle
                -- send event to target to stop smoothly
                TriggerEvent('chat:addMessage', { args = {'POLICE', 'Demande envoyée.'} })
                TriggerServerEvent('ducratif_ai:forwardStopToTarget') -- simplified; not mapping target id for abuse prevention
                show = false
            end
        end
    end)
end)

-- Stop forward (broadcast to nearby AI — simplified)
RegisterNetEvent('ducratif_ai:forwardStop')
AddEventHandler('ducratif_ai:forwardStop', function()
    if aiActive then
        stopAutopilot('Demande police: arrêt de sécurité.')
    end
end)

RegisterNetEvent('ducratif_ai:ui:enabled', function(plate, enabled)
    if currentPlate == plate then
        uiState.enabled = enabled
    end
end)

-- Item use UI (simple via ox_lib dialogs)
RegisterNetEvent('ducratif_ai:item:use', function(kind)
    if not isDriver() then return end
    local veh = getVehiclePedIsIn()
    local plate = getPlate(veh)
    if plate == '' then return end
    if kind == 'single' then
        local input = lib:inputDialog('Module IA - Réparation 100%', {
            { type='select', label='Option à restaurer', options = {
                {label='Mode de conduite', value='driving_mode'},
                {label='Limitateur', value='limiter'},
                {label='Régulateur', value='cruise'},
                {label='Évitement collisions', value='collision_avoid'}
            }}
        })
        if not input then return end
        ESX.TriggerServerCallback('ducratif_ai:item:consume', function(ok)
            if ok then
                durability[input[1]] = 100
                successNotify('Option restaurée à 100%.')
            end
        end, kind, plate, input[1])
    else
        ESX.TriggerServerCallback('ducratif_ai:item:consume', function(ok)
            if ok then
                if kind == 'premium' then
                    for k,_ in pairs(durability) do durability[k] = math.max(durability[k], 50) end
                    successNotify('Toutes les options restaurées à 50%.')
                else
                    for k,_ in pairs(durability) do durability[k] = 100 end
                    successNotify('Toutes les options restaurées à 100%.')
                end
            end
        end, kind, plate, nil)
    end
end)

RegisterNetEvent('ducratif_ai:item:applied', function(kind, plate, option)
    -- no-op client confirm
end)

-- Durability consumption loop
CreateThread(function()
    local lastCoords = nil
    while true do
        Wait(1000)
        if aiActive then
            local veh = getVehiclePedIsIn()
            if veh ~= 0 then
                if Config.ConsumptionMode == 'time' then
                    local step = 100 / (Config.ConsumptionTimeMinutes * 60)
                    for k,v in pairs(durability) do
                        if (k == 'limiter' and uiState.limiter_enabled) or (k == 'cruise' and uiState.cruise_enabled) or (k == 'driving_mode') or (k == 'collision_avoid' and uiState.collision_avoid_enabled) then
                            durability[k] = math.max(0, v - step)
                        end
                    end
                else
                    local pos = GetEntityCoords(veh)
                    if lastCoords then
                        local dist = #(pos - lastCoords) -- meters
                        local perKm = 100 / (Config.ConsumptionPerKm * 1000.0)
                        for k,v in pairs(durability) do
                            if (k == 'limiter' and uiState.limiter_enabled) or (k == 'cruise' and uiState.cruise_enabled) or (k == 'driving_mode') or (k == 'collision_avoid' and uiState.collision_avoid_enabled) then
                                durability[k] = math.max(0, v - dist * perKm)
                            end
                        end
                    end
                    lastCoords = pos
                end

                for k,v in pairs(durability) do
                    if v <= 0 then
                        if k == 'driving_mode' then
                            -- fallback to souple or stop?
                            uiState.driving_mode = 'souple'
                        elseif k == 'limiter' then
                            uiState.limiter_enabled = false
                        elseif k == 'cruise' then
                            uiState.cruise_enabled = false
                        elseif k == 'collision_avoid' then
                            uiState.collision_avoid_enabled = false
                        end
                        BeginTextCommandThefeedPost('STRING')
                        AddTextComponentSubstringPlayerName('~y~Module épuisé: '..k..' (utilisez un Module IA).')
                        EndTextCommandThefeedPostTicker(true, false)
                        durability[k] = 0.1 -- avoid spamming
                    end
                end
            end
        end
    end
end)

-- Basic anomaly checks (engine health, fire, heavy collision) -> stop IA
--CreateThread(function()
--    while true do
--        Wait(500)
--        if aiActive then
--            local veh = getVehiclePedIsIn()
--            if veh ~= 0 then
--                local eng = GetVehicleEngineHealth(veh)
--                if eng <= 100.0 or IsEntityOnFire(veh) then
--                    stopAutopilot('~r~Anomalie moteur/incendie. IA coupée.')
--                end
--                -- Check recent collision using speed drop?
--                -- (Simplified) If player is ragdolled or big decel -> alert
--                if HasEntityCollidedWithAnything(veh) then
--                    notify('Choc détecté ! Appelez les secours.')
--                end
--            end
--        end
--    end
--end)

-- Basic anomaly checks (engine health, fire, heavy collision) -> stop IA
CreateThread(function()
    while true do
        Wait(500)
        if aiActive then
            local veh = getVehiclePedIsIn()
            if veh ~= 0 then
                local eng = GetVehicleEngineHealth(veh)
                if eng <= 100.0 or IsEntityOnFire(veh) then
                    stopAutopilot('~r~Anomalie moteur/incendie. IA coupée.')
                end

                -- Détection de choc -> stop IA + overlay + verrouillage 10s
                if HasEntityCollidedWithAnything(veh) and not crashLock then
                    crashLock = true

                    -- Stop IA proprement
                    stopAutopilot('~r~Choc détecté. IA coupée.')

                    -- Ouvre l’overlay (10s) SANS focus (pas de souris)
                    SendNUIMessage({ type = 'crash:open', seconds = 10 })
                    SetNuiFocus(false, false)

                    -- Verrouille les actions pendant 10s (failsafe côté client)
                    local endAt = GetGameTimer() + 10000
                    CreateThread(function()
                        while crashLock and GetGameTimer() < endAt do
                            Wait(0)
                            DisableAllControlActions(0)
                            DisableAllControlActions(1)
                            DisableAllControlActions(2)
                        end
                        -- Sécurité si l'UI n'a pas répondu
                        if crashLock then
                            crashLock = false
                            SetNuiFocus(false, false)
                            SendNUIMessage({ type = 'crash:close' })
                        end
                    end)
                end
            end
        end
    end
end)


RegisterNUICallback('crash:done', function(_, cb)
    -- ferme le focus et libère les contrôles
    crashLock = false
    SetNuiFocus(false, false)
    cb(true)
end)


-- Block attempts to start AI inside forbidden zone
AddEventHandler('onResourceStart', function(res)
    if res == GetCurrentResourceName() then
        -- nothing
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
