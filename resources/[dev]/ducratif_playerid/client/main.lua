--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

local function showIdMenu(targetSid, data)
    local result = lib.callback.await('ducratif_playerid:getUniqueForTarget', false, targetSid)
    if not result or not result.unique then
        lib.notify({ title = 'Identification', description = 'Impossible de récupérer l\'ID.', type = 'error' })
        return
    end

    local unique = result.unique
    local tName = result.tName or ('ID '..tostring(targetSid))
    local options = {}

    -- Header showing the ID (disabled row)
    options[#options+1] = {
        title = ('ID Unique: %s'):format(unique),
        icon = 'id-card',
        disabled = true
    }

    if Config.UI.showCopy then
        options[#options+1] = {
            title = '📋 Copier',
            description = 'Copier l\'ID unique dans le presse-papiers',
            icon = 'copy',
            onSelect = function()
                if lib and lib.setClipboard then
                    lib.setClipboard(unique)
                    lib.notify({ title = 'Identification', description = 'ID copié dans le presse-papiers.', type = 'success' })
                else
                    lib.notify({ title = 'Identification', description = 'ox_lib est requis pour copier.', type = 'error' })
                end
            end
        }
    end

    if Config.Webhook.enabled and Config.UI.showWebhook then
        options[#options+1] = {
            title = '📨 Envoyer au staff',
            description = 'Envoie au staff GuerreRP',
            icon = 'paper-plane',
            onSelect = function()
                TriggerServerEvent('ducratif_playerid:sendToWebhook', targetSid)
            end
        }
    end

    if Config.Database.enabled and Config.UI.showDatabase then
        options[#options+1] = {
            title = '💾 Enregistrer en base',
            description = 'Sauvegarde cette identification dans la base de données',
            icon = 'server',
            onSelect = function()
                TriggerServerEvent('ducratif_playerid:saveToDatabase', targetSid)
            end
        }
    end

    options[#options+1] = {
        title = 'GuerreRP',
        description = 'TOUT ABUS SERA BANNI !',
        icon = 'id-card',
        disabled = true
    }

    lib.registerContext({
        id = 'ducratif_playerid_ctx',
        title = ('ID de %s [%s]'):format(tName, targetSid),
        options = options
    })
    lib.showContext('ducratif_playerid_ctx')
end

-- ox_target third-eye option on players
if Config.Target.enabled then
    exports.ox_target:addGlobalPlayer({
        {
            name = 'ducratif_playerid_option',
            label = Config.Target.label,
            icon = Config.Target.icon,
            distance = Config.Target.distance,
            canInteract = function(entity, distance, coords, name, bone)
                if not DoesEntityExist(entity) then return false end
                if IsEntityDead(entity) then return false end

                local targetIdx = NetworkGetPlayerIndexFromPed(entity)
                if targetIdx == nil then return false end

                if targetIdx == PlayerId() and not Config.Debug.allowSelfTarget then
                    return false
                end

                return true
            end,
            onSelect = function(data)
                local entity = data.entity
                if not DoesEntityExist(entity) then return end
                local idx = NetworkGetPlayerIndexFromPed(entity)
                if not idx then return end
                local targetSid = GetPlayerServerId(idx)
                if not targetSid then return end
                showIdMenu(targetSid, data)
            end
        }
    })
end

-- Test command for solo testing (/idunique [serverId])
if Config.Debug.registerTestCommand then
    RegisterCommand('idunique', function(_, args)
        local sid = tonumber(args[1])
        if not sid then
            sid = GetPlayerServerId(PlayerId())
        end
        showIdMenu(sid, {})
    end, false)

    --RegisterKeyMapping('idunique', 'Afficher ID Unique (test solo)', 'keyboard', 'F6')
    RegisterKeyMapping('idunique', 'Afficher ID Unique (test solo)', 'keyboard', 'APOSTROPHE')
end

-- Client notifications from server
RegisterNetEvent('ducratif_playerid:notify', function(msgType, msg)
    lib.notify({ title = 'Identification', description = msg, type = msgType or 'inform' })
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
