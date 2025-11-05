--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
RegisterServerEvent("mHud:EjectPlayers")
AddEventHandler("mHud:EjectPlayers", function(table)
    for i=1, #table do
        if table[i] then
            if tonumber(table[i]) ~= 0 then
                TriggerClientEvent("mHud:EjectPlayer", table[i])
            end
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
