--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local npcCoords = vector3(-354.0518, -2783.3201, 6.1856) -- Position du PNJ
local npcModel = "s_m_m_trucker_01" -- Modèle du PNJ
local authorizedVehicles = { -- Liste des véhicules autorisés (mêmes modèles que pour le premier PNJ)
    "hauler",
    "phantom",
    "phantom3",
    "phantom4"
}

-- 🔹 Fonction pour vérifier si le véhicule est autorisé
local function isAuthorizedVehicle(vehicle)
    local model = GetEntityModel(vehicle)
    for _, authorizedModel in ipairs(authorizedVehicles) do
        if model == GetHashKey(authorizedModel) then
            return true
        end
    end
    return false
end

-- 🔹 Spawn du PNJ
Citizen.CreateThread(function()
    RequestModel(GetHashKey(npcModel))
    while not HasModelLoaded(GetHashKey(npcModel)) do
        Wait(1)
    end

    local npc = CreatePed(4, GetHashKey(npcModel), npcCoords.x, npcCoords.y, npcCoords.z - 1.0, 90.0, false, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    FreezeEntityPosition(npc, true)
    
    --print("[JOB TRANSPORT] PNJ pour ranger les véhicules chargé à l'emplacement : ", npcCoords)
end)

-- 🔹 Interaction pour ranger le véhicule
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - npcCoords)

        -- Vérifie si le joueur est proche du PNJ
        if distance < 10.0 then
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            -- Vérifie si le joueur est dans un véhicule
            if DoesEntityExist(vehicle) then
                if isAuthorizedVehicle(vehicle) then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger le véhicule")

                    if IsControlJustReleased(0, 38) then -- Touche E
                        --print("[JOB TRANSPORT] Tentative de suppression du véhicule modèle :", GetEntityModel(vehicle))
                        ESX.Game.DeleteVehicle(vehicle)
                        ESX.ShowNotification("Véhicule rangé avec succès !")
                    end
                --else
                --    print("[JOB TRANSPORT] Le véhicule actuel n'est pas autorisé pour être rangé.")
                end
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
