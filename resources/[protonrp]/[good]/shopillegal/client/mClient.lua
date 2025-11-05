--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = exports['es_extended']:getSharedObject()

local yeshop = {
    --{x = 4999.65, y = -5166.42, z = 1.76}
    {x = -79.64, y = 6130.74, z = 29.56}
    ---79.64 6130.74 29.56
} 

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

function illegalshopMenu()
    local mainMenu = RageUI.CreateMenu("Marcher Noir", "Que veux tu Timoté le thug ?")
    mainMenu.TitleFont = 2;
    mainMenu.Closed = function()
        FreezeEntityPosition(PlayerPedId(), false)
    end
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        FreezeEntityPosition(PlayerPedId(), true)
        while mainMenu do
            Wait(0)
            RageUI.IsVisible(mainMenu, function()
                FreezeEntityPosition(PlayerPedId(), true)
                for i, v in pairs(Config) do
                    RageUI.Button(v.label .."", nil, { RightLabel = "~r~" .. v.price.."~HUD_COLOUR_DEGEN_RED~ $" }, true, {
                        onSelected = function()
                            TriggerServerEvent("illegal:buy", v.item, v.type, v.price) -- TODO
                        end
                    })
                end
            end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType("mainMenu", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local cooldown = 500
        local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
        for k,v in pairs(yeshop) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, yeshop[k].x, yeshop[k].y, yeshop[k].z)
            if not mainMenu then
                if distance <= 10.0 then
                    cooldown = 1
                    DrawMarker(1, yeshop[k].x, yeshop[k].y, yeshop[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.20, 1.20, 0.45, 255, 0, 0, 255, 0, 0, 1, nil, nil, 0)
                
                    if distance <= 1.5 then
                        RageUI.Text({message = "Appuyez sur ~r~[E]~s~ pour accéder au marcher noir 💣"})
                        if IsControlJustPressed(0, 51) then
                            illegalshopMenu()
                        end
                    end
                end
            end
        end
        Citizen.Wait(cooldown)
    end
end)

DecorRegister("UHQ", 4)
pedHashloca1 = "ig_chengsr"
--zoneloca1 = vector3(5000.79, -5166.42, 1.76)
zoneloca1 = vector3(-79.64, 6130.74, 29.56)
Headingloca1 = 152.65225219727
Pedloca1 = nil
HeadingSpawnloca1 = 152.65225219727

Citizen.CreateThread(function()
    LoadModel(pedHashloca1)
    Pedloca1 = CreatePed(2, GetHashKey(pedHashloca1), zoneloca1, Headingloca1, 0, 0)
    DecorSetInt(Pedloca1, "UHQ", 5431)
    FreezeEntityPosition(Pedloca1, 1)
    TaskStartScenarioInPlace(Pedloca1, "WORLD_HUMAN_SMOKING_CLUBHOUSE", 0, false)
    SetEntityInvincible(Pedloca1, true)
    SetBlockingOfNonTemporaryEvents(Pedloca1, 1)
end)



RegisterNetEvent('illegal:giveArmor', function(amount)
    local ped = PlayerPedId()
    SetPedArmour(ped, amount)
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
