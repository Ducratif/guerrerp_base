--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- ducratif_mask_toggle - client

local savedMask = nil      -- { drawable = x, texture = y }
local toggledOff = false   -- indique si on a retiré le masque via /mask
local ESX = nil

-- (Optionnel) Essaye de récupérer ESX si dispo (pour ESX.ShowNotification)
CreateThread(function()
    if GetResourceState('es_extended') == 'started' then
        pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
    end
    -- suggestion dans le chat (si resource chat est là)
    TriggerEvent('chat:addSuggestion', '/mask', 'Retire/remet votre masque (toggle)')
end)

-- Utilitaire de notif : ox_lib -> ESX -> chat
local function notify(msg)
    if GetResourceState('ox_lib') == 'started' and lib and lib.notify then
        lib.notify({ title = 'Masque', description = msg, type = 'inform' })
        return
    end
    if ESX and ESX.ShowNotification then
        ESX.ShowNotification(msg)
        return
    end
    TriggerEvent('chat:addMessage', { args = { '^3Masque^7', msg } })
end

-- Lecture du masque actuel (component 1)
local function getCurrentMask(ped)
    local drawable = GetPedDrawableVariation(ped, 1)
    local texture  = GetPedTextureVariation(ped, 1)
    return drawable, texture
end

-- Applique un masque via illenium-appearance (component_id = 1)
local function setMask(ped, drawable, texture)
    -- sécurité valeurs
    drawable = tonumber(drawable) or 0
    texture  = tonumber(texture) or 0

    -- On n’envoie qu’un seul composant (mask)
    exports['illenium-appearance']:setPedComponents(ped, {
        { component_id = 1, drawable = drawable, texture = texture }
    })
end

-- Commande: /mask
RegisterCommand('mask', function()
    local ped = PlayerPedId()
    local currentDrawable, currentTexture = getCurrentMask(ped)

    if not toggledOff then
        -- On veut retirer : vérifier qu'il y a bien un masque
        -- Heuristique: drawable > 0 => on porte un masque (0 est généralement "pas de masque")
        if currentDrawable and currentDrawable > 0 then
            savedMask = { drawable = currentDrawable, texture = currentTexture }
            setMask(ped, 0, 0) -- retire le masque
            toggledOff = true
            notify('Masque retiré.')
        else
            -- pas de masque à retirer
            notify("Tu n'as pas de masque à retirer.")
        end
    else
        -- On veut remettre le masque d'origine
        if savedMask then
            setMask(ped, savedMask.drawable, savedMask.texture)
            notify('Masque remis.')
            toggledOff = false
            savedMask = nil
        else
            notify("Aucun masque précédent à remettre.")
        end
    end
end, false)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
