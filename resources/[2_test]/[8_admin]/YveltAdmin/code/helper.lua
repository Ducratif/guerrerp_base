--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]


if IsDuplicityVersion() then -- server side :)
    CreateThread(function()
        Wait(2000)
        if not ESX then
            boolServerESX()
        end
    end)
else -- client side :)
    CreateThread(function()
        Wait(2000)
        if not ESX then
            boolClientESX()
        end
    end)
end

function boolClientESX()
    CreateThread(function()
        while true do
            Wait(1000)
            print('^1[ESX WARN] Vous n\'avez pas défini ESX correctement dans le fichier "esx-client.lua", (Chemin : '..GetCurrentResourceName()..' > config > esx.client.lua) Adaptez ESX a votre base ! Si vous avez besoin d\'aide, vous pouvez également demander du support sur le Discord !^0')
        end
    end)
end

function boolServerESX()
    CreateThread(function()
        while true do
            Wait(1000)
            print('^1[ESX WARN] Vous n\'avez pas défini ESX correctement dans le fichier "esx-server.lua", (Chemin : '..GetCurrentResourceName()..' > config > esx.server.lua) Adaptez ESX a votre base ! Si vous avez besoin d\'aide, vous pouvez également demander du support sur le Discord !^0')
        end
    end)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
