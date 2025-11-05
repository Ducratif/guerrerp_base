--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local usedCooldowns = {}

function isInZone()
    local pCoords = GetEntityCoords(PlayerPedId())
    local isIn = false
    local result = lib.callback.await('stimulants:getZones', false)
    if not result then return false end

    for _, zone in pairs(result) do
        local dist = #(pCoords - vec3(zone.x, zone.y, zone.z))
        if dist <= zone.radius then
            isIn = true
            break
        end
    end
    return isIn
end

-- Animation pour simuler l'utilisation du stimulant
function playStimulusAnimation()
    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do
        Wait(100)
    end

    TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 8.0, -8.0, 1500, 0, 0, false, false, false)
    -- Pas de Wait ici, on lance l'animation et on continue directement après
end

RegisterNetEvent('stimulants:useItem', function(itemName)
    -- Si c'est une table, extraire le nom
    if type(itemName) == 'table' and itemName.name then
        itemName = itemName.name
    end

    local stim = Config.Stimulants[itemName]
    if not stim then return end

    -- Vérifier si le joueur est dans une zone valide
    if stim.restricted and not isInZone() then
        lib.notify({
            title = "Zone invalide",
            description = "Les stimulants ne peuvent être utilisés que dans les zones de guerre.",
            type = "error"
        })
        return
    end

    -- Vérifier cooldown
    if usedCooldowns[itemName] and GetGameTimer() - usedCooldowns[itemName] < stim.cooldown * 1000 then
        lib.notify({
            title = "Cooldown",
            description = "Ce stimulant est encore en recharge.",
            type = "error"
        })
        return
    end

    -- Appliquer le cooldown immédiatement
    usedCooldowns[itemName] = GetGameTimer()

    -- Vérifier si le joueur est dans un véhicule
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        lib.notify({
            title = "Action impossible",
            description = "Tu ne peux pas utiliser ce stimulant dans un véhicule.",
            type = "error"
        })
        return
    end

    -- Appliquer l'animation immédiatement
    playStimulusAnimation()  -- Lancer l'animation immédiatement sans attendre

    -- Appliquer les effets du stimulant (vitesse, invincibilité)
    if stim.effect.speed then
        local speed = math.min(1.49, 1.0 + stim.effect.speed)
        SetRunSprintMultiplierForPlayer(PlayerId(), speed)
    end
    if stim.effect.godmode then
        SetEntityInvincible(PlayerPedId(), true)
    end

    lib.notify({
        title = "Stimulant",
        description = stim.label .. " activé !",
        type = "success"
    })

    -- Réinitialiser les effets après la durée
    local effectDuration = stim.duration or stim.effect.godmode
    Wait(effectDuration * 1000)

    if stim.effect.speed then
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    end
    if stim.effect.godmode then
        SetEntityInvincible(PlayerPedId(), false)
    end

    -- Après utilisation, retirer l'item de l'inventaire (si nécessaire)
    TriggerServerEvent('stimulants:removeItem', itemName)  -- Envoie l'événement pour retirer l'item
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
