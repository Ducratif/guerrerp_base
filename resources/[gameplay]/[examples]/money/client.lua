--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local moneyTypes = {
    cash = `MP0_WALLET_BALANCE`,
    bank = `BANK_BALANCE`,
}

RegisterNetEvent('money:displayUpdate')

AddEventHandler('money:displayUpdate', function(type, money)
    local stat = moneyTypes[type]
    if not stat then return end
    StatSetInt(stat, math.floor(money))
end)

TriggerServerEvent('money:requestDisplay')

CreateThread(function()
    while true do
        Wait(0)

        if IsControlJustPressed(0, 20) then
            SetMultiplayerBankCash()
            SetMultiplayerWalletCash()

            Wait(4350)

            RemoveMultiplayerBankCash()
            RemoveMultiplayerWalletCash()
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
