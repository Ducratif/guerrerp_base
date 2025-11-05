--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Hands Up (toggle) – keymappable (clavier & manette)
local handsup = false
local dict = "random@mugging3"
local anim = "handsup_standing_base"

-- Fonction principale
local function toggleHandsUp()
    local ped = PlayerPedId()

    if not handsup then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
        -- 49 = loop + upper body, reste compatible avec déplacements lents
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 49, 0.0, false, false, false)
        handsup = true
    else
        ClearPedTasks(ped)
        handsup = false
    end
end

-- Commande chat (optionnelle)
RegisterCommand("handsup", function()
    toggleHandsUp()
end, false)

-- Keymapping clavier (modifiable dans Paramètres > Liens de touches)
RegisterCommand('+handsup', function()
    toggleHandsUp()
end, false)
RegisterCommand('-handsup', function() end, false)
RegisterKeyMapping('+handsup', 'Lever les mains (clavier)', 'keyboard', 'X')

-- Keymapping manette (mapping séparé pour apparaître côté “pad”)
RegisterCommand('+handsup_pad', function()
    toggleHandsUp()
end, false)
RegisterCommand('-handsup_pad', function() end, false)
RegisterKeyMapping('+handsup_pad', 'Lever les mains (manette)', 'pad', 'L3')

-- NOTE :
-- - Plus besoin de thread IsControlJustPressed : le keymapping gère l’input.
-- - Les joueurs peuvent changer ces touches dans les paramètres FiveM.
--------------------------------------------------------------------------------------

--local handsup = false
--local dict = "random@mugging3"
--local anim = "handsup_standing_base"
--
---- Fonction pour lever / baisser les mains
--local function toggleHandsUp()
--    local ped = PlayerPedId()
--    if not handsup then
--        RequestAnimDict(dict)
--        while not HasAnimDictLoaded(dict) do Wait(10) end
--        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
--        handsup = true
--    else
--        ClearPedTasks(ped)
--        handsup = false
--    end
--end
--
---- Commande chat
--RegisterCommand("handsup", function()
--    toggleHandsUp()
--end, false)
--
---- Raccourci touche (ici X = INPUT_VEH_HORN -> 73)
--Citizen.CreateThread(function()
--    while true do
--        Wait(0)
--        if IsControlJustPressed(0, 73) then -- touche X
--            toggleHandsUp()
--        end
--    end
--end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
