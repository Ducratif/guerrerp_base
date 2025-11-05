--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local gpsActive = false
local gpsFrequency = nil
local gpsBlips = {}

------------------------------------------
-- Animation et son
------------------------------------------
local function playGpsAnimation()
    local ped = PlayerPedId()
    RequestAnimDict("cellphone@")
    while not HasAnimDictLoaded("cellphone@") do Wait(10) end

    TaskPlayAnim(ped, "cellphone@", "cellphone_text_read_base", 8.0, -8.0, -1, 50, 0, false, false, false)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'gps_click', 0.4)
    Wait(1500)
    ClearPedTasks(ped)
end

function openBuyFrequencyMenu()
    local input = lib.inputDialog("Acheter une fréquence", {
        {type = 'number', label = 'Fréquence', min = 1, max = 999, required = true},
        {type = 'select', label = 'Méthode de paiement', required = true, options = {
            {label = "💵 Argent (money)", value = "money"},
            {label = "🏦 Banque", value = "bank"},
        }}
    })

    if input then
        TriggerServerEvent('gps:buyFrequency', tostring(input[1]), input[2])
    end
end


function openManageFrequencies()
    lib.callback('gps:getOwnedFrequencies', false, function(frequencies)
        if not frequencies or #frequencies == 0 then
            lib.notify({title = "GPS", description = "Aucune fréquence achetée.", type = "error"})
            return
        end

        local options = {}
        for _, freq in ipairs(frequencies) do
            table.insert(options, {label = "Fréquence " .. freq, value = freq})
        end

        local selected = lib.inputDialog("Mes fréquences", {
            {type = "select", label = "Modifier une fréquence", options = options}
        })

        if not selected then return end

        local freq = tostring(selected[1])
        local modifications = lib.inputDialog("Modifier " .. freq, {
            {type = "input", label = "Mot de passe", placeholder = "laisser vide si inchangé"},
            {type = "input", label = "Webhook Discord", placeholder = "laisser vide si inchangé"}
        })

        if not modifications then return end

        local password = modifications[1]
        local webhook = modifications[2]

        TriggerServerEvent('gps:updateFrequencyData', freq, password, webhook)
    end)
end


RegisterNetEvent('gps:itemUsed', function()

    local options = {
        {label = '🔎 Rejoindre une fréquence', value = 'join'},
        {label = '⭐ Mes favoris', value = 'favorites'},
        {label = '🛒 Acheter une fréquence', value = 'buy'},
        {label = '⚙️ Gérer mes fréquences', value = 'manage'},
        {label = '📴 Se déconnecter du GPS', value = 'disconnect'},
        {label = '❌ Fermer', value = 'close'}
    }

    local choice = lib.inputDialog('GPS Portable', {
        {type = 'select', label = 'Menu GPS', options = options}
    })

    if not choice then return end
    local action = choice[1]

    if action == 'join' then
        if gpsActive then
            lib.notify({title = "GPS", description = "Déjà actif sur fréquence " .. gpsFrequency, type = "inform"})
            return
        end

    local input = lib.inputDialog("Connexion GPS", {
        {type = 'number', label = 'Fréquence (1 - 999)', min = 1, max = 999, required = true}
    })

    if input then
        local freq = tostring(input[1])

        lib.callback('gps:isFrequencyProtected', false, function(protected)
            if protected then
                local passInput = lib.inputDialog("Mot de passe requis", {
                    {type = 'input', label = 'Mot de passe', password = true, required = true}
                })

                if not passInput then return end

                local password = passInput[1]

                lib.callback('gps:checkPassword', false, function(isValid)
                    if isValid then
                        gpsFrequency = freq
                        gpsActive = true
                        playGpsAnimation()
                        TriggerServerEvent('gps:joinFrequency', freq)
                        lib.notify({title = "GPS", description = "Connecté à la fréquence " .. freq, type = "success"})
                    else
                        lib.notify({title = "GPS", description = "Mot de passe incorrect.", type = "error"})
                    end
                end, freq, password)

            else
                gpsFrequency = freq
                gpsActive = true
                playGpsAnimation()
                TriggerServerEvent('gps:joinFrequency', freq)
                lib.notify({title = "GPS", description = "Connecté à la fréquence " .. freq, type = "success"})
            end
        end, freq)
    end


     elseif action == 'favorites' then
    lib.callback('gps:getFavorites', false, function(favorites)
        local favOptions = {}
        for _, freq in ipairs(favorites) do
            table.insert(favOptions, {label = 'Fréquence ' .. freq, value = freq})
        end

        local menuOptions = {
            {label = '📡 Se connecter à une fréquence', value = 'connect'},
            {label = '➕ Ajouter une fréquence', value = 'add'},
            {label = '🗑️ Supprimer une fréquence', value = 'remove'},
            {label = '↩️ Retour', value = 'return'}
        }

        local mainChoice = lib.inputDialog('Mes favoris', {
            {type = 'select', label = 'Action', options = menuOptions}
        })

        if not mainChoice then return end
        local action = mainChoice[1]

        if action == 'connect' then
            if #favorites == 0 then
                lib.notify({title = "GPS", description = "Aucun favori disponible.", type = "error"})
                return
            end

            local select = {}
            for _, freq in ipairs(favorites) do
                table.insert(select, {label = 'Fréquence ' .. freq, value = freq})
            end

            local selected = lib.inputDialog("Se connecter", {
                {type = "select", label = "Choisir une fréquence", options = select}
            })

            if selected then
                gpsFrequency = tostring(selected[1])
                gpsActive = true
                playGpsAnimation()
                TriggerServerEvent('gps:joinFrequency', gpsFrequency)
                lib.notify({title = "GPS", description = "Connecté à la fréquence " .. gpsFrequency, type = "success"})
            end

        elseif action == 'add' then
            local newFreq = lib.inputDialog("Ajouter une fréquence", {
                {type = 'number', label = 'Fréquence', min = 1, max = 999, required = true}
            })

            if not newFreq then return end
            TriggerServerEvent('gps:addFavorite', tostring(newFreq[1]))
            lib.notify({title = "GPS", description = "Ajouté aux favoris", type = "success"})

        elseif action == 'remove' then
            if #favorites == 0 then
                lib.notify({title = "GPS", description = "Aucun favori à supprimer.", type = "error"})
                return
            end

            local select = {}
            for _, freq in ipairs(favorites) do
                table.insert(select, {label = 'Fréquence ' .. freq, value = freq})
            end

            local selected = lib.inputDialog("Supprimer une fréquence", {
                {type = "select", label = "Choisir une fréquence à retirer", options = select}
            })

            if selected then
                TriggerServerEvent('gps:removeFavorite', tostring(selected[1]))
                lib.notify({title = "GPS", description = "Fréquence supprimée des favoris", type = "success"})
            end
        end
    end)


    elseif action == 'buy' then
        openBuyFrequencyMenu()

    elseif action == 'manage' then
        openManageFrequencies()
    

    elseif action == 'disconnect' then
        if gpsActive then
            gpsActive = false
            TriggerServerEvent('gps:leaveFrequency', gpsFrequency)
            gpsFrequency = nil

            for _, blip in pairs(gpsBlips) do
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
            end
            gpsBlips = {}

            lib.notify({title = "GPS", description = "Déconnecté du GPS", type = "error"})
        else
            lib.notify({title = "GPS", description = "Aucune fréquence active.", type = "inform"})
        end
    end

end)


------------------------------------------
-- Mise à jour des blips
------------------------------------------
RegisterNetEvent('gps:updateUsers', function(players)
    for _, blip in pairs(gpsBlips) do RemoveBlip(blip) end
    gpsBlips = {}

    local myCoords = GetEntityCoords(PlayerPedId())

    for _, data in pairs(players) do
        if data.coords then
        local coords = vector3(data.coords.x, data.coords.y, data.coords.z)
        if #(myCoords - coords) <= 3000.0 then
            local blip = AddBlipForCoord(coords)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 3)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("GPS - " .. data.firstname)
            EndTextCommandSetBlipName(blip)
            gpsBlips[#gpsBlips + 1] = blip
        end
end

    end
end)

CreateThread(function()
    while true do
        Wait(5000)
        if gpsActive and gpsFrequency then
            TriggerServerEvent('gps:refreshFrequency', gpsFrequency)
        end
    end
end)





------------------------------------------
-- Déconnexion GPS
------------------------------------------
RegisterCommand('gpsdisconnect', function()
    if gpsActive then
        gpsActive = false
        TriggerServerEvent('gps:leaveFrequency', gpsFrequency)
        gpsFrequency = nil

        -- ⛔ Supprimer tous les blips restants
        for _, blip in pairs(gpsBlips) do
            if DoesBlipExist(blip) then
                RemoveBlip(blip)
            end
        end
        gpsBlips = {}

        lib.notify({title = "GPS", description = "Déconnecté du GPS", type = "error"})
    else
        lib.notify({title = "GPS", description = "Pas de fréquence active", type = "error"})
    end
end, false)



-- Commande d'utilisation manuelle du GPS
RegisterCommand('usegps', function()
    lib.callback('gps:checkItem', false, function(hasItem)
        if hasItem then
            TriggerEvent('gps:itemUsed')
        else
            lib.notify({ title = 'GPS', description = "Vous n'avez pas de GPS sur vous.", type = 'error' })
        end
    end)
end, false)

RegisterKeyMapping('usegps', 'Utiliser le GPS Portable', 'keyboard', 'F4') -- touche configurable

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
