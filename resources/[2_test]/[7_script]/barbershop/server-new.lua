--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()
position = {}

RegisterNetEvent("barbershop:pay", function(price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if price > 0 then
        local hasMoney = exports.ox_inventory:GetItemCount(src, 'money')

        if hasMoney >= price then
            exports.ox_inventory:RemoveItem(src, 'money', price)
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Barbier',
                description = ('Vous avez payé %s$ pour votre coupe !'):format(price),
                type = 'success'
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Barbier',
                description = "Vous n'avez pas assez d'argent sur vous !",
                type = 'error'
            })
            TriggerClientEvent('barbershop:cancel', src) -- pour annuler côté client s'il a pas assez
        end
    end
end)

ESX.RegisterServerCallback('barbershop:checkposition', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    if #position > 0 then
        cb(false)  -- S'il y a déjà une position occupée.
    else
        table.insert(position, identifier)  -- Ajoute le joueur à la liste des positions occupées.
        cb(true)  -- La position est disponible.
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local identifier = xPlayer.identifier
        if #position > 0 and identifier == position[1] then
            table.remove(position, 1)
        end
    end
end)

RegisterNetEvent('barbershop:removeposition', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local identifier = xPlayer.identifier
        if #position > 0 and identifier == position[1] then
            table.remove(position, 1)
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
