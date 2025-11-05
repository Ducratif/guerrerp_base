--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function Framework.GetGender(isNew)
    if isNew or not Config.GenderBasedOnPed then
        return Framework.GetPlayerGender()
    end

    local model = client.getPedModel(cache.ped)
    if model == "mp_f_freemode_01" then
        return "Female"
    end
    return "Male"
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
