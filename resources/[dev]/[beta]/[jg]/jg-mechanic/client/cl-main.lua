--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:set-vehicle-statebag"
  L7_2 = false
  L8_2 = VehToNet
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
setVehicleStatebag = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-mechanic:server:set-vehicle-statebags"
  L6_2 = false
  L7_2 = VehToNet
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
setVehicleStatebags = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = lib
    L0_3 = L0_3.requestAnimDict
    L1_3 = A1_2
    L0_3(L1_3)
    L0_3 = IsEntityPlayingAnim
    L1_3 = A0_2
    L2_3 = A1_2
    L3_3 = A2_2
    L4_3 = 3
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    if not L0_3 then
      L0_3 = TaskPlayAnim
      L1_3 = A0_2
      L2_3 = A1_2
      L3_3 = A2_2
      L4_3 = 3.0
      L5_3 = 3.0
      L6_3 = -1
      L7_3 = A3_2
      if L7_3 then
        L7_3 = 33
        if L7_3 then
          goto lbl_27
        end
      end
      L7_3 = 49
      ::lbl_27::
      L8_3 = 0
      L9_3 = false
      L10_3 = false
      L11_3 = false
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    end
  end
  L4_2(L5_2)
end
playAnimation = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = ClearPedTasks
  L2_2 = A0_2
  L1_2(L2_2)
end
stopAnimation = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
  L1_2 = "base"
  L2_2 = -1585232418
  L3_2 = 60309
  L4_2 = vector3
  L5_2 = 0.03
  L6_2 = 0.002
  L7_2 = 0.0
  L7_2 = -L7_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = vector3
  L6_2 = 10.0
  L7_2 = 160.0
  L8_2 = 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L0_3 = lib
    L0_3 = L0_3.requestAnimDict
    L1_3 = L0_2
    L0_3(L1_3)
    L0_3 = lib
    L0_3 = L0_3.requestModel
    L1_3 = L2_2
    L2_3 = 3000
    L0_3(L1_3, L2_3)
    L0_3 = cache
    L0_3 = L0_3.ped
    L1_3 = Globals
    L2_3 = CreateObject
    L3_3 = L2_2
    L4_3 = 0.0
    L5_3 = 0.0
    L6_3 = 0.0
    L7_3 = true
    L8_3 = true
    L9_3 = false
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L1_3.HoldingTablet = L2_3
    L1_3 = GetPedBoneIndex
    L2_3 = L0_3
    L3_3 = L3_2
    L1_3 = L1_3(L2_3, L3_3)
    L2_3 = SetCurrentPedWeapon
    L3_3 = L0_3
    L4_3 = -1569615261
    L5_3 = true
    L2_3(L3_3, L4_3, L5_3)
    L2_3 = AttachEntityToEntity
    L3_3 = Globals
    L3_3 = L3_3.HoldingTablet
    L4_3 = L0_3
    L5_3 = L1_3
    L6_3 = L4_2.x
    L7_3 = L4_2.y
    L8_3 = L4_2.z
    L9_3 = L5_2.x
    L10_3 = L5_2.y
    L11_3 = L5_2.z
    L12_3 = true
    L13_3 = false
    L14_3 = false
    L15_3 = false
    L16_3 = 2
    L17_3 = true
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    L2_3 = SetModelAsNoLongerNeeded
    L3_3 = L2_2
    L2_3(L3_3)
    L2_3 = IsEntityPlayingAnim
    L3_3 = L0_3
    L4_3 = L0_2
    L5_3 = L1_2
    L6_3 = 3
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
    if not L2_3 then
      L2_3 = TaskPlayAnim
      L3_3 = L0_3
      L4_3 = L0_2
      L5_3 = L1_2
      L6_3 = 3.0
      L7_3 = 3.0
      L8_3 = -1
      L9_3 = 49
      L10_3 = 0
      L11_3 = false
      L12_3 = false
      L13_3 = false
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    end
  end
  L6_2(L7_2)
end
playTabletAnim = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Globals
  L0_2 = L0_2.HoldingTablet
  if not L0_2 then
    return
  end
  L0_2 = ClearPedTasks
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2(L1_2)
  L0_2 = DetachEntity
  L1_2 = Globals
  L1_2 = L1_2.HoldingTablet
  L2_2 = true
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DeleteEntity
  L1_2 = Globals
  L1_2 = L1_2.HoldingTablet
  L0_2(L1_2)
  L0_2 = Globals
  L0_2.HoldingTablet = nil
end
stopTabletAnim = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = lib
  L2_2 = L2_2.requestModel
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = CreatePed
  L3_2 = 0
  L4_2 = joaat
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L8_2 = A1_2.w
  if not L8_2 then
    L8_2 = 0
  end
  L9_2 = false
  L10_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = lib
  L3_2 = L3_2.waitFor
  function L4_2()
    local L0_3, L1_3
    L0_3 = DoesEntityExist
    L1_3 = L2_2
    L0_3 = L0_3(L1_3)
    if not L0_3 then
      L0_3 = nil
    end
    return L0_3
  end
  L3_2(L4_2)
  L3_2 = SetEntityInvincible
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetBlockingOfNonTemporaryEvents
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetPedFleeAttributes
  L4_2 = L2_2
  L5_2 = 0
  L6_2 = false
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetPedCombatAttributes
  L4_2 = L2_2
  L5_2 = 17
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = FreezeEntityPosition
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityCoordsNoOffset
  L4_2 = L2_2
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = SetPedCanRagdoll
  L4_2 = L2_2
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityProofs
  L4_2 = L2_2
  L5_2 = true
  L6_2 = true
  L7_2 = true
  L8_2 = true
  L9_2 = true
  L10_2 = true
  L11_2 = true
  L12_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = SetModelAsNoLongerNeeded
  L4_2 = A0_2
  L3_2(L4_2)
  return L2_2
end
createPedForTarget = L0_1
L0_1 = RegisterNUICallback
L1_1 = "has-item"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.itemName
  L3_2 = A0_2.qty
  L4_2 = A1_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:has-item"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "nearby-players"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetEntityCoords
  L3_2 = cache
  L3_2 = L3_2.ped
  L2_2 = L2_2(L3_2)
  L3_2 = 10.0
  L4_2 = A1_2
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:nearby-players"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L3_2
  L10_2 = A0_2
  if L10_2 then
    L10_2 = L10_2.includePlayer
  end
  if not L10_2 then
    L10_2 = false
  end
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-player-balances"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = {}
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetBalance
  L5_2 = "bank"
  L4_2 = L4_2(L5_2)
  L3_2.bank = L4_2
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetBalance
  L5_2 = "cash"
  L4_2 = L4_2(L5_2)
  L3_2.cash = L4_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "close"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = exitCamera
  L2_2()
  L2_2 = stopTabletAnim
  L2_2()
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "isBusy"
  L5_2 = false
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Globals
  L2_2 = L2_2.HoldingTablet
  if not L2_2 then
    L2_2 = Framework
    L2_2 = L2_2.Client
    L2_2 = L2_2.ToggleHud
    L3_2 = true
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2
  while true do
    L0_2 = cache
    L0_2 = L0_2.vehicle
    if L0_2 then
      L0_2 = Entity
      L1_2 = cache
      L1_2 = L1_2.vehicle
      L0_2 = L0_2(L1_2)
      if L0_2 then
        L0_2 = L0_2.state
      end
      if L0_2 then
        L0_2 = L0_2.unpaidModifications
      end
      if L0_2 then
        L0_2 = GetEntitySpeed
        L1_2 = cache
        L1_2 = L1_2.vehicle
        L0_2 = L0_2(L1_2)
        if L0_2 > 1.0 then
          L0_2 = Framework
          L0_2 = L0_2.Client
          L0_2 = L0_2.Notify
          L1_2 = "This vehicle appears to have unpaid for modifications. It has been repossessed."
          L0_2(L1_2)
          L0_2 = DeleteEntity
          L1_2 = cache
          L1_2 = L1_2.vehicle
          L0_2(L1_2)
        end
      end
    end
    L0_2 = Wait
    L1_2 = 10000
    L0_2(L1_2)
  end
end
L0_1(L1_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
