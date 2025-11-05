--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local bossAlive = false
local bossCooldown = 0
local zombieKills = {}
local spawnedZombies = {}
local totalZombies = 0
local zombiesKilled = 0


RegisterNetEvent('zombie:infectPlayer')
AddEventHandler('zombie:infectPlayer', function()
    local src = source
    TriggerClientEvent('zombie:applyInfection', src)
end)

--=========================================================
--=========================================================
--=========================================================

RegisterNetEvent('zombie:updateAntiUses')
AddEventHandler('zombie:updateAntiUses', function(uses)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if uses <= 0 then
        xPlayer.removeInventoryItem(Config.AntiZombieItem.name, 1)
    end
end)

--=========================================================
--=========================================================
--=========================================================

CreateThread(function()
    Wait(5000) -- on laisse le temps au serveur de bien se charger (5s)
    for _, playerId in ipairs(GetPlayers()) do
        --print("[ZONE] Demande de spawn envoyée au serveur.")
        TriggerClientEvent('zone_infecter:spawnZombies', playerId)
    end
end)


--RegisterCommand('spawnzombies', function(source)
--    TriggerClientEvent('zone_infecter:spawnZombies', source)
--end, true)

--=========================================================
--=========================================================
--=========================================================

function spawnZombies()
    for level, data in pairs(Config.Zombies) do
        if level ~= "boss" and level ~= "animal" then
            for i = 1, 100 do
                local offset = vector3(math.random(-100, 100), math.random(-100, 100), 0)
                local pos = Config.Zone.center + offset
                local ped = spawnZombie(GetHashKey(data.model), pos, data.health)
                table.insert(spawnedZombies, ped)
            end
        end
    end

    -- Boss
    if not bossAlive and (os.time() - bossCooldown > Config.Zone.bossCooldown) then
        local bossData = Config.Zombies.boss
        local offset = vector3(math.random(-80, 80), math.random(-80, 80), 0)
        local pos = Config.Zone.center + offset
        local ped = spawnZombie(GetHashKey(bossData.model), pos, bossData.health, bossData.scale)
        bossAlive = true
        table.insert(spawnedZombies, ped)

        CreateThread(function()
            while DoesEntityExist(ped) and not IsEntityDead(ped) do
                Wait(1000)
            end
            if IsEntityDead(ped) then
                bossAlive = false
                bossCooldown = os.time()
                -- Drop item ici (ex: GiveItemToKiller)
            end
        end)
    end
end

--=========================================================
--=========================================================
--=========================================================

AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        local attacker = args[2]

        if DoesEntityExist(victim) and IsPedAPlayer(attacker) then
            if IsEntityDead(victim) then
                local playerId = NetworkGetEntityOwner(attacker)
                local xPlayer = ESX.GetPlayerFromId(playerId)
                if not xPlayer then return end

                for lvl, data in pairs(Config.Zombies) do
                    if data.model and GetEntityModel(victim) == GetHashKey(data.model) then
                        zombieKills[playerId] = zombieKills[playerId] or {}
                        zombieKills[playerId][lvl] = (zombieKills[playerId][lvl] or 0) + 1

                        local remaining = data.killsRequired - zombieKills[playerId][lvl]

                        TriggerClientEvent('ox_lib:notify', playerId, {
                            title = '🧟 Zombies',
                            description = ('Niveau %s : encore %d kills pour une clé'):format(lvl, remaining),
                            type = 'inform',
                            duration = 3000
                        })


                        if zombieKills[playerId][lvl] >= data.killsRequired then
                            zombieKills[playerId][lvl] = 0
                            xPlayer.addInventoryItem(data.key, 1)
                            TriggerClientEvent('ox_lib:notify', playerId, {
                                type = 'success',
                                title = 'Zombie',
                                description = ('Clé obtenue : %s'):format(data.key)
                            })
                        end
                        break
                    end
                end
            end
        end
    end
end)


--=========================================================
--=========================================================
--=========================================================

RegisterNetEvent('zone_infecter:restoreSkin')
AddEventHandler('zone_infecter:restoreSkin', function(model)
    local src = source
    local pedModel = model or GetHashKey('mp_m_freemode_01')
    TriggerClientEvent('esx_skin:loadSkin', src, {model = pedModel})
end)

--=========================================================
--=========================================================
--=========================================================

RegisterNetEvent('zone_infecter:zombieKilled', function(model)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    -- Vérifie les zombies normaux
    for i, data in pairs(Config.Zombies) do
        if type(i) == "number" and data.model and GetHashKey(data.model) == model then
            zombieKills[src] = zombieKills[src] or {}
            zombieKills[src][i] = (zombieKills[src][i] or 0) + 1

            local remaining = data.killsRequired - zombieKills[src][i]

            TriggerClientEvent('ox_lib:notify', src, {
                title = '🧟 Zombies',
                description = ('Niveau %d : encore %d kills pour une clé'):format(i, remaining),
                type = 'inform',
                duration = 3000
            })

            if zombieKills[src][i] >= data.killsRequired then
                zombieKills[src][i] = 0
                xPlayer.addInventoryItem(data.key, 1)
                TriggerClientEvent('ox_lib:notify', src, {
                    type = 'success',
                    title = 'Clé obtenue',
                    description = ('Tu as reçu une clé niveau %d : %s'):format(i, data.key)
                })
            end

            -- Vérifier si tous les zombies normaux sont morts
            if zombiesKilled >= totalZombies then
                print("[ZONE] Tous les zombies normaux sont morts, respawn dans 30s.")

                CreateThread(function()
                    Wait(30000) -- délai avant nouvelle vague (30s)
                    for _, playerId in ipairs(GetPlayers()) do
                        TriggerClientEvent('zone_infecter:spawnZombies', playerId)
                        TriggerClientEvent('ox_lib:notify', playerId, {
                            title = '🧟 Nouvelle vague',
                            description = "Une nouvelle horde de zombies approche !",
                            type = 'warning',
                            duration = 5000
                        })
                    end
                end)
            end

            return -- on sort après avoir traité un zombie normal
        end
    end

    -- Vérifie si c’est le boss
    if model == GetHashKey(Config.Zombies.boss.model) then
        xPlayer.addInventoryItem(Config.Zombies.boss.key, 1)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            title = 'Boss',
            description = ('Tu as vaincu le boss et obtenu la clé : %s'):format(Config.Zombies.boss.key),
            duration = 10000
        })

        -- Lancer la suite dans un thread pour pouvoir Wait
        CreateThread(function()
            Wait(10000) -- 10 secondes

            for _, playerId in ipairs(GetPlayers()) do
                --print("[Boss mort] Nouvelle vague de zombies envoyée.")
                TriggerClientEvent('zone_infecter:spawnZombies', playerId)

                TriggerClientEvent('ox_lib:notify', playerId, {
                    title = '🧟 MASSE Zombies',
                    description = "Le boss a déclenché une nouvelle vague !",
                    type = 'error',
                    duration = 5000
                })
            end
        end)
    end
end)



--=========================================================
--=========================================================
--=========================================================


-- Quand tu spawns les zombies, set totalZombies
-- Exemple :
-- totalZombies = totalSpawns

RegisterServerEvent('zone_infecter:zombieKilled')
AddEventHandler('zone_infecter:zombieKilled', function()
    zombiesKilled += 1
end)

RegisterServerEvent('zone_infecter:requestZombieProgress')
AddEventHandler('zone_infecter:requestZombieProgress', function()
    local src = source
    if totalZombies <= 0 then return end

    local progress = math.floor((zombiesKilled / totalZombies) * 100)
    local remaining = math.max(0, 100 - progress)

    TriggerClientEvent('zone_infecter:showProgressNotify', src, remaining)

    --print(("[Progress] %d zombies tués sur %d (il reste %d%%)"):format(zombiesKilled, totalZombies, remaining))
end)


-----
RegisterNetEvent('zone_infecter:setTotalZombies')
AddEventHandler('zone_infecter:setTotalZombies', function(count)
    totalZombies = count
    zombiesKilled = 0
end)


------
AddEventHandler('playerJoining', function(playerId)
    local ped = GetPlayerPed(playerId)
    local coords = GetEntityCoords(ped)
    local dist = #(coords - Config.Zone.center)

    if dist < (Config.Zone.radius + 500.0) then
        --print("[ZONE] Joueur proche de la zone, envoi spawnZombies.")
        TriggerClientEvent('zone_infecter:spawnZombies', playerId)
    else
        return;
        --print("[ZONE] Joueur trop loin, pas de spawn immédiat.")
    end
end)




--=========================================================
--=========================================================
--=========================================================

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
