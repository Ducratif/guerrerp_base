--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Locales = {}

function _L(key)
    local lang = GetConvar("illenium-appearance:locale", "fr")
    if not Locales[lang] then
        lang = "en"
    end
    local value = Locales[lang]
    for k in key:gmatch("[^.]+") do
        value = value[k]
        if not value then
            print("Missing locale for: " .. key)
            return ""
        end
    end
    return value
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
