--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
local Config = Config

local activeCooldowns = {} -- [atmKey] = expireUnix

local function secondsLeft(untilTs)
    local now = os.time()
    return math.max(0, untilTs - now)
end

local function logAction(src, data)
    -- data: outcome, reason, reward, atm_model, coords{x,y,z}, item_required(bool), item_name
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer and xPlayer.identifier or 'unknown'
    local name = xPlayer and xPlayer.getName() or ('src_'..tostring(src))

    local rp_rank = MySQL.scalar.await('SELECT rp_rank FROM users WHERE identifier = ?', { identifier }) or 0

    MySQL.insert.await([[
        INSERT INTO atm_robbery_logs
        (identifier, name, rp_rank, atm_model, atm_x, atm_y, atm_z, outcome, reward, item_required, item_name, reason)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ]], {
        identifier, name, rp_rank,
        data.atm_model or 'unknown',
        (data.coords and data.coords.x) or 0.0,
        (data.coords and data.coords.y) or 0.0,
        (data.coords and data.coords.z) or 0.0,
        data.outcome or 'denied',
        data.reward or 0,
        data.item_required and 1 or 0,
        data.item_name or nil,
        data.reason or nil
    })
end

local function parseKeyToVec3(key)
    local x,y,z = key:match('([^,]+),([^,]+),([^,]+)')
    return vec3(tonumber(x) or 0.0, tonumber(y) or 0.0, tonumber(z) or 0.0)
end

lib.callback.register('ducratif_atmrob:canStart', function(source, atmKey, atmModel, coords)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then
        return false, 'Joueur introuvable.'
    end

    -- Cooldown
    local cd = activeCooldowns[atmKey]
    if cd and os.time() < cd then
        local left = secondsLeft(cd)
        return false, 'ATM sécurisé. Réessayez plus tard.', left
    end

    -- Check rang
    if Config.RequireRank then
        local rank = MySQL.scalar.await('SELECT rp_rank FROM users WHERE identifier = ?', { xPlayer.identifier })
        rank = tonumber(rank) or 0
        if rank < (Config.MinRank or 10) then
            -- Log refus
            logAction(src, {
                outcome = 'denied',
                reason = 'rank_low',
                atm_model = atmModel,
                coords = coords,
                item_required = Config.RequireItem,
                item_name = Config.RequiredItem
            })
            return false, ('Niveau requis: %d (ton niveau: %d)'):format(Config.MinRank or 10, rank)
        end
    end

    -- Check item
    if Config.RequireItem then
        local count = exports.ox_inventory:Search(src, 'count', Config.RequiredItem)
        if (count or 0) < 1 then
            logAction(src, {
                outcome = 'denied',
                reason = 'missing_item',
                atm_model = atmModel,
                coords = coords,
                item_required = true,
                item_name = Config.RequiredItem
            })
            --return false, ('Tu as besoin de: %s'):format(Config.RequiredItem)
            return false, ("Tu n'a pas le matériel MDR LOLI LOL !"):format(Config.RequiredItem)
        end
    end

    return true
end)

RegisterNetEvent('ducratif_atmrob:onSuccess', function(atmKey)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local coords = parseKeyToVec3(atmKey)
    local reward = tonumber(Config.RewardBlackMoney) or 5000

    -- Consommer item si configuré
    local consumed = false
    if Config.RequireItem and Config.ConsumeItem then
        consumed = exports.ox_inventory:RemoveItem(src, Config.RequiredItem, 1, nil, nil, true) -- strict
        if not consumed then
            -- Si pour une raison quelconque on ne peut pas consommer, ne donne pas la récompense
            TriggerClientEvent('ox_lib:notify', src, {title='ATM', description="Erreur d'inventaire. Récompense annulée.", type='error'})
            logAction(src, {
                outcome = 'cancel',
                reason = 'consume_failed',
                atm_model = 'unknown',
                coords = {x=coords.x, y=coords.y, z=coords.z},
                item_required = true,
                item_name = Config.RequiredItem
            })
            return
        end
    end

    xPlayer.addAccountMoney('black_money', reward, 'ATM Robbery')
    TriggerClientEvent('ox_lib:notify', src, {title='ATM', description=('Braquage réussi ! +$%s en argent sale.'):format(ESX.Math.GroupDigits(reward)), type='success'})

    -- Cooldown aussi en cas de réussite
    local minutes = Config.SuccessCooldownMinutes or 20
    activeCooldowns[atmKey] = os.time() + (minutes * 60)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'ATM',
        description = ('ATM verrouillé %d min.'):format(minutes),
        type = 'inform'
    })


    logAction(src, {
        outcome = 'success',
        reason = 'minigame_success',
        reward = reward,
        atm_model = 'unknown',
        coords = {x=coords.x, y=coords.y, z=coords.z},
        item_required = Config.RequireItem,
        item_name = Config.RequiredItem
    })
end)

RegisterNetEvent('ducratif_atmrob:onFail', function(atmKey, reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local coords = parseKeyToVec3(atmKey)
    local minutes = Config.FailCooldownMinutes or 10
    activeCooldowns[atmKey] = os.time() + (minutes * 60)

    TriggerClientEvent('ox_lib:notify', src, {title='ATM', description=('Échec du braquage. ATM verrouillé %d min.'):format(minutes), type='error'})

    logAction(src, {
        outcome = 'fail',
        reason = reason or 'minigame_failed',
        reward = 0,
        atm_model = 'unknown',
        coords = {x=coords.x, y=coords.y, z=coords.z},
        item_required = Config.RequireItem,
        item_name = Config.RequiredItem
    })
end)

RegisterNetEvent('ducratif_atmrob:logCancel', function(atmKey, reason)
    local src = source
    local coords = parseKeyToVec3(atmKey)
    logAction(src, {
        outcome = 'cancel',
        reason = reason or 'player_cancelled',
        reward = 0,
        atm_model = 'unknown',
        coords = {x=coords.x, y=coords.y, z=coords.z},
        item_required = Config.RequireItem,
        item_name = Config.RequiredItem
    })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
