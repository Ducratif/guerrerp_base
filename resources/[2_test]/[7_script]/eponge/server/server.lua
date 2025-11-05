--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

exports.ox_inventory:registerHook('createItem', function(payload)
    if payload.item.name == 'sponge' then
        payload.metadata.durability = 10
        return payload
    end
end)

RegisterServerEvent('sponge:updateDurability')
AddEventHandler('sponge:updateDurability', function()
    local source = source
    local sponge = exports.ox_inventory:GetSlotWithItem(source, 'sponge')
    
    if sponge then
        local durability = sponge.metadata.durability or 10
        durability = durability - 1
        
        if durability <= 0 then
            exports.ox_inventory:RemoveItem(source, 'sponge', 1)
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Eponge cassée',
                description = 'Ton éponge s\'est cassée',
                type = 'error'
            })
        else
            exports.ox_inventory:SetMetadata(source, sponge.slot, {durability = durability})
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Durabilité',
                description = 'Durabilité de l\'éponge: ' .. durability .. '/10',
                type = 'info'
            })
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
