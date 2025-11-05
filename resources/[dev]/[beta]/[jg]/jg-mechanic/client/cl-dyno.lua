--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = false
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = getVehicleHandlingValue
  L3_2 = A0_2
  L4_2 = "CHandlingData"
  L5_2 = "fDriveBiasFront"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = 0.5
  if L2_2 > L3_2 or 0.5 == L2_2 then
    L3_2 = SetVehicleWheelRotationSpeed
    L4_2 = A0_2
    L5_2 = 0
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = SetVehicleWheelRotationSpeed
    L4_2 = A0_2
    L5_2 = 1
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = 0.5
  if L2_2 < L3_2 or 0.5 == L2_2 then
    L3_2 = SetVehicleWheelRotationSpeed
    L4_2 = A0_2
    L5_2 = 2
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = SetVehicleWheelRotationSpeed
    L4_2 = A0_2
    L5_2 = 3
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
  end
end
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = 0
    L1_3 = true
    L0_1 = L1_3
    timeout = L0_3
    L0_3 = SetVehicleGravity
    L1_3 = A0_2
    L2_3 = false
    L0_3(L1_3, L2_3)
    while true do
      L0_3 = timeout
      L1_3 = 33500
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = Entity
      L2_3 = A0_2
      L1_3 = L1_3(L2_3)
      L1_3 = L1_3.state
      L2_3 = L1_3
      L1_3 = L1_3.set
      L3_3 = "vehicleDyno"
      L4_3 = {}
      L5_3 = math
      L5_3 = L5_3.min
      L6_3 = 1.0
      L7_3 = timeout
      L7_3 = L7_3 + 7500
      L7_3 = L7_3 / 33500
      L7_3 = L7_3 + 0.0
      L5_3 = L5_3(L6_3, L7_3)
      L4_3.rpm = L5_3
      L5_3 = timeout
      L5_3 = L5_3 / 200
      L5_3 = L5_3 + 0.0
      L4_3.wheelSpeed = L5_3
      L5_3 = true
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = Wait
      L2_3 = 50
      L1_3(L2_3)
      L1_3 = timeout
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      L2_3 = L2_3 - L0_3
      L1_3 = L1_3 + L2_3
      timeout = L1_3
    end
    L0_3 = Entity
    L1_3 = A0_2
    L0_3 = L0_3(L1_3)
    L0_3 = L0_3.state
    L1_3 = L0_3
    L0_3 = L0_3.set
    L2_3 = "vehicleDyno"
    L3_3 = false
    L4_3 = true
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = SetVehicleGravity
    L1_3 = A0_2
    L2_3 = true
    L0_3(L1_3, L2_3)
  end
  L1_2(L2_2)
end
L3_1 = AddStateBagChangeHandler
L4_1 = "vehicleDyno"
L5_1 = ""
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = GetEntityFromStateBagName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if 0 ~= L3_2 then
    L4_2 = DoesEntityExist
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_12
    end
  end
  do return end
  ::lbl_12::
  if not A2_2 then
    L4_2 = L1_1
    L5_2 = L3_2
    L6_2 = 0
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = A2_2.rpm
  L5_2 = A2_2.wheelSpeed
  L6_2 = SetVehicleCurrentRpm
  L7_2 = L3_2
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = L1_1
  L7_2 = L3_2
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
end
L3_1(L4_1, L5_1, L6_1)
L3_1 = RegisterNUICallback
L4_1 = "start-dyno"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = LocalPlayer
  L3_2 = L3_2.state
  L3_2 = L3_2.tabletConnectedVehicle
  if L3_2 then
    L3_2 = L3_2.vehicleEntity
  end
  if L3_2 then
    L4_2 = DoesEntityExist
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_20
    end
  end
  L4_2 = A1_2
  L5_2 = false
  do return L4_2(L5_2) end
  ::lbl_20::
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = SetNuiFocus
    L1_3 = false
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = GetPedInVehicleSeat
    L1_3 = L3_2
    L2_3 = -1
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = L2_2
    if L0_3 ~= L1_3 then
      L0_3 = hideTabletToShowInteractionPrompt
      L1_3 = Locale
      L1_3 = L1_3.enterVehicleToStartDynoMsg
      L0_3(L1_3)
      while true do
        L0_3 = GetPedInVehicleSeat
        L1_3 = L3_2
        L2_3 = -1
        L0_3 = L0_3(L1_3, L2_3)
        L1_3 = L2_2
        if L0_3 == L1_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
      end
    end
    L0_3 = hideTabletToShowInteractionPrompt
    L1_3 = Locale
    L1_3 = L1_3.startDynoMsg
    L0_3(L1_3)
    while true do
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 201
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = SetNuiFocus
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = showTabletAfterInteractionPrompt
    L0_3()
    L0_3 = A1_2
    L1_3 = {}
    L2_3 = getVehicleHandlingValue
    L3_3 = L3_2
    L4_3 = "CHandlingData"
    L5_3 = "fInitialDriveMaxFlatVel"
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L1_3.maxSpeed = L2_3
    L2_3 = getVehicleHandlingValue
    L3_3 = L3_2
    L4_3 = "CHandlingData"
    L5_3 = "fDriveInertia"
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L1_3.fDriveInertia = L2_3
    L2_3 = getVehicleHandlingValue
    L3_3 = L3_2
    L4_3 = "CHandlingData"
    L5_3 = "fInitialDriveForce"
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L1_3.fInitialDriveForce = L2_3
    L0_3(L1_3)
    L0_3 = L2_1
    L1_3 = L3_2
    L0_3(L1_3)
  end
  L4_2(L5_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNUICallback
L4_1 = "stop-dyno"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = false
  L0_1 = L2_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNUICallback
L4_1 = "dyno-share-with-player"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.player
  L3_2 = A0_2.results
  if not L2_2 or not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = A1_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:dyno-share-with-player"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "jg-mechanic:client:dyno-show-results-sheet"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "show-dyno-share-sheet"
  L2_2.results = A0_2
  L3_2 = Locale
  L2_2.locale = L3_2
  L3_2 = Config
  L2_2.config = L3_2
  L1_2(L2_2)
end
L3_1(L4_1, L5_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
