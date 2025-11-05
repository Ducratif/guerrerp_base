--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local changingSeat = false
local menuActive = false
local currentOptions = {}
local currentIndex = 1

RegisterCommand("changerplace", function()
    if changingSeat or menuActive then return end

    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        ShowNotification("Tu dois être dans un véhicule !")
        return
    end

    local vehicle = GetVehiclePedIsIn(ped, false)
    local currentSeat = GetPedVehicleSeat(ped)

    -- ⚠️ Empêche le changement si le joueur est conducteur et seul
    --if currentSeat == -1 and GetVehicleNumberOfPassengers(vehicle) == 0 then
    --    ShowNotification("Impossible de changer de place : aucun autre occupant dans le véhicule.")
    --    return
    --end

    local seatsToCheck = {-1, 0, 1, 2}
    currentOptions = {}

    for _, seat in ipairs(seatsToCheck) do
        if seat ~= currentSeat and IsVehicleSeatFree(vehicle, seat) then
            table.insert(currentOptions, {
                label = seat == -1 and "Conducteur" or ("Siège " .. seat),
                seat = seat
            })
        end
    end

    if #currentOptions == 0 then
        ShowNotification("Aucune autre place libre dans ce véhicule.")
        return
    end

    menuActive = true
    currentIndex = 1

    CreateThread(function()
        while menuActive do
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)

            ShowMenu("Changer de place")

            if IsControlJustPressed(0, 172) then -- Haut
                currentIndex = currentIndex - 1
                if currentIndex < 1 then currentIndex = #currentOptions end
            elseif IsControlJustPressed(0, 173) then -- Bas
                currentIndex = currentIndex + 1
                if currentIndex > #currentOptions then currentIndex = 1 end
            elseif IsControlJustPressed(0, 191) then -- Entrée
                menuActive = false
                AttemptSeatChange(currentOptions[currentIndex].seat)
            elseif IsControlJustPressed(0, 194) then -- Retour / Echapp
                menuActive = false
            end

            Wait(0)
        end
    end)
end, false)

RegisterKeyMapping("changerplace", "Changer de place dans un véhicule", "keyboard", "J")

function ShowMenu(title)
    local baseX, baseY = 0.5, 0.3
    local rowHeight = 0.045
    local bgWidth = 0.24
    local totalHeight = rowHeight * (#currentOptions + 2)

    -- Fond noir global
    DrawRect(baseX, baseY + (totalHeight / 2), bgWidth, totalHeight, 0, 0, 0, 180)

    -- Titre
    SetTextFont(1)
    SetTextScale(0.5, 0.5)
    SetTextCentre(true)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString("~w~" .. title)
    DrawText(baseX, baseY + 0.01)

    -- Options
    for i, option in ipairs(currentOptions) do
        local y = baseY + (i * rowHeight)

        if i == currentIndex then
            -- Barre descendue légèrement (0.016 → 0.019)
            DrawRect(baseX, y + 0.019, bgWidth - 0.015, rowHeight - 0.007, 255, 255, 255, 100)
        end

        SetTextFont(0)
        SetTextScale(0.44, 0.44)
        SetTextCentre(true)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(option.label)
        DrawText(baseX, y + 0.01)
    end
end


function AttemptSeatChange(seat)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if not vehicle or not IsPedInAnyVehicle(ped, false) then
        ShowNotification("Tu n'es plus dans un véhicule.")
        return
    end

    if not IsVehicleSeatFree(vehicle, seat) then
        ShowNotification("La place est déjà prise.")
        return
    end

    changingSeat = true
    FreezeEntityPosition(ped, true)

    for i = 3, 1, -1 do
        ShowNotification("Changement de place dans " .. i .. "s...")
        Wait(1000)
    end

    -- Warp direct sans quitter le véhicule
    TaskWarpPedIntoVehicle(ped, vehicle, seat)

    FreezeEntityPosition(ped, false)
    changingSeat = false

    ShowNotification("Place changée avec succès !")
end

function GetPedVehicleSeat(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i = -1, 2 do
        if GetPedInVehicleSeat(vehicle, i) == ped then
            return i
        end
    end
    return nil
end

function ShowNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, true)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
