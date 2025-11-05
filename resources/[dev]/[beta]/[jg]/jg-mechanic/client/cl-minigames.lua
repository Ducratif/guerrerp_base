--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 3000
L1_1 = 201
L2_1 = 202
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = cache
  L2_2 = L2_2.ped
  L3_2 = GetEntityCoords
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = ipairs
  L5_2 = A1_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = GetEntityBoneIndexByName
    L11_2 = A0_2
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if -1 == L10_2 then
      L11_2 = true
      return L11_2
    else
      L11_2 = GetWorldPositionOfEntityBone
      L12_2 = A0_2
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      L12_2 = L3_2 - L11_2
      L12_2 = #L12_2
      if L12_2 <= 3.0 then
        L12_2 = true
        return L12_2
      end
    end
  end
  L4_2 = false
  return L4_2
end
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 or not A2_2 then
    return
  end
  L3_2 = GetEntityCoords
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetEntityCoords
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L3_2.z
  L6_2 = L4_2.z
  L5_2 = L5_2 - L6_2
  if L5_2 > 1.0 then
    L5_2 = playAnimation
    L6_2 = A0_2
    L7_2 = "missheist_agency2aig_3"
    L8_2 = "chat_a_worker2"
    L5_2(L6_2, L7_2, L8_2)
  elseif "engine" == A1_2 then
    L5_2 = playAnimation
    L6_2 = A0_2
    L7_2 = "mini@repair"
    L8_2 = "fixing_a_ped"
    L5_2(L6_2, L7_2, L8_2)
  elseif "kneeling" == A1_2 then
    L5_2 = playAnimation
    L6_2 = A0_2
    L7_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    L8_2 = "machinic_loop_mechandplayer"
    L9_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = 232216084
  L2_2 = 1450715350
  L3_2 = lib
  L3_2 = L3_2.requestModel
  L4_2 = L1_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = lib
  L3_2 = L3_2.requestModel
  L4_2 = L2_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = CreateObject
  L4_2 = L2_2
  L5_2 = A0_2.x
  L6_2 = A0_2.y
  L7_2 = A0_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = NetworkSetObjectForceStaticBlend
  L5_2 = L3_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  while true do
    L4_2 = HasCollisionLoadedAroundEntity
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 1
    L4_2(L5_2)
  end
  L4_2 = PlaceObjectOnGroundProperly
  L5_2 = L3_2
  L4_2(L5_2)
  L4_2 = CreateObject
  L5_2 = L1_2
  L6_2 = A0_2.x
  L7_2 = A0_2.y
  L8_2 = A0_2.z
  L9_2 = true
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = NetworkSetObjectForceStaticBlend
  L6_2 = L4_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  while true do
    L5_2 = HasCollisionLoadedAroundEntity
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      break
    end
    L5_2 = Wait
    L6_2 = 1
    L5_2(L6_2)
  end
  L5_2 = AttachEntityToEntity
  L6_2 = L4_2
  L7_2 = L3_2
  L8_2 = 0
  L9_2 = 0.0
  L10_2 = -1.1
  L11_2 = 1.25
  L12_2 = 0.0
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = false
  L16_2 = false
  L17_2 = true
  L18_2 = false
  L19_2 = 2
  L20_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L5_2 = SetEntityCollision
  L6_2 = L3_2
  L7_2 = false
  L8_2 = false
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = SetEntityCanBeDamaged
  L6_2 = L3_2
  L7_2 = false
  L5_2(L6_2, L7_2)
  L5_2 = SetEntityCollision
  L6_2 = L4_2
  L7_2 = false
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = L3_2
  L6_2 = L4_2
  return L5_2, L6_2
end
function L6_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 then
    L2_2 = DeleteEntity
    L3_2 = A0_2
    L2_2(L3_2)
  end
  if A1_2 then
    L2_2 = DeleteEntity
    L3_2 = A1_2
    L2_2(L3_2)
  end
end
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = cache
  L3_2 = L3_2.ped
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = vector3
  L6_2 = 1.5
  L7_2 = 0.0
  L8_2 = 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = TaskLeaveVehicle
  L7_2 = L3_2
  L8_2 = A0_2
  L9_2 = 16
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = Entity
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.state
  L7_2 = L6_2
  L6_2 = L6_2.set
  L8_2 = "vehicleBonnetDeleted"
  L9_2 = true
  L10_2 = true
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = L5_1
  L7_2 = L4_2
  L6_2, L7_2 = L6_2(L7_2)
  L8_2 = PlaySoundFrontend
  L9_2 = -1
  L10_2 = "CONTINUE"
  L11_2 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
  L12_2 = false
  L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2 = SetNuiFocus
  L9_2 = false
  L10_2 = false
  L8_2(L9_2, L10_2)
  L8_2 = hideTabletToShowInteractionPrompt
  L9_2 = Locale
  L9_2 = L9_2.takeEngineHoistToVehicle
  L8_2(L9_2)
  L8_2 = CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    while true do
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = IsControlJustReleased
      L1_3 = 0
      L2_3 = L2_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = GetEntityCoords
      L1_3 = L3_2
      L0_3 = L0_3(L1_3)
      L1_3 = GetEntityForwardVector
      L2_3 = L3_2
      L1_3 = L1_3(L2_3)
      L2_3 = vector3
      L3_3 = L1_3.y
      L4_3 = L1_3.x
      L4_3 = -L4_3
      L5_3 = L1_3.z
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L3_3 = L5_2.x
      L3_3 = L1_3 * L3_3
      L3_3 = L0_3 + L3_3
      L4_3 = L5_2.y
      L4_3 = L2_3 * L4_3
      L3_3 = L3_3 + L4_3
      L4_3 = vector3
      L5_3 = 0.0
      L6_3 = 0.0
      L7_3 = L5_2.z
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L3_3 = L3_3 + L4_3
      L4_3 = GetGroundZFor_3dCoord
      L5_3 = L3_3.x
      L6_3 = L3_3.y
      L7_3 = L3_3.z
      L8_3 = true
      L4_3, L5_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
      L6_3 = SetEntityCoords
      L7_3 = L6_2
      L8_3 = L3_3.x
      L9_3 = L3_3.y
      L10_3 = L5_3
      L11_3 = true
      L12_3 = true
      L13_3 = true
      L14_3 = false
      L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
      L6_3 = math
      L6_3 = L6_3.deg
      L7_3 = math
      L7_3 = L7_3.atan
      L8_3 = L3_3.y
      L9_3 = L0_3.y
      L8_3 = L8_3 - L9_3
      L9_3 = L3_3.x
      L10_3 = L0_3.x
      L9_3 = L9_3 - L10_3
      L8_3 = L8_3 / L9_3
      L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3 = L7_3(L8_3)
      L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
      L6_3 = L6_3 - 270.0
      L7_3 = L3_3.x
      L8_3 = L0_3.x
      if L7_3 < L8_3 then
        L6_3 = L6_3 - 180.0
      end
      L7_3 = SetEntityRotation
      L8_3 = L6_2
      L9_3 = 0.0
      L10_3 = 0.0
      L11_3 = L6_3
      L12_3 = 2
      L13_3 = true
      L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
      L7_3 = Wait
      L8_3 = 0
      L7_3(L8_3)
    end
    L0_3 = IsControlJustReleased
    L1_3 = 0
    L2_3 = L2_1
    L0_3 = L0_3(L1_3, L2_3)
    if L0_3 then
      L0_3 = showTabletAfterInteractionPrompt
      L0_3()
      L0_3 = stopAnimation
      L1_3 = L3_2
      L0_3(L1_3)
      L0_3 = L6_1
      L1_3 = L6_2
      L2_3 = L7_2
      L0_3(L1_3, L2_3)
      L0_3 = Entity
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      L0_3 = L0_3.state
      L1_3 = L0_3
      L0_3 = L0_3.set
      L2_3 = "vehicleBonnetDeleted"
      L3_3 = false
      L4_3 = true
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = A2_2
      L1_3 = false
      return L0_3(L1_3)
    end
    L0_3 = hideTabletToShowInteractionPrompt
    L1_3 = Locale
    L1_3 = L1_3.goToEngineToInstall
    L0_3(L1_3)
    L0_3 = Wait
    L1_3 = 100
    L0_3(L1_3)
    L0_3 = PlaySoundFrontend
    L1_3 = -1
    L2_3 = "CONTINUE"
    L3_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    L4_3 = false
    L0_3(L1_3, L2_3, L3_3, L4_3)
    while true do
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L3_1
        L1_3 = A0_2
        L2_3 = {}
        L3_3 = "engine"
        L2_3[1] = L3_3
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          break
        end
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = Framework
        L0_3 = L0_3.Client
        L0_3 = L0_3.Notify
        L1_3 = Locale
        L1_3 = L1_3.notNearbyToEngine
        L2_3 = "error"
        L0_3(L1_3, L2_3)
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = L4_1
    L1_3 = L3_2
    L2_3 = "engine"
    L3_3 = A0_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Framework
    L0_3 = L0_3.Client
    L0_3 = L0_3.PlaySound
    L1_3 = "repair"
    L2_3 = L4_2
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = Framework
    L1_3 = L1_3.Client
    L1_3 = L1_3.SkillCheck
    function L2_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = stopAnimation
      L1_4 = L3_2
      L0_4(L1_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.StopSound
      L1_4 = L0_3
      L0_4(L1_4)
      L0_4 = L6_1
      L1_4 = L6_2
      L2_4 = L7_2
      L0_4(L1_4, L2_4)
      L0_4 = Entity
      L1_4 = A0_2
      L0_4 = L0_4(L1_4)
      L0_4 = L0_4.state
      L1_4 = L0_4
      L0_4 = L0_4.set
      L2_4 = "vehicleBonnetDeleted"
      L3_4 = false
      L4_4 = true
      L0_4(L1_4, L2_4, L3_4, L4_4)
      L0_4 = A2_2
      L1_4 = true
      L0_4(L1_4)
    end
    function L3_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = stopAnimation
      L1_4 = L3_2
      L0_4(L1_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.StopSound
      L1_4 = L0_3
      L0_4(L1_4)
      L0_4 = L6_1
      L1_4 = L6_2
      L2_4 = L7_2
      L0_4(L1_4, L2_4)
      L0_4 = Entity
      L1_4 = A0_2
      L0_4 = L0_4(L1_4)
      L0_4 = L0_4.state
      L1_4 = L0_4
      L0_4 = L0_4.set
      L2_4 = "vehicleBonnetDeleted"
      L3_4 = false
      L4_4 = true
      L0_4(L1_4, L2_4, L3_4, L4_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.Notify
      L1_4 = Locale
      L1_4 = L1_4.installationFailed
      L2_4 = "error"
      L0_4(L1_4, L2_4)
      L0_4 = A2_2
      L1_4 = false
      L0_4(L1_4)
    end
    L1_3(L2_3, L3_3)
  end
  L8_2(L9_2)
end
swapEngineMinigame = L7_1
L7_1 = AddStateBagChangeHandler
L8_1 = "vehicleBonnetDeleted"
L9_1 = ""
function L10_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
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
  if A2_2 then
    L4_2 = SetVehicleDoorBroken
    L5_2 = L3_2
    L6_2 = 4
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
  else
    L4_2 = SetVehicleFixed
    L5_2 = L3_2
    L4_2(L5_2)
  end
end
L7_1(L8_1, L9_1, L10_1)
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetHashKey
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = lib
  L3_2 = L3_2.requestModel
  L4_2 = L2_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = CreateObject
  L4_2 = L2_2
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = NetworkSetObjectForceStaticBlend
  L5_2 = L3_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  while true do
    L4_2 = HasCollisionLoadedAroundEntity
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 1
    L4_2(L5_2)
  end
  return L3_2
end
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L3_2 = A1_2.prop
  if not L3_2 then
    L4_2 = A2_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = cache
  L4_2 = L4_2.ped
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = TaskLeaveVehicle
  L7_2 = L4_2
  L8_2 = A0_2
  L9_2 = 16
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = 0
  L7_2 = {}
  L8_2 = "ERROR"
  L9_2 = "kneeling"
  if "wheel" == L3_2 then
    L10_2 = {}
    L11_2 = "wheel_lf"
    L12_2 = "wheel_rf"
    L13_2 = "wheel_lr"
    L14_2 = "wheel_rr"
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L10_2[4] = L14_2
    L7_2 = L10_2
    L10_2 = Locale
    L8_2 = L10_2.notNearWheel
    L9_2 = "kneeling"
    L10_2 = L7_1
    L11_2 = "prop_wheel_01"
    L12_2 = L5_2
    L10_2 = L10_2(L11_2, L12_2)
    L6_2 = L10_2
    L10_2 = AttachEntityToEntity
    L11_2 = L6_2
    L12_2 = L4_2
    L13_2 = 62
    L14_2 = 0.075443142898393
    L15_2 = 0.093685241510963
    L16_2 = 0.28141744731019
    L17_2 = -172.34215070538
    L18_2 = 0
    L19_2 = 0
    L20_2 = true
    L21_2 = true
    L22_2 = false
    L23_2 = true
    L24_2 = 1
    L25_2 = true
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L10_2 = playAnimation
    L11_2 = L4_2
    L12_2 = "anim@heists@box_carry@"
    L13_2 = "idle"
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = hideTabletToShowInteractionPrompt
    L11_2 = Locale
    L11_2 = L11_2.takeWheel
    L10_2(L11_2)
  elseif "canister" == L3_2 then
    L10_2 = {}
    L11_2 = "engine"
    L10_2[1] = L11_2
    L7_2 = L10_2
    L10_2 = Locale
    L8_2 = L10_2.notNearbyToEngine
    L9_2 = "engine"
    L10_2 = L7_1
    L11_2 = "prop_gascyl_01a"
    L12_2 = L5_2
    L10_2 = L10_2(L11_2, L12_2)
    L6_2 = L10_2
    L10_2 = AttachEntityToEntity
    L11_2 = L6_2
    L12_2 = L4_2
    L13_2 = 62
    L14_2 = 0.03949541175723
    L15_2 = 0.11786201460733
    L16_2 = 0.12430043235594
    L17_2 = -157.12101467039
    L18_2 = 7.9513867036588E-16
    L19_2 = 37.736651343458
    L20_2 = true
    L21_2 = true
    L22_2 = false
    L23_2 = true
    L24_2 = 1
    L25_2 = true
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L10_2 = playAnimation
    L11_2 = L4_2
    L12_2 = "anim@heists@box_carry@"
    L13_2 = "idle"
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = SetVehicleDoorOpen
    L11_2 = A0_2
    L12_2 = 4
    L13_2 = false
    L14_2 = false
    L10_2(L11_2, L12_2, L13_2, L14_2)
    L10_2 = hideTabletToShowInteractionPrompt
    L11_2 = Locale
    L11_2 = L11_2.takeCanisterToEngine
    L10_2(L11_2)
  elseif "spanner" == L3_2 then
    L10_2 = {}
    L11_2 = "engine"
    L10_2[1] = L11_2
    L7_2 = L10_2
    L10_2 = Locale
    L8_2 = L10_2.notNearbyToEngine
    L9_2 = "engine"
    L10_2 = L7_1
    L11_2 = "prop_tool_spanner01"
    L12_2 = L5_2
    L10_2 = L10_2(L11_2, L12_2)
    L6_2 = L10_2
    L10_2 = AttachEntityToEntity
    L11_2 = L6_2
    L12_2 = L4_2
    L13_2 = 62
    L14_2 = 0.08416675285639
    L15_2 = -0.0059900812103676
    L16_2 = 0.011921186133477
    L17_2 = -93.957684264985
    L18_2 = -79.548849524562
    L19_2 = 21.94560085578
    L20_2 = true
    L21_2 = true
    L22_2 = false
    L23_2 = true
    L24_2 = 1
    L25_2 = true
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L10_2 = SetVehicleDoorOpen
    L11_2 = A0_2
    L12_2 = 4
    L13_2 = false
    L14_2 = false
    L10_2(L11_2, L12_2, L13_2, L14_2)
    L10_2 = hideTabletToShowInteractionPrompt
    L11_2 = Locale
    L11_2 = L11_2.goToEngineToInstallOrCancel
    L10_2(L11_2)
  end
  if 0 == L6_2 then
    L10_2 = showTabletAfterInteractionPrompt
    L10_2()
    L10_2 = A2_2
    L11_2 = false
    return L10_2(L11_2)
  end
  L10_2 = CreateThread
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = SetNuiFocus
    L1_3 = false
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = 200
    L0_3(L1_3)
    L0_3 = PlaySoundFrontend
    L1_3 = -1
    L2_3 = "CONTINUE"
    L3_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    L4_3 = false
    L0_3(L1_3, L2_3, L3_3, L4_3)
    while true do
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = IsControlJustReleased
      L1_3 = 0
      L2_3 = L2_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    while true do
      L0_3 = IsControlJustReleased
      L1_3 = 0
      L2_3 = L2_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        break
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L3_1
        L1_3 = A0_2
        L2_3 = L7_2
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          break
        end
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = L1_1
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = Framework
        L0_3 = L0_3.Client
        L0_3 = L0_3.Notify
        L1_3 = L8_2
        L2_3 = "error"
        L0_3(L1_3, L2_3)
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = DeleteEntity
    L1_3 = L6_2
    L0_3(L1_3)
    L0_3 = stopAnimation
    L1_3 = L4_2
    L0_3(L1_3)
    L0_3 = IsControlJustReleased
    L1_3 = 0
    L2_3 = L2_1
    L0_3 = L0_3(L1_3, L2_3)
    if L0_3 then
      L0_3 = SetVehicleDoorsShut
      L1_3 = A0_2
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = showTabletAfterInteractionPrompt
      L0_3()
      L0_3 = A2_2
      L1_3 = false
      return L0_3(L1_3)
    end
    L0_3 = Wait
    L1_3 = 200
    L0_3(L1_3)
    L0_3 = L4_1
    L1_3 = L4_2
    L2_3 = L9_2
    L3_3 = A0_2
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Framework
    L0_3 = L0_3.Client
    L0_3 = L0_3.PlaySound
    L1_3 = "repair"
    L2_3 = L5_2
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = Framework
    L1_3 = L1_3.Client
    L1_3 = L1_3.SkillCheck
    function L2_3()
      local L0_4, L1_4, L2_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = stopAnimation
      L1_4 = L4_2
      L0_4(L1_4)
      L0_4 = DeleteEntity
      L1_4 = L6_2
      L0_4(L1_4)
      L0_4 = SetVehicleDoorsShut
      L1_4 = A0_2
      L2_4 = false
      L0_4(L1_4, L2_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.StopSound
      L1_4 = L0_3
      L0_4(L1_4)
      L0_4 = A2_2
      L1_4 = true
      L0_4(L1_4)
    end
    function L3_3()
      local L0_4, L1_4, L2_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = stopAnimation
      L1_4 = L4_2
      L0_4(L1_4)
      L0_4 = DeleteEntity
      L1_4 = L6_2
      L0_4(L1_4)
      L0_4 = SetVehicleDoorsShut
      L1_4 = A0_2
      L2_4 = false
      L0_4(L1_4, L2_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.StopSound
      L1_4 = L0_3
      L0_4(L1_4)
      L0_4 = Framework
      L0_4 = L0_4.Client
      L0_4 = L0_4.Notify
      L1_4 = Locale
      L1_4 = L1_4.installationFailed
      L2_4 = "error"
      L0_4(L1_4, L2_4)
      L0_4 = A2_2
      L1_4 = false
      L0_4(L1_4)
    end
    L1_3(L2_3, L3_3)
  end
  L10_2(L11_2)
end
propBasedMinigame = L8_1
function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = cache
  L3_2 = L3_2.ped
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = TaskLeaveVehicle
  L6_2 = L3_2
  L7_2 = A0_2
  L8_2 = 16
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    L0_3 = "switch@franklin@cleaning_car"
    L1_3 = "001946_01_gc_fras_v2_ig_5_base"
    L2_3 = "prop_paint_spray01b"
    L3_3 = "core"
    L4_3 = "ent_sht_steam"
    L5_3 = lib
    L5_3 = L5_3.requestAnimDict
    L6_3 = L0_3
    L5_3(L6_3)
    L5_3 = lib
    L5_3 = L5_3.requestModel
    L6_3 = L2_3
    L7_3 = L0_1
    L5_3(L6_3, L7_3)
    L5_3 = lib
    L5_3 = L5_3.requestNamedPtfxAsset
    L6_3 = L3_3
    L5_3(L6_3)
    L5_3 = CreateObject
    L6_3 = GetHashKey
    L7_3 = L2_3
    L6_3 = L6_3(L7_3)
    L7_3 = L4_2.x
    L8_3 = L4_2.y
    L9_3 = L4_2.z
    L10_3 = true
    L11_3 = true
    L12_3 = true
    L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
    L6_3 = AttachEntityToEntity
    L7_3 = L5_3
    L8_3 = L3_2
    L9_3 = 71
    L10_3 = 0.05
    L11_3 = 0.0
    L12_3 = -0.02
    L13_3 = 0.0
    L14_3 = 90.0
    L15_3 = 90.0
    L16_3 = true
    L17_3 = true
    L18_3 = false
    L19_3 = true
    L20_3 = 1
    L21_3 = true
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
    L6_3 = SetNuiFocus
    L7_3 = false
    L8_3 = false
    L6_3(L7_3, L8_3)
    L6_3 = hideTabletToShowInteractionPrompt
    L7_3 = Locale
    L7_3 = L7_3.pressToRespray
    L6_3(L7_3)
    L6_3 = Wait
    L7_3 = 200
    L6_3(L7_3)
    L6_3 = PlaySoundFrontend
    L7_3 = -1
    L8_3 = "CONTINUE"
    L9_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    L10_3 = false
    L6_3(L7_3, L8_3, L9_3, L10_3)
    while true do
      L6_3 = IsControlJustPressed
      L7_3 = 0
      L8_3 = L1_1
      L6_3 = L6_3(L7_3, L8_3)
      if L6_3 then
        break
      end
      L6_3 = IsControlJustReleased
      L7_3 = 0
      L8_3 = L2_1
      L6_3 = L6_3(L7_3, L8_3)
      if L6_3 then
        break
      end
      L6_3 = Wait
      L7_3 = 0
      L6_3(L7_3)
    end
    while true do
      L6_3 = IsControlJustReleased
      L7_3 = 0
      L8_3 = L2_1
      L6_3 = L6_3(L7_3, L8_3)
      if L6_3 then
        break
      end
      L6_3 = IsControlJustPressed
      L7_3 = 0
      L8_3 = L1_1
      L6_3 = L6_3(L7_3, L8_3)
      if L6_3 then
        L6_3 = GetEntityCoords
        L7_3 = L3_2
        L6_3 = L6_3(L7_3)
        L7_3 = GetEntityCoords
        L8_3 = A0_2
        L7_3 = L7_3(L8_3)
        L6_3 = L6_3 - L7_3
        L6_3 = #L6_3
        if not (L6_3 > 4.0) then
          break
        end
      end
      L6_3 = IsControlJustPressed
      L7_3 = 0
      L8_3 = L1_1
      L6_3 = L6_3(L7_3, L8_3)
      if L6_3 then
        L6_3 = Framework
        L6_3 = L6_3.Client
        L6_3 = L6_3.Notify
        L7_3 = Locale
        L7_3 = L7_3.tooFarFromVehicle
        L8_3 = "error"
        L6_3(L7_3, L8_3)
        L6_3 = Wait
        L7_3 = 100
        L6_3(L7_3)
      end
      L6_3 = Wait
      L7_3 = 0
      L6_3(L7_3)
    end
    L6_3 = IsControlJustReleased
    L7_3 = 0
    L8_3 = L2_1
    L6_3 = L6_3(L7_3, L8_3)
    if L6_3 then
      L6_3 = DeleteObject
      L7_3 = L5_3
      L6_3(L7_3)
      L6_3 = ClearPedTasksImmediately
      L7_3 = L3_2
      L6_3(L7_3)
      L6_3 = showTabletAfterInteractionPrompt
      L6_3()
      L6_3 = A2_2
      L7_3 = false
      return L6_3(L7_3)
    end
    L6_3 = Wait
    L7_3 = 200
    L6_3(L7_3)
    L6_3 = hideTabletToShowInteractionPrompt
    L7_3 = Locale
    L7_3 = L7_3.paintEvenlyMsg
    L6_3(L7_3)
    L6_3 = TaskPlayAnim
    L7_3 = L3_2
    L8_3 = L0_3
    L9_3 = L1_3
    L10_3 = 8.0
    L11_3 = -8
    L12_3 = -1
    L13_3 = 49
    L14_3 = 0
    L15_3 = false
    L16_3 = false
    L17_3 = false
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    L6_3 = CreateThread
    function L7_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4
      L0_4 = 0
      L1_4 = 2
      L2_4 = 1
      for L3_4 = L0_4, L1_4, L2_4 do
        L4_4 = UseParticleFxAssetNextCall
        L5_4 = L3_3
        L4_4(L5_4)
        L4_4 = StartParticleFxLoopedOnEntity
        L5_4 = L4_3
        L6_4 = L5_3
        L7_4 = 0.0
        L8_4 = 0.0
        L9_4 = 0.15
        L10_4 = 0.0
        L11_4 = 0.0
        L12_4 = 0.0
        L13_4 = 1.0
        L14_4 = false
        L15_4 = false
        L16_4 = false
        L4_4 = L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4)
        L5_4 = Citizen
        L5_4 = L5_4.Wait
        L6_4 = 5000
        L5_4(L6_4)
        L5_4 = StopParticleFxLooped
        L6_4 = L4_4
        L7_4 = false
        L5_4(L6_4, L7_4)
      end
    end
    L6_3(L7_3)
    L6_3 = Framework
    L6_3 = L6_3.Client
    L6_3 = L6_3.ProgressBar
    L7_3 = Locale
    L7_3 = L7_3.resprayingVehicleProgress
    L8_3 = 15000
    L9_3 = false
    L10_3 = false
    function L11_3()
      local L0_4, L1_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = DeleteObject
      L1_4 = L5_3
      L0_4(L1_4)
      L0_4 = ClearPedTasksImmediately
      L1_4 = L3_2
      L0_4(L1_4)
      L0_4 = A2_2
      L1_4 = true
      L0_4(L1_4)
    end
    function L12_3()
      local L0_4, L1_4
      L0_4 = showTabletAfterInteractionPrompt
      L0_4()
      L0_4 = DeleteObject
      L1_4 = L5_3
      L0_4(L1_4)
      L0_4 = ClearPedTasksImmediately
      L1_4 = L3_2
      L0_4(L1_4)
      L0_4 = A2_2
      L1_4 = false
      L0_4(L1_4)
    end
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
  end
  L5_2(L6_2)
end
paintSprayMinigame = L8_1
function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 or 0 == A0_2 then
    L4_2 = A3_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = propBasedMinigame
  if "respray" == A1_2 then
    L4_2 = paintSprayMinigame
  end
  if "engineSwap" == A1_2 then
    L4_2 = swapEngineMinigame
  end
  L5_2 = L4_2
  L6_2 = A0_2
  L7_2 = A2_2
  L8_2 = A3_2
  L5_2(L6_2, L7_2, L8_2)
end
playMinigame = L8_1

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
