--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

local json = json or {}
local function JEncode(o) return json.encode(o) end
local function JDecode(s) if not s or s == '' then return {} end return json.decode(s) end
-- Cast robuste tinyint(1) / bool -> int 0/1
local function asInt(v)
    if v == nil then return 0 end
    local t = type(v)
    if t == 'boolean' then return v and 1 or 0 end
    if t == 'number'  then return v end
    if t == 'string'  then return tonumber(v) or 0 end
    return 0
end


-- Utils
local function logToDiscord(title, description, color, data)
    if not Config.WebhookURL or Config.WebhookURL == '' then return end
    local embeds = {{
        title = title,
        description = description,
        color = color or 3066993,
        footer = { text = 'ducratif_ai_drive' },
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
    }}
    if data then embeds[1].fields = {}
        for k,v in pairs(data) do
            table.insert(embeds[1].fields, { name = tostring(k), value = '```'..tostring(v)..'```', inline = true })
        end
    end
    PerformHttpRequest(Config.WebhookURL, function() end, 'POST', JEncode({ username = 'IA Drive', embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

local function isAdmin(xPlayer)
    local group = xPlayer.getGroup and xPlayer.getGroup() or 'user'
    for _,g in ipairs(Config.AdminGroups) do
        if g == group then return true end
    end
    local identifiers = xPlayer.getIdentifiers and xPlayer.getIdentifiers() or {}
    for _, id in ipairs(identifiers) do
        for __, allow in ipairs(Config.AdminIdentifiers) do
            if allow == id then return true end
        end
    end
    return false
end

local function getOwnerIdentifier(xPlayer)
    -- Par défaut on utilise xPlayer.identifier
    return xPlayer.getIdentifier and xPlayer.getIdentifier() or xPlayer.identifier
end

-- DB: ensure tables
CreateThread(function()
    -- Table principale
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS vehicle_ai (
            plate VARCHAR(20) PRIMARY KEY,
            owner_identifier VARCHAR(64) NOT NULL,
            enabled TINYINT(1) NOT NULL DEFAULT 0,
            calibrated TINYINT(1) NOT NULL DEFAULT 0,
            driving_mode ENUM('souple','rapide','violente') DEFAULT NULL,
            limiter_enabled TINYINT(1) NOT NULL DEFAULT 0,
            limiter_speed_kmh INT DEFAULT 0,
            cruise_enabled TINYINT(1) NOT NULL DEFAULT 0,
            cruise_speed_kmh INT DEFAULT 0,
            collision_avoid_enabled TINYINT(1) NOT NULL DEFAULT 0,
            -- NOUVEAU : colonnes conduite "hors-code" (achetée/active)
            lawless_enabled TINYINT(1) NOT NULL DEFAULT 0,
            lawless_active  TINYINT(1) NOT NULL DEFAULT 0,
            durability JSON NULL,
            created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        )
    ]])

    -- Migration douce si la table existe déjà mais sans les nouvelles colonnes
    MySQL.update([[
        ALTER TABLE vehicle_ai
        ADD COLUMN IF NOT EXISTS lawless_enabled TINYINT(1) NOT NULL DEFAULT 0
    ]])
    MySQL.update([[
        ALTER TABLE vehicle_ai
        ADD COLUMN IF NOT EXISTS lawless_active TINYINT(1) NOT NULL DEFAULT 0
    ]])

    -- Le reste inchangé
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS ai_history (
            id INT AUTO_INCREMENT PRIMARY KEY,
            owner_identifier VARCHAR(64) NOT NULL,
            plate VARCHAR(20) NOT NULL,
            from_label VARCHAR(64) NULL,
            to_label VARCHAR(64) NULL,
            from_x DOUBLE, from_y DOUBLE, from_z DOUBLE,
            to_x DOUBLE, to_y DOUBLE, to_z DOUBLE,
            created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        )
    ]])
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS ai_favorites (
            id INT AUTO_INCREMENT PRIMARY KEY,
            owner_identifier VARCHAR(64) NOT NULL,
            label VARCHAR(64) NOT NULL,
            x DOUBLE, y DOUBLE, z DOUBLE,
            created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        )
    ]])
    MySQL.query(([[
        CREATE TABLE IF NOT EXISTS ai_users (
            owner_identifier VARCHAR(64) PRIMARY KEY,
            fav_slots INT NOT NULL DEFAULT %d
        )
    ]]):format(Config.DefaultFavSlots))
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS ai_logs (
            id INT AUTO_INCREMENT PRIMARY KEY,
            owner_identifier VARCHAR(64) NULL,
            plate VARCHAR(20) NULL,
            action VARCHAR(64) NOT NULL,
            details TEXT NULL,
            created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        )
    ]])
end)


local function logDB(owner, plate, action, details)
    MySQL.insert('INSERT INTO ai_logs (owner_identifier, plate, action, details) VALUES (?, ?, ?, ?)', {
        owner, plate, action, details and JEncode(details) or nil
    })
end


--charX:CFX
-- trim util
local function sTrim(s)
    return (s and s:gsub('^%s*(.-)%s*$', '%1')) or ''
end
-- Ownership check robuste : espace/casse/nbsp
local function playerOwnsPlate(ownerIdentifier, plate, cb)
    -- normalise la plaque (trim + upper)
    local plateParam = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    -- récupère tout ce qui est après ":" et normalise (license:xxxx / charX:xxxx / xxxx)
    local tailRaw = ownerIdentifier:match('^[^:]+:(.+)$') or ownerIdentifier
    local tail    = tailRaw:upper()
    local charLike = ("CHAR%%%%:%s"):format(tail)  -- LIKE 'CHAR%:ABCD'

    -- Compare des versions UPPER + sans espaces normaux et NBSP (CHAR(160))
    local sql = ( "SELECT 1 FROM %s WHERE "
                .."UPPER(REPLACE(REPLACE(TRIM(%s), ' ', ''), CHAR(160), '')) = "
                .."UPPER(REPLACE(REPLACE(TRIM(?),  ' ', ''), CHAR(160), '')) "
                .."AND (UPPER(%s) = UPPER(?) OR UPPER(%s) = UPPER(?) OR UPPER(%s) LIKE ?) "
                .."LIMIT 1"
                ):format(
                    Config.OwnedVehiclesTable,
                    Config.OwnedVehiclesPlateColumn,
                    Config.OwnedVehiclesOwnerColumn,
                    Config.OwnedVehiclesOwnerColumn,
                    Config.OwnedVehiclesOwnerColumn
                )

    MySQL.scalar(sql, { plateParam, ownerIdentifier, tailRaw, charLike }, function(result)
        cb(result ~= nil)
    end)
end



-----------------------
-- Compare deux owners de manière tolérante :
--  - exact (casse ignorée)
--  - même "tail" (après les deux-points) => license:xxxx ~ char1:xxxx
local function sameOwner(a, b)
    if not a or not b then return false end
    local ua, ub = a:upper(), b:upper()
    if ua == ub then return true end
    local ta = ua:match('^[^:]+:(.+)$') or ua      -- tail a
    local tb = ub:match('^[^:]+:(.+)$') or ub      -- tail b
    return ta == tb
end

-- SELECT robuste d'une ligne vehicle_ai par plaque (insensible espaces/nbsp/casse)
local function fetchVehicleAIByPlate(plate, cb)
    local p = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''
    MySQL.single([[
        SELECT * FROM vehicle_ai
        WHERE UPPER(REPLACE(REPLACE(TRIM(plate),' ','') , CHAR(160), ''))
              = UPPER(REPLACE(REPLACE(?,        ' ', ''), CHAR(160), ''))
        LIMIT 1
    ]], { p }, function(row)
        if row then
            row.enabled                 = asInt(row.enabled)
            row.calibrated              = asInt(row.calibrated)
            row.limiter_enabled         = asInt(row.limiter_enabled)
            row.limiter_speed_kmh       = asInt(row.limiter_speed_kmh)
            row.cruise_enabled          = asInt(row.cruise_enabled)
            row.cruise_speed_kmh        = asInt(row.cruise_speed_kmh)
            row.collision_avoid_enabled = asInt(row.collision_avoid_enabled)
            row.lawless_enabled         = asInt(row.lawless_enabled)
            row.lawless_active          = asInt(row.lawless_active)
        end
        cb(row)
    end)
end



-- Get or create ai_users row
local function ensureUserRow(ownerIdentifier)
    MySQL.update('INSERT IGNORE INTO ai_users (owner_identifier, fav_slots) VALUES (?, ?)', { ownerIdentifier, Config.DefaultFavSlots })
end

-- Fetch AI record for plate
ESX.RegisterServerCallback('ducratif_ai:getVehicleAI', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return cb(nil) end

    local ownerId = getOwnerIdentifier(xPlayer)
    local p       = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    -- 1) Si une ligne existe dans vehicle_ai -> on lui fait CONFIANCE et on la renvoie telle quelle.
    fetchVehicleAIByPlate(p, function(row)
        if row then
            return cb(row)
        end

        -- 2) Pas de ligne : on autorise l'état "vierge" uniquement au vrai propriétaire
        playerOwnsPlate(ownerId, p, function(owns)
            if not owns then return cb(nil) end
            cb({
                plate = p,
                owner_identifier = ownerId,
                enabled = 0,
                calibrated = 0,
                driving_mode = nil,
                limiter_enabled = 0,
                limiter_speed_kmh = 0,
                cruise_enabled = 0,
                cruise_speed_kmh = 0,
                collision_avoid_enabled = 0,
                lawless_enabled = 0,
                lawless_active  = 0
            })
        end)
    end)
end)






-- Enable/Disable AI
RegisterNetEvent('ducratif_ai:toggleAI', function(plate, enable)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local owner = getOwnerIdentifier(xPlayer)
    local p = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    playerOwnsPlate(owner, p, function(owns)
        if not owns then
            xPlayer.showNotification('~r~Ce véhicule ne vous appartient pas.')
            return
        end

        MySQL.single('SELECT enabled FROM vehicle_ai WHERE TRIM(plate) = ? LIMIT 1', { p }, function(row)
                local price = enable and Config.PriceEnableAI or Config.PriceDisableAI
                local en = asInt(row and row.enabled)

                if enable and en == 1 then
                    xPlayer.showNotification('~y~IA déjà activée sur ce véhicule.')
                    return
                end
                if (not enable) and en == 0 then
                    xPlayer.showNotification('~y~IA déjà désactivée.')
                    return
                end

            if enable then
                if xPlayer.getMoney() < Config.PriceEnableAI then
                    xPlayer.showNotification(('~r~Il vous manque %s%s.'):format(Config.CurrencySymbol, Config.PriceEnableAI - xPlayer.getMoney()))
                    return
                end
                xPlayer.removeMoney(Config.PriceEnableAI, 'IA Enable')

                MySQL.update('INSERT INTO vehicle_ai (plate, owner_identifier, enabled, calibrated) VALUES (?, ?, 1, 0) ON DUPLICATE KEY UPDATE enabled=1', { p, owner }, function(_)
                    xPlayer.showNotification('~g~IA activée ! Procédez au calibrage.')
                    logDB(owner, p, 'enable_ai', { price = Config.PriceEnableAI })
                    logToDiscord('IA activée', (('%s a activé l\'IA sur %s'):format(xPlayer.getName(), p)), 3066993, { price = Config.PriceEnableAI })
                    TriggerClientEvent('ducratif_ai:ui:enabled', src, p, true)
                    SetTimeout(200, function()
                        TriggerClientEvent('ducratif_ai:calibration:start', src, p)
                    end)
                end)
            else
                if xPlayer.getMoney() < Config.PriceDisableAI then
                    xPlayer.showNotification(('~r~Il vous manque %s%s.'):format(Config.CurrencySymbol, Config.PriceDisableAI - xPlayer.getMoney()))
                    return
                end
                xPlayer.removeMoney(Config.PriceDisableAI, 'IA Disable')
                MySQL.update('UPDATE vehicle_ai SET enabled=0 WHERE TRIM(plate) = ?', { p })
                xPlayer.showNotification('~y~IA désactivée sur ce véhicule.')
                logDB(owner, p, 'disable_ai', { price = Config.PriceDisableAI })
                logToDiscord('IA désactivée', (('%s a désactivé l\'IA sur %s'):format(xPlayer.getName(), p)), 15105570, { price = Config.PriceDisableAI })
                TriggerClientEvent('ducratif_ai:ui:enabled', src, p, false)
            end
        end)
    end)
end)



-- Purchase options
ESX.RegisterServerCallback('ducratif_ai:purchaseOption', function(source, cb, plate, optionKey, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return cb(false, 'no_player') end
    local owner = getOwnerIdentifier(xPlayer)

    local prices = {
        driving_mode    = Config.PriceDrivingMode,
        limiter         = Config.PriceLimiter,
        cruise          = Config.PriceCruise,
        collision_avoid = Config.PriceCollisionAvoid,
        fav_slot        = Config.PriceFavSlot,
        lawless         = Config.PriceLawless
    }
    local price = prices[optionKey]
    if not price then return cb(false, 'invalid_option') end

    -- (A) Slots favoris = compte joueur (pas lié à une plaque)
    if optionKey == 'fav_slot' then
        ensureUserRow(owner)
        MySQL.single('SELECT fav_slots FROM ai_users WHERE owner_identifier = ? LIMIT 1', { owner }, function(row)
            local current = row and row.fav_slots or Config.DefaultFavSlots
            if current >= Config.MaxFavSlots then
                return cb(false, 'max_slots')
            end
            if xPlayer.getMoney() < price then
                return cb(false, 'money', price)
            end
            xPlayer.removeMoney(price, 'IA Fav Slot')
            MySQL.update('UPDATE ai_users SET fav_slots = fav_slots + 1 WHERE owner_identifier = ?', { owner })
            logDB(owner, '-', 'buy_fav_slot', { price = price })
            logToDiscord('Achat slot favori', (('%s passe à +1 slot'):format(xPlayer.getName())), 3447003, { price = price })
            cb(true)
        end)
        return
    end

    -- (B) Options véhicule : vérifier propriété + état IA + anti double-achat
    local p = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''
    playerOwnsPlate(owner, p, function(owns)
        if not owns then return cb(false, 'not_owner') end

        fetchVehicleAIByPlate(p, function(row)
            if not row then
                return cb(false, 'no_ai_row') -- IA jamais activée pour cette plaque
            end

            local enabled    = tonumber(row.enabled)    or 0
            local calibrated = tonumber(row.calibrated) or 0

            -- Tant que NON calibré → blocage d'achat d'options véhicule
            if calibrated ~= 1 then
                return cb(false, 'not_calibrated')
            end

            -- Anti double-achat (par plaque)
            if optionKey == 'driving_mode' then
                if row.driving_mode ~= nil then
                    return cb(false, 'already')
                end
            elseif optionKey == 'limiter' then
                if tonumber(row.limiter_enabled) == 1 then
                    return cb(false, 'already')
                end
            elseif optionKey == 'cruise' then
                if tonumber(row.cruise_enabled) == 1 then
                    return cb(false, 'already')
                end
            elseif optionKey == 'collision_avoid' then
                if tonumber(row.collision_avoid_enabled) == 1 then
                    return cb(false, 'already')
                end
            elseif optionKey == 'lawless' then
                if tonumber(row.lawless_enabled) == 1 then
                    return cb(false, 'already')
                end

            end-----

            -- Argent
            if xPlayer.getMoney() < price then
                return cb(false, 'money', price)
            end

            -- Débit & MAJ selon l’option
            if optionKey == 'driving_mode' then
                local mode = args and args.mode or 'souple'
                xPlayer.removeMoney(price, 'IA Driving Mode')
                MySQL.update('UPDATE vehicle_ai SET driving_mode = ? WHERE TRIM(plate) = ?', { mode, p })
                logDB(owner, p, 'buy_driving_mode', { price = price, mode = mode })
                logToDiscord('Achat option', (('%s a acheté mode %s pour %s'):format(xPlayer.getName(), mode, p)), 3447003, { price = price })
                cb(true)

            elseif optionKey == 'limiter' then
                xPlayer.removeMoney(price, 'IA Limiter')
                MySQL.update('UPDATE vehicle_ai SET limiter_enabled = 1 WHERE TRIM(plate) = ?', { p })
                logDB(owner, p, 'buy_limiter', { price = price })
                logToDiscord('Achat option', (('%s a acheté Limitateur pour %s'):format(xPlayer.getName(), p)), 3447003, { price = price })
                cb(true)

            elseif optionKey == 'cruise' then
                xPlayer.removeMoney(price, 'IA Cruise')
                MySQL.update('UPDATE vehicle_ai SET cruise_enabled = 1 WHERE TRIM(plate) = ?', { p })
                logDB(owner, p, 'buy_cruise', { price = price })
                logToDiscord('Achat option', (('%s a acheté Régulateur pour %s'):format(xPlayer.getName(), p)), 3447003, { price = price })
                cb(true)

            elseif optionKey == 'collision_avoid' then
                xPlayer.removeMoney(price, 'IA Collision Avoid')
                MySQL.update('UPDATE vehicle_ai SET collision_avoid_enabled = 1 WHERE TRIM(plate) = ?', { p })
                logDB(owner, p, 'buy_collision_avoid', { price = price })
                logToDiscord('Achat option', (('%s a acheté Collision Avoid pour %s'):format(xPlayer.getName(), p)), 3447003, { price = price })
                cb(true)
            
            elseif optionKey == 'lawless' then
                xPlayer.removeMoney(price, 'IA Lawless')
                MySQL.update('UPDATE vehicle_ai SET lawless_enabled = 1 WHERE TRIM(plate) = ?', { p })
                logDB(owner, p, 'buy_lawless', { price = price })
                logToDiscord('Achat option', (('%s a acheté Conduite hors code pour %s'):format(xPlayer.getName(), p)), 3447003, { price = price })
                cb(true)

----------------------
            else
                cb(false, 'invalid_option2')
            end
        end)
    end)
end)



-- Save toggles (limiter/cruise speeds) + driving_mode
RegisterNetEvent('ducratif_ai:updateSettings', function(plate, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local owner = getOwnerIdentifier(xPlayer)
    local p = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    playerOwnsPlate(owner, p, function(owns)
        if not owns then return end

        fetchVehicleAIByPlate(p, function(row)
            if not row then return end
            if asInt(row.calibrated) ~= 1 then return end  -- pas de réglages tant que non calibré

            local limiterInstalled = asInt(row.limiter_enabled) == 1
            local cruiseInstalled  = asInt(row.cruise_enabled)  == 1

            -- ce que l'UI demande (checkbox)
            local wantLimiter = (data.limiter_enabled == true or data.limiter_enabled == 1)
            local wantCruise  = (data.cruise_enabled  == true or data.cruise_enabled  == 1)

            -- vitesses demandées
            local limiter_speed = tonumber(data.limiter_speed_kmh) or 0
            local cruise_speed  = tonumber(data.cruise_speed_kmh)  or 0

            -- règles ON/OFF : si non acheté → forcé à 0 ; si décoché → 0
            if not limiterInstalled or not wantLimiter then limiter_speed = 0 end
            if not cruiseInstalled  or not wantCruise  then cruise_speed  = 0 end

            -- driving_mode : modifiable seulement si déjà acheté (non NULL)
            local driving_mode = row.driving_mode
            if driving_mode and driving_mode ~= json.NULL and data.driving_mode then
                driving_mode = tostring(data.driving_mode)
            end

            -- Update du mode de code de la route
            local lawBought = asInt(row.lawless_enabled) == 1
            local wantLawless = (data.lawless_active == true or data.lawless_active == 1)
            local newLawlessActive = lawBought and wantLawless and 1 or 0

            ---------
            local q = [[
                UPDATE vehicle_ai SET
                    -- on conserve *_enabled en l'état (achat)
                    limiter_enabled     = ?,
                    limiter_speed_kmh   = ?,
                    cruise_enabled      = ?,
                    cruise_speed_kmh    = ?,
                    driving_mode        = ?,
                    lawless_active      = ?,
                    updated_at          = CURRENT_TIMESTAMP
                WHERE TRIM(plate) = ?
            ]]

            MySQL.update(q, {
                limiterInstalled and 1 or 0,
                limiter_speed,
                cruiseInstalled and 1 or 0,
                cruise_speed,
                driving_mode,
                newLawlessActive,
                p
            })

            logDB(owner, p, 'update_settings', {
                limiter_installed = limiterInstalled, limiter_speed_kmh = limiter_speed,
                cruise_installed  = cruiseInstalled,  cruise_speed_kmh  = cruise_speed,
                driving_mode      = driving_mode,
                lawless_active  = newLawlessActive
            })
        end)
    end)
end)




-- History (keep last 50)
RegisterNetEvent('ducratif_ai:history:add', function(plate, fromLabel, toLabel, fromCoords, toCoords)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local owner = getOwnerIdentifier(xPlayer)
    ensureUserRow(owner)
    -- insert
    MySQL.insert('INSERT INTO ai_history (owner_identifier, plate, from_label, to_label, from_x, from_y, from_z, to_x, to_y, to_z) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        { owner, plate, fromLabel or '', toLabel or '', fromCoords.x, fromCoords.y, fromCoords.z, toCoords.x, toCoords.y, toCoords.z })
    -- cap at 50
    MySQL.query('SELECT id FROM ai_history WHERE owner_identifier = ? ORDER BY id DESC LIMIT 50, 1000', { owner }, function(rows)
        if rows and #rows > 0 then
            local ids = {}
            for _,r in ipairs(rows) do table.insert(ids, r.id) end
            MySQL.update(('DELETE FROM ai_history WHERE id IN (%s)'):format(table.concat(ids, ',')))
        end
    end)
end)

ESX.RegisterServerCallback('ducratif_ai:history:get', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return cb({history={},favorites={},slots=Config.DefaultFavSlots}) end
    local owner = getOwnerIdentifier(xPlayer)
    ensureUserRow(owner)
    local result = { history = {}, favorites = {}, slots = Config.DefaultFavSlots }
    MySQL.query('SELECT fav_slots FROM ai_users WHERE owner_identifier = ? LIMIT 1', { owner }, function(rows)
        result.slots = (rows and rows[1] and rows[1].fav_slots) or Config.DefaultFavSlots
        MySQL.query('SELECT * FROM ai_history WHERE owner_identifier = ? ORDER BY id DESC LIMIT 50', { owner }, function(h)
            result.history = h or {}
            MySQL.query('SELECT * FROM ai_favorites WHERE owner_identifier = ? ORDER BY id DESC LIMIT 100', { owner }, function(f)
                result.favorites = f or {}
                cb(result)
            end)
        end)
    end)
end)

RegisterNetEvent('ducratif_ai:fav:add', function(label, coords)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local owner = getOwnerIdentifier(xPlayer)
    ensureUserRow(owner)
    MySQL.single('SELECT fav_slots FROM ai_users WHERE owner_identifier = ? LIMIT 1', { owner }, function(row)
        local max = row and row.fav_slots or Config.DefaultFavSlots
        MySQL.scalar('SELECT COUNT(*) FROM ai_favorites WHERE owner_identifier = ?', { owner }, function(count)
            if count >= max then
                xPlayer.showNotification(('~r~Favoris plein (%d/%d).'):format(count, max))
                return
            end
            MySQL.insert('INSERT INTO ai_favorites (owner_identifier, label, x, y, z) VALUES (?, ?, ?, ?, ?)', {
                owner, label or 'Favori', coords.x, coords.y, coords.z
            })
            xPlayer.showNotification('~g~Ajouté aux favoris.')
            logDB(owner, '-', 'fav_add', { label = label })
        end)
    end)
end)

RegisterNetEvent('ducratif_ai:fav:remove', function(favId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local owner = getOwnerIdentifier(xPlayer)
    MySQL.update('DELETE FROM ai_favorites WHERE id = ? AND owner_identifier = ?', { favId, owner })
    xPlayer.showNotification('~y~Favori supprimé.')
    logDB(owner, '-', 'fav_remove', { id = favId })
end)

-- Ox inventory items usage
--CreateThread(function()
--    exports.ox_inventory:CreateUsableItem(Config.Items.module.name, function(data, slot)
--        local src = data.source
--        TriggerClientEvent('ducratif_ai:item:use', src, 'single')
--    end)
--    exports.ox_inventory:CreateUsableItem(Config.Items.premium.name, function(data, slot)
--        local src = data.source
--        TriggerClientEvent('ducratif_ai:item:use', src, 'premium')
--    end)
--    exports.ox_inventory:CreateUsableItem(Config.Items.platinum.name, function(data, slot)
--        local src = data.source
--        TriggerClientEvent('ducratif_ai:item:use', src, 'platinum')
--    end)
--end)

ESX.RegisterServerCallback('ducratif_ai:item:consume', function(source, cb, kind, plate, option)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return cb(false) end
    local itemName = kind == 'single' and Config.Items.module.name or kind == 'premium' and Config.Items.premium.name or Config.Items.platinum.name
    local count = exports.ox_inventory:GetItem(source, itemName, nil, true) or 0
    if count <= 0 then
        xPlayer.showNotification('~r~Vous n\'avez pas l\'item requis.')
        return cb(false)
    end

    local owner = getOwnerIdentifier(xPlayer)
    playerOwnsPlate(owner, plate, function(owns)
        if not owns then return cb(false) end
        exports.ox_inventory:RemoveItem(source, itemName, 1)
        if kind == 'single' then
            -- option: 'driving_mode'/'limiter'/'cruise'/'collision_avoid'
            TriggerClientEvent('ducratif_ai:item:applied', source, kind, plate, option)
            logDB(owner, plate, 'module_apply_single', { option = option })
        elseif kind == 'premium' then
            TriggerClientEvent('ducratif_ai:item:applied', source, kind, plate)
            logDB(owner, plate, 'module_apply_premium', {})
        else
            TriggerClientEvent('ducratif_ai:item:applied', source, kind, plate)
            logDB(owner, plate, 'module_apply_platinum', {})
        end
        cb(true)
    end)
end)

-- Calibration complete
RegisterNetEvent('ducratif_ai:calibration:done', function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local owner = getOwnerIdentifier(xPlayer)
    local p = (plate and plate:gsub('^%s*(.-)%s*$', '%1'):upper()) or ''

    playerOwnsPlate(owner, p, function(owns)
        if not owns then return end

        MySQL.update('UPDATE vehicle_ai SET calibrated = 1, enabled = 1 WHERE TRIM(plate) = ?', { p }, function(affected)
            if affected == 0 then
                MySQL.update('INSERT INTO vehicle_ai (plate, owner_identifier, enabled, calibrated) VALUES (?, ?, 1, 1) ON DUPLICATE KEY UPDATE enabled=1, calibrated=1', { p, owner })
            end

            xPlayer.showNotification('~b~Calibration terminée. IA prête.')
            TriggerClientEvent('ducratif_ai:ui:enabled', src, p, true)

            logDB(owner, p, 'calibration_done', {})
            logToDiscord('Calibration OK', (('%s a calibré %s'):format(xPlayer.getName(), p)), 3447003, {})
        end)
    end)
end)





-- Police siren coordination
local lastPoliceRequest = {}

RegisterNetEvent('ducratif_ai:police:sirenState', function(isOn)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local job = xPlayer.getJob and xPlayer.getJob().name or xPlayer.job and xPlayer.job.name or 'unemployed'
    local okJob = false
    for _,j in ipairs(Config.PoliceJobs) do if j == job then okJob = true break end end
    if not okJob then return end
    -- We just store state server-side if needed later (not necessary in this version).
end)

RegisterNetEvent('ducratif_ai:police:requestStop', function(targetId)
    -- Called by police driver after 10s proximity to request IA to stop
    local src = source
    local police = ESX.GetPlayerFromId(src)
    if not police then return end
    if not lastPoliceRequest[src] or (os.time() - lastPoliceRequest[src] > Config.PoliceRequestOnceCooldown) then
        lastPoliceRequest[src] = os.time()
        TriggerClientEvent('ducratif_ai:police:requestStopClient', targetId, GetPlayerName(src))
        logDB(nil, nil, 'police_request_stop', { police = GetPlayerName(src), target = targetId })
        logToDiscord('Police -> IA Stop', (('%s a demandé l\'arrêt IA de %s'):format(GetPlayerName(src), tostring(targetId))), 15158332)
    end
end)

-- Forward stop to nearby AI vehicles (server-side, range limited)
RegisterNetEvent('ducratif_ai:forwardStopToTarget', function()
    local src = source
    local ped = GetPlayerPed(src)
    if ped == 0 then return end
    local px,py,pz = table.unpack(GetEntityCoords(ped))
    for _,pid in ipairs(GetPlayers()) do
        local pped = GetPlayerPed(pid)
        if pped ~= 0 then
            local x,y,z = table.unpack(GetEntityCoords(pped))
            local dx,dy = x - px, y - py
            local dist2 = dx*dx + dy*dy
            if dist2 <= (Config.PoliceDetectRadius + 20.0)^2 then
                TriggerClientEvent('ducratif_ai:forwardStop', tonumber(pid))
            end
        end
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
