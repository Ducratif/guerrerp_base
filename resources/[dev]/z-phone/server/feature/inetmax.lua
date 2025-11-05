--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register('z-phone:server:GetInternetData', function(source)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then return {} end

    --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")
    local queryTopupQuery = [[
        SELECT
        total,
        flag,
        label,
        DATE_FORMAT(created_at, '%d %b %Y') as created_at
        FROM zp_inetmax_histories WHERE citizenid = ? AND flag = ? ORDER BY id desc limit 50
    ]]

    local topups = MySQL.query.await(queryTopupQuery, {
        citizenid,
        "CREDIT"
    })

    local usages = MySQL.query.await(queryTopupQuery, {
        citizenid,
        "USAGE"
    })

    local queryUsageGroup = "SELECT label as app, total FROM zp_inetmax_histories WHERE flag = 'USAGE' and citizenid = ? GROUP BY label"
    local usageGroup = MySQL.query.await(queryUsageGroup, {
        citizenid,
    })

    return {
        topup_histories = topups,
        usage_histories = usages,
        group_usage = usageGroup
    }
end)

lib.callback.register('z-phone:server:TopupInternetData', function(source, body)
    local Player = xCore.GetPlayerBySource(source)
    if Player == nil then return 0 end

   --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")    
    if Player.money.bank < body.total then 
        TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
            type = "Notification",
            from = "InetMax",
            message = "Pas assez de fond !"
        })
        return false
    end

    local IncrementBalance = math.floor(body.total / Config.App.InetMax.TopupRate.Price) * Config.App.InetMax.TopupRate.InKB
    local queryHistories = "INSERT INTO zp_inetmax_histories (citizenid, flag, label, total) VALUES (?, ?, ?, ?)"
    local id = MySQL.insert.await(queryHistories, {
        citizenid,
        "CREDIT",
        body.label,
        IncrementBalance
    })

    local queryIncrementBalance = [[
        UPDATE zp_users SET inetmax_balance = inetmax_balance + ? WHERE citizenid = ?
    ]]

    MySQL.update.await(queryIncrementBalance, {
        IncrementBalance,
        citizenid
    })

    Player.removeAccountMoney('bank', body.total, "InetMax purchase")
    xCore.AddMoneyBankSociety(Config.App.InetMax.SocietySeller, body.total, "InetMax purchase")

    TriggerClientEvent("z-phone:client:sendNotifInternal", source, {
        type = "Notification",
        from = "InetMax",
        message = "Achat effectué"
    })

    local content = [[
Merci d'avoir choisi nos services ! Nous sommes heureux de vous confirmer que votre achat de forfait de données internet a été effectué avec succès.
\
Total: %s \
Taux : $%s / %sKB \
Status : %s \
\
Votre forfait de données sera bientôt activé et vous recevrez un e-mail contenant toutes les informations nécessaires. Pour toute question ou besoin d'aide, n'hésitez pas à nous contacter.
\
Merci de votre confiance !
    ]]
    MySQL.Async.insert('INSERT INTO zp_emails (institution, citizenid, subject, content) VALUES (?, ?, ?, ?)', {
        "inetmax",
        Player.citizenid,
        "Confirmation d'achat de votre forfait de données Internet",
        string.format(content, body.total, Config.App.InetMax.TopupRate.Price, Config.App.InetMax.TopupRate.InKB, "Success"),
    })
    
    return IncrementBalance
end)

local function UseInternetData(citizenid, app, totalInKB)
    local queryHistories = "INSERT INTO zp_inetmax_histories (citizenid, flag, label, total) VALUES (?, ?, ?, ?)"
    MySQL.Async.insert(queryHistories, {
        citizenid,
        "USAGE",
        app,
        totalInKB
    })

    local queryUpdateBalance = [[
        UPDATE zp_users SET inetmax_balance = inetmax_balance - ? WHERE citizenid = ?
    ]]
    MySQL.Async.execute(queryUpdateBalance, {
        totalInKB,
        citizenid
    })
end

RegisterNetEvent('z-phone:server:usage-internet-data', function(app, usageInKB)
    local src = source
    if Config.App.InetMax.IsUseInetMax then
        local Player = xCore.GetPlayerBySource(src)
        if Player == nil then return false end

       --local citizenid = Player.citizenid
    local citizenid = string.gsub(Player.citizenid, "char%d+:", "")    
        UseInternetData(citizenid, app, usageInKB)

        TriggerClientEvent("z-phone:client:usage-internet-data", src,  app, usageInKB)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
