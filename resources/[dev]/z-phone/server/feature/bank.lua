--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register('z-phone:server:GetBank', function(source)
    local Player = xCore.GetPlayerBySource(source)
    if Player ~= nil then
       --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")

        local histories = xCore.bankHistories(citizenid)
        local bills = xCore.bankInvoices(citizenid)

        return {
            histories = histories,
            bills = bills,
            balance = Player.money.bank
        }
    end
    return {}
end)

lib.callback.register('z-phone:server:PayInvoice', function(source, body)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Échec du paiement de la facture"
        })
        return false
    end

    if Player.money.bank < body.amount then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "L'équilibre ne suffit pas"
        })
        return false
    end
    
   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")
    local invoice = xCore.bankInvoiceByCitizenID(body.id, citizenid)

    if not invoice then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Échec du paiement de la facture"
        })
        return false
    end

    Player.removeAccountMoney('bank', invoice.amount, invoice.reason)
    
    xCore.AddMoneyBankSociety(invoice.society, invoice.amount, invoice.reason)
    xCore.deleteBankInvoiceByID(invoice.id)
    
    TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
        type = "Notification",
        from = "Wallet",
        message = "Succès payant"
    })
    return true
end)

lib.callback.register('z-phone:server:TransferCheck', function(source, body)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Échec de la vérification du récepteur !"
        })
        return {
            isValid = false,
            name = ""
        }
    end

   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")
    local queryGetCitizenByIban = "select citizenid from zp_users where iban = ?"
    local receiverCitizenid = MySQL.scalar.await(queryGetCitizenByIban, {
        body.iban
    })

    if not receiverCitizenid then
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "IBAN non enregistré !"
        })
        return {
            isValid = false,
            name = ""
        }
    end

    if receiverCitizenid == citizenid then
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Impossible de le transférer à vous-même !"
        })
        return {
            isValid = false,
            name = ""
        }
    end

    local ReceiverPlayer = xCore.GetPlayerByIdentifier(receiverCitizenid)
    if ReceiverPlayer == nil then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Le récepteur est hors de la ville!"
        })
        return {
            isValid = false,
            name = ""
        }
    end

    return {
        isValid = true,
        name = ReceiverPlayer.charinfo.firstname .. ' '.. ReceiverPlayer.charinfo.lastname
    }
end)

lib.callback.register('z-phone:server:Transfer', function(source, body)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Échec de la vérification du récepteur !"
        })
        return false
    end

   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")

    if Player.money.bank < body.total then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Les fond ne suffit pas"
        })
        return false
    end
    
    local queryGetCitizenByIban = "select citizenid from zp_users where iban = ?"
    local receiverCitizenid = MySQL.scalar.await(queryGetCitizenByIban, {
        body.iban
    })

    if not receiverCitizenid then
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "IBAN non enregistré !"
        })
        return false
    end

    if receiverCitizenid == citizenid then
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Impossible de le transférer à vous-même !"
        })
        return false
    end

    local ReceiverPlayer = xCore.GetPlayerByIdentifier(receiverCitizenid)
    if ReceiverPlayer == nil then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "Wallet",
            message = "Le récepteur est hors de la ville!"
        })
        return false
    end

    local senderReason = string.format("Transfer send: %s - to %s", body.note, body.iban)
    local receiverReason = string.format("%s - from %s", "Transfer received", body.iban)
    Player.removeAccountMoney('bank', body.total, senderReason)
    ReceiverPlayer.addAccountMoney('bank', body.total, receiverReason)

    local content = [[
Nous sommes heureux de vous informer que votre récent transfert d'argent a été effectué avec succès.
\
Voici les détails de la transaction :
\
Total: %s \
IBAN : %s \
Note : %s \
\
Si vous avez des questions ou avez besoin d'aide supplémentaire, n'hésitez pas à nous contacter.
\
Merci d'avoir choisi nos services !
    ]]
    MySQL.Async.insert('INSERT INTO zp_emails (institution, citizenid, subject, content) VALUES (?, ?, ?, ?)', {
        "wallet",
        Player.citizenid,
        "Confirmation de transfert d'argent réussi",
        string.format(content, body.total, body.iban, body.note),
    })

    TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
        type = "Notification",
        from = "Wallet",
        message = "Transfert d'argent réussi!"
    })

    TriggerClientEvent("z-phone:client:sendNotifInternal", ReceiverPlayer.source, {
        type = "Notification",
        from = "Wallet",
        message = "Transfert d'argent reçu"
    })
    return true
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
