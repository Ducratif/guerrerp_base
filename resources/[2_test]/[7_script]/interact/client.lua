--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local showingText = false
local currentText = ""
local currentCoords = vec3(0, 0, 0)

-- Fonction pour dessiner du texte en 3D
local function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(x, y)
    local factor = (string.len(text)) / 370
    DrawRect(x, y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 100)
end

-- Thread pour afficher le texte si nécessaire
CreateThread(function()
    while true do
        Wait(0)
        if showingText then
            DrawText3D(currentCoords, currentText)
        else
            Wait(500)
        end
    end
end)

-- Export : ouverture d'une interaction
exports('Open', function(key, msg)
    currentText = "[~g~" .. key .. "~s~] " .. msg
    currentCoords = GetEntityCoords(PlayerPedId()) + vec3(0.0, 0.0, 1.0)
    showingText = true
end)

-- Export : fermeture
exports('Close', function()
    showingText = false
    currentText = ""
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
