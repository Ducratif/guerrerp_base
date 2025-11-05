--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local infected = false
local antiUses = 0
local antiEndTime = 0
local hasProtection = false
local originalModel = nil
local infectionTimer = nil
local recentlyCured = false
local protectionThread = nil
local hasEnteredZone = false
local hasApproachedZone = false
local hasExitedZone = false


--print("Config.Zone:", Config and Config.Zone)
--print(Config.Zone.nombreZombie)

function PlayApprocheSound()
    print("playApproche lancer")
    SendNUIMessage({ type = "playApproche" })
    print("playApproche lancer ->")
end

function PlayEntreSound()
    print("playEntre lancer")
    SendNUIMessage({ type = "playEntre" })
    print("playEntre lancer ->")
end

function PlayAlertSound(soundName, soundRef)
    PlaySoundFrontend(-1, soundName, soundRef or "HUD_AWARDS", true)
end


CreateThread(function()
    local blip = AddBlipForCoord(Config.Zone.center)
    SetBlipSprite(blip, Config.Zone.blip.sprite)
    SetBlipColour(blip, Config.Zone.blip.color)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Zone.blip.label)
    EndTextCommandSetBlipName(blip)
end)

--==================================================
--==================================================
--==================================================

local lastProgressNotify = 0

CreateThread(function()
    while true do
        Wait(1000)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local zonePos = Config.Zone.center
        local zoneRadius = Config.Zone.radius
        local dist = #(coords - zonePos)

        -- Approche de la zone (dans un rayon de +300m par rapport au bord)
        if not hasApproachedZone and dist < (zoneRadius + 300.0) and dist > zoneRadius then
            hasApproachedZone = true
            lib.notify({
                title = '⚠️ Zone Infectée Proche',
                description = 'Vous approchez d\'une zone infectée, soyez prêt !',
                type = 'warning'
            })
            --SendNUIMessage({
            --    action = 'playApproach',
            --    url = 'nui://zone_infecter/html/approche_zone.mp3'
            --})

            --PlayApprocheSound()
            -- À l’approche (300m)
            --PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true)
            --PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", true)

        end

        if dist < zoneRadius then
            -- Entrée dans la zone
            if not hasEnteredZone then
                hasEnteredZone = true
                lib.notify({
                    title = '☣️ Zone Infectée',
                    description = 'Vous êtes entré dans une zone infectée !',
                    type = 'error'
                })
                -- À l’entrée de la zone
                --SendNUIMessage({
                --    action = 'playEnter',
                --    url = 'nui://zone_infecter/html/entre_zone.mp3'
                --})

                --PlayEntreSound()
                --PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true)


            end

            if not hasProtection then
                StartScreenEffect("DrugsMichaelAliensFightIn", 0, true)
                ApplyDamageToPed(player, 5, false)
            end

            if not infected and not hasProtection and not recentlyCured then
                TriggerServerEvent('zombie:infectPlayer')
                infected = true
            end

            local now = GetGameTimer()
            if now - lastProgressNotify >= 5000 then
                TriggerServerEvent('zone_infecter:requestZombieProgress')
                lastProgressNotify = now
            end
        else
    -- Notification et stop musique uniquement si on vient de sortir
            if hasEnteredZone then
                   lib.notify({
                       title = '☣️ SORTIE Zone Infectée',
                       description = 'PAUVRE TYPE, T\'AS DE LA CHANCE D\'ÊTRE EN VIE !',
                       type = 'error',
                       duration = 10000
                   })
               
                   --SendNUIMessage({
                   --    action = 'stopAll'
                   --})
               
                   ClearTimecycleModifier()
                   infected = false
                   hasEnteredZone = false
                   hasExitedZone = true
               end
            
               -- Réinitialiser notification d’approche si assez éloigné
               if hasApproachedZone and dist > (zoneRadius + 350.0) then
                   hasApproachedZone = false
               end
            
               -- Reset l’état de sortie quand on revient dans la zone d’approche
               if hasExitedZone and dist < (zoneRadius + 300.0) then
                   hasExitedZone = false
               end
            end

    end
end)


--==================================================
--==================================================
--==================================================
RegisterNetEvent('zone_infecter:showProgressNotify', function(percent)
    lib.notify({
        title = '🧟 Progrès de la zone',
        description = ('Il reste encore ~%d%%~ de zombies à éliminer.'):format(percent),
        type = 'inform'
    })
end)


--==================================================
--==================================================
--==================================================

RegisterNetEvent('zombie:applyInfection')
AddEventHandler('zombie:applyInfection', function()
    
    local player = PlayerPedId()
    --originalModel = GetEntityModel(player) -- ✅ Sauvegarde modèle
    originalModel = GetEntityModel(PlayerPedId()) -- sauvegarde

    local model = GetHashKey('u_m_y_zombie_01')
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    SetPlayerModel(PlayerId(), model)
    SetEntityVisible(PlayerPedId(), true, false)

    infected = true
    infectionTimer = SetTimeout(Config.Zone.infectionTime * 1000, function()
        SetEntityHealth(PlayerPedId(), 0)
    end)
end)


--==================================================
--==================================================
--==================================================

function StartProtectionTimer(duration, uses)
    if type(protectionThread) == "table" and protectionThread.cancel then
        protectionThread:cancel()
        protectionThread = nil
    end

    local endTime = GetGameTimer() + (duration * 1000)
    hasProtection = true
    antiUses = uses - 1
    antiEndTime = endTime

    lib.notify({
        title = '🧪 Anti-Zombie',
        description = 'Protection activée pour 10 minutes',
        type = 'inform'
    })

    -- Simple thread, pas annulable : on le démarre mais on n’essaye pas de le cancel ensuite
    protectionThread = true -- juste pour bloquer les relances pendant qu’il tourne

    CreateThread(function()
        local lastNotify = 0

        while GetGameTimer() < endTime do
            local now = GetGameTimer()
            if now - lastNotify >= 10000 then
                local remaining = math.ceil((endTime - now) / 1000)
                local min = math.floor(remaining / 60)
                local sec = remaining % 60

                lib.notify({
                    title = '🧪 Anti-Zombie',
                    description = ('Protection restante : %02d:%02d'):format(min, sec),
                    type = 'inform'
                })

                lastNotify = now
            end
            Wait(1000)
        end

        hasProtection = false
        protectionThread = nil

        if antiUses > 0 then
            TriggerServerEvent('zombie:updateAntiUses', antiUses)
            lib.notify({
                title = '🧪 Anti-Zombie',
                description = 'Encore des utilisations disponibles.',
                type = 'inform'
            })
        else
            lib.notify({
                title = '🧪 Anti-Zombie',
                description = 'Protection épuisée.',
                type = 'error'
            })
        end
    end)
end


--==================================================
--==================================================
--==================================================

--RegisterNetEvent('zone_infecter:spawnZombies', function()
--    print("[ZONE] Réception spawnZombies - début du spawn.")
--    print("[ZONE DEBUG] Config.Zone.center:", Config.Zone.center)
--    print("[ZONE DEBUG] Nombre de zombies prévu:", Config.Zone.nombreZombie)
--    local count = 0
--
--    for level, data in pairs(Config.Zombies) do
--        if level ~= "boss" then
--            for i = 1, Config.Zone.nombreZombie do
--                local offset = vector3(math.random(-100, 100), math.random(-100, 100), 0)
--                local pos = Config.Zone.center + offset
--                getGroundPosition(pos, function(finalPos)
--                    spawnClientZombie(data.model, finalPos, data.health)
--                end)
--                count += 1
--            end
--        end
--    end
--
--    -- Boss
--    local boss = Config.Zombies.boss
--    local offset = vector3(math.random(-80, 80), math.random(-80, 80), 0)
--    local pos = Config.Zone.center + offset
--    getGroundPosition(pos, function(finalPos)
--        spawnClientZombie(boss.model, finalPos, boss.health, boss.scale)
--    end)
--
--    count += 1
--    TriggerServerEvent('zone_infecter:setTotalZombies', count)
--    print("Total envoyé :", count)
--end)

RegisterNetEvent('zone_infecter:spawnZombies', function()
    --print("[ZONE] Réception spawnZombies - début du spawn.")
    --print("[ZONE DEBUG] Config.Zone.center:", Config.Zone.center)
    --print("[ZONE DEBUG] Nombre de zombies prévu (total):", Config.Zone.nombreZombie)

    local count = 0

    -- Récupérer uniquement les modèles normaux (sans boss)
    local zombieModels = {}
    for level, data in pairs(Config.Zombies) do
        if level ~= "boss" then
            table.insert(zombieModels, data)
        end
    end

    -- Répartir le quota total de zombies entre les modèles
    local quotaParModel = math.floor(Config.Zone.nombreZombie / #zombieModels)

    for _, data in ipairs(zombieModels) do
        for i = 1, quotaParModel do
            local offset = vector3(math.random(-100, 100), math.random(-100, 100), 0)
            local pos = Config.Zone.center + offset
            getGroundPosition(pos, function(finalPos)
                spawnClientZombie(data.model, finalPos, data.health)
            end)
            count += 1
        end
    end

    -- Spawn du boss
    local boss = Config.Zombies.boss
    local offset = vector3(math.random(-80, 80), math.random(-80, 80), 0)
    local pos = Config.Zone.center + offset
    getGroundPosition(pos, function(finalPos)
        spawnClientZombie(boss.model, finalPos, boss.health, boss.scale)
    end)

    count += 1

    -- Envoyer le total au serveur
    TriggerServerEvent('zone_infecter:setTotalZombies', count)
    --print("Total envoyé :", count)
end)



function spawnClientZombie(modelName, pos, health, scale)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1) end

    local ped = CreatePed(4, model, pos.x, pos.y, pos.z, math.random(0, 360), true, true)
    SetEntityHealth(ped, health)
    SetEntityMaxHealth(ped, health)

    if scale then
        SetEntityCoords(ped, GetEntityCoords(ped)) -- no-op visuel
    end

    SetPedAsEnemy(ped, true)
    TaskWanderStandard(ped, 10.0, 10)
    SetPedCombatAttributes(ped, 46, true)
    SetPedCombatRange(ped, 2)
    SetPedAlertness(ped, 3)
    SetPedSeeingRange(ped, 70.0)
    SetPedHearingRange(ped, 60.0)
    SetPedFleeAttributes(ped, 0, false)


    -- ✅ COMBAT AGGRO
    CreateThread(function()
        while DoesEntityExist(ped) and not IsEntityDead(ped) do
            local player = PlayerPedId()
            local dist = #(GetEntityCoords(ped) - GetEntityCoords(player))
            if dist < 35.0 then
                TaskCombatPed(ped, player, 0, 16)
            end
            Wait(3000)
        end
    end)

    -- ✅ KILL CHECK
    CreateThread(function()
        while DoesEntityExist(ped) do
            Wait(100)
            if IsEntityDead(ped) then
                local killer = GetPedSourceOfDeath(ped)
                if killer == PlayerPedId() then
                    TriggerServerEvent('zone_infecter:zombieKilled', GetEntityModel(ped))
                end
                break
            end
        end
    end)
end


function getGroundPosition(pos, cb)
    local tries = 0
    local foundGround, groundZ = false, 0.0
    local x, y = pos.x, pos.y
    local z = pos.z + 30.0 -- en hauteur temporaire

    CreateThread(function()
        while not foundGround and tries < 20 do
            foundGround, groundZ = GetGroundZFor_3dCoord(x, y, z, 0.0)
            tries += 1
            Wait(10)
        end

        if foundGround then
            --print("[ZONE DEBUG] Zombie spawn trouvé au sol :", groundZ)
            cb(vector3(x, y, groundZ + 0.5))
        else
            --print("[ZONE DEBUG] Zombie spawn fallback utilisé !")
            cb(vector3(x, y, pos.z + 1.0)) -- léger +1.0 pour éviter qu’il soit coincé
        end
    end)
end




--==================================================
--==================================================
--==================================================

exports('useAntiZombie', function(item, slot)
    if not item or not item.name then
        return lib.notify({title = 'Erreur', description = 'Item invalide', type = 'error'})
    end

    if hasProtection then
        return lib.notify({title = '🧪 Anti-Zombie', description = 'Déjà sous protection', type = 'warning'})
    end

     -- ✅ Supprimer l’item utilisé
     TriggerServerEvent('zone_infecter:removeItem', item.name, 1)

    lib.notify({
        title = '🧪 Anti-Zombie',
        description = 'Protection activée pour 10 minutes',
        type = 'inform'
    })

    StartProtectionTimer(Config.AntiZombieItem.duration, Config.AntiZombieItem.uses)
end)


--==================================================
--==================================================
--==================================================

exports('useCurePill', function(item, slot)
    local player = PlayerPedId()

    -- autoriser si infecté OU si skin zombie
    local currentModel = GetEntityModel(player)

     -- ✅ Supprimer l’item utilisé
     TriggerServerEvent('zone_infecter:removeItem', item.name, 1)

    -- On laisse toujours utiliser la pilule
    lib.notify({
        title = '💊 Pilule prise',
        description = 'Tentative de rétablissement en cours...',
        type = 'inform'
    })


    -- Animation
    RequestAnimDict("mp_suicide")
    while not HasAnimDictLoaded("mp_suicide") do Wait(10) end
    TaskPlayAnim(player, "mp_suicide", "pill", 8.0, -8.0, -1, 49, 0, false, false, false)
    Wait(2000)

    infected = false
    hasProtection = false
    recentlyCured = true

    if infectionTimer then
        ClearTimeout(infectionTimer)
        infectionTimer = nil
    end

    -- Supprimer effets visuels
    StopScreenEffect("DrugsMichaelAliensFightIn")
    ClearTimecycleModifier()
    ResetPedMovementClipset(player, 0.0)
    ClearAllPedProps(player)
    ClearPedBloodDamage(player)
    ClearPedTasksImmediately(player)
    SetEntityVisible(player, true, false)


    -- Restaurer le skin sauvegardé via esx_skin
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin then
            -- Charger le modèle par défaut (freemode)
            local model = skin.sex == 0 and 'mp_m_freemode_01' or 'mp_f_freemode_01'
            local modelHash = GetHashKey(model)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do Wait(10) end
        
            SetPlayerModel(PlayerId(), modelHash)
            SetModelAsNoLongerNeeded(modelHash)
        
            -- Attendre que le modèle soit bien appliqué
            Wait(500)
        
            -- Charger le skin réel par-dessus le freemode
            TriggerEvent('skinchanger:loadSkin', skin)
        end
    
        -- Forcer la visibilité (au cas où)
        Wait(500)
        SetEntityVisible(PlayerPedId(), true, false)
        ClearPedTasksImmediately(PlayerPedId())
    
        lib.notify({title = '✅ Guéri', description = 'Apparence restaurée.', type = 'success'})
    end)


end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
