--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
if Config.FrameWork == "ESX" then
    ESX = exports["es_extended"]:getSharedObject()
else
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterServerEvent("quitServer")
AddEventHandler("quitServer", function()
    local src = source
	DropPlayer(src, "Disconnected...")
end)

RegisterServerEvent("pausemenu:getData")
AddEventHandler("pausemenu:getData", function()
    if Config.FrameWork == "ESX" then
        local Player = ESX.GetPlayerFromId(source)
        TriggerClientEvent('pausemenu:setData', source, Player.getMoney(), Player.getAccount("bank").money, Player.getJob().grade_label,  Player.getJob().label, Player.getName())
    else
        local Player = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent('pausemenu:setData', source, Player.PlayerData.money.cash, Player.PlayerData.money.bank, Player.PlayerData.job.grade.name, Player.PlayerData.job.label,  Player.PlayerData.charinfo.firstname,  Player.PlayerData.charinfo.lastname)
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
