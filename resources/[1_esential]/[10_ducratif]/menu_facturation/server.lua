--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- 🔒 Script protégé & signé par Ducratif pour le serveur GuerreRP
-- 🌐 Boutique officielle : https://ducratif.tebex.io
-- 💻 GitHub : https://github.com/Ducratif
-- 🎮 Discord serveur RP : https://discord.gg/kpD8pQBBWm
-- 🛒 Discord boutique : https://discord.gg/kpD8pQBBWm

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('facture:sendInvoice', function(targetId, amount)
    local sourceId = source
    TriggerClientEvent('facture:receiveInvoice', targetId, amount, sourceId)
end)

RegisterServerEvent('facture:refuseInvoice', function(sourceId)
    TriggerClientEvent('ox_lib:notify', sourceId, {
        title = 'Facture',
        description = 'La facture a été refusée.',
        type = 'error'
    })
end)

RegisterServerEvent('facture:acceptInvoice', function(fromId, amount, payMethod)
    local src = source
    local payer = ESX.GetPlayerFromId(src)
    local receiver = ESX.GetPlayerFromId(fromId)

    if not payer or not receiver then return end

    if payer.getAccount(payMethod).money >= amount then
        payer.removeAccountMoney(payMethod, amount)
        receiver.addMoney(amount)

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Facture',
            description = ('Vous avez payé $%s en %s.'):format(amount, payMethod),
            type = 'success'
        })

        TriggerClientEvent('ox_lib:notify', fromId, {
            title = 'Facture',
            description = ('Vous avez reçu $%s en liquide.'):format(amount),
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', fromId, {
            title = 'Paiement refusé',
            description = ('La personne ne peux pas vous payez!'):format(amount),
            type = 'error'
        })

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Paiement refusé',
            description = 'Fonds insuffisants.',
            type = 'error'
        })
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
