--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
lib.callback.register("illenium-appearance:server:GetPlayerAces", function()
    local src = source
    local allowedAces = {}
    for i = 1, #Config.Aces do
        local ace = Config.Aces[i]
        if IsPlayerAceAllowed(src, ace) then
            allowedAces[#allowedAces+1] = ace
        end
    end
    return allowedAces
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
