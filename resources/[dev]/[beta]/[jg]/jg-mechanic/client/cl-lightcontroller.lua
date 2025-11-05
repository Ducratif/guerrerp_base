--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 0
L1_1 = 0
L2_1 = false
L3_1 = false
L4_1 = true
L5_1 = false
L6_1 = nil
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  A0_2 = A0_2 * 360
  L6_2 = A2_2 * A1_2
  L7_2 = math
  L7_2 = L7_2.abs
  L8_2 = A0_2 / 60
  L8_2 = L8_2 % 2
  L8_2 = L8_2 - 1
  L7_2 = L7_2(L8_2)
  L8_2 = 1
  L7_2 = L8_2 - L7_2
  L7_2 = L6_2 * L7_2
  L8_2 = A2_2 - L6_2
  if A0_2 >= 0 and A0_2 < 60 then
    L9_2 = L6_2
    L10_2 = L7_2
    L5_2 = 0
    L4_2 = L10_2
    L3_2 = L9_2
  elseif A0_2 >= 60 and A0_2 < 120 then
    L9_2 = L7_2
    L10_2 = L6_2
    L5_2 = 0
    L4_2 = L10_2
    L3_2 = L9_2
  else
    if A0_2 >= 120 then
      L9_2 = 180
      if A0_2 < L9_2 then
        L9_2 = 0
        L10_2 = L6_2
        L5_2 = L7_2
        L4_2 = L10_2
        L3_2 = L9_2
    end
    else
      L9_2 = 180
      if A0_2 >= L9_2 then
        L9_2 = 240
        if A0_2 < L9_2 then
          L9_2 = 0
          L10_2 = L7_2
          L5_2 = L6_2
          L4_2 = L10_2
          L3_2 = L9_2
      end
      else
        L9_2 = 240
        if A0_2 >= L9_2 then
          L9_2 = 300
          if A0_2 < L9_2 then
            L9_2 = L7_2
            L10_2 = 0
            L5_2 = L6_2
            L4_2 = L10_2
            L3_2 = L9_2
        end
        else
          L9_2 = 300
          if A0_2 >= L9_2 then
            L9_2 = 360
            if A0_2 <= L9_2 then
              L9_2 = L6_2
              L10_2 = 0
              L5_2 = L7_2
              L4_2 = L10_2
              L3_2 = L9_2
            end
          end
        end
      end
    end
  end
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L3_2 + L8_2
  L10_2 = L10_2 * 255
  L9_2 = L9_2(L10_2)
  L3_2 = L9_2
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L4_2 + L8_2
  L10_2 = L10_2 * 255
  L9_2 = L9_2(L10_2)
  L4_2 = L9_2
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L5_2 + L8_2
  L10_2 = L10_2 * 255
  L9_2 = L9_2(L10_2)
  L5_2 = L9_2
  L9_2 = L3_2
  L10_2 = L4_2
  L11_2 = L5_2
  return L9_2, L10_2, L11_2
end
L8_1 = RegisterNUICallback
L9_1 = "install-light-controller"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L6_1
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = A1_2
  L3_2 = false
  do return L2_2(L3_2) end
  ::lbl_11::
  L2_2 = Framework
  L2_2 = L2_2.Client
  L2_2 = L2_2.ProgressBar
  L3_2 = Locale
  L3_2 = L3_2.installingLightingController
  L4_2 = 2000
  L5_2 = false
  L6_2 = false
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = setVehicleStatebag
    L1_3 = L6_1
    L2_3 = "lightingControllerInstalled"
    L3_3 = true
    L4_3 = true
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = A1_2
    L1_3 = true
    L0_3(L1_3)
  end
  function L8_2()
    local L0_3, L1_3
    L0_3 = A1_2
    L1_3 = false
    L0_3(L1_3)
  end
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "update-light-controller"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L6_1
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = A1_2
  L3_2 = false
  do return L2_2(L3_2) end
  ::lbl_11::
  L2_2 = Entity
  L3_2 = L6_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L2_2 = L2_2.lightingControllerInstalled
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = SetVehicleModKit
  L3_2 = L6_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.xenons
  if L2_2 then
    L2_2 = ToggleVehicleMod
    L3_2 = L6_1
    L4_2 = 22
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetVehicleLights
    L3_2 = L6_1
    L4_2 = A0_2.xenons
    L4_2 = L4_2.enabled
    if L4_2 then
      L4_2 = 2
      if L4_2 then
        goto lbl_44
      end
    end
    L4_2 = 0
    ::lbl_44::
    L2_2(L3_2, L4_2)
    L2_2 = A0_2.xenons
    L2_2 = L2_2.effect
    if "solid" == L2_2 then
      L2_2 = A0_2.xenons
      L2_2 = L2_2.colour
      L2_2 = L2_2.r
      L3_2 = A0_2.xenons
      L3_2 = L3_2.colour
      L3_2 = L3_2.g
      L4_2 = A0_2.xenons
      L4_2 = L4_2.colour
      L4_2 = L4_2.b
      L5_2 = SetVehicleXenonLightsCustomColor
      L6_2 = L6_1
      L7_2 = L2_2
      L8_2 = L3_2
      L9_2 = L4_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
    L2_2 = setVehicleStatebag
    L3_2 = L6_1
    L4_2 = "xenons"
    L5_2 = A0_2.xenons
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = A0_2.underglow
  if L2_2 then
    L2_2 = A0_2.underglow
    L2_2 = L2_2.enabled
    if not L2_2 then
      L2_2 = 0
      L3_2 = 3
      L4_2 = 1
      for L5_2 = L2_2, L3_2, L4_2 do
        L6_2 = SetVehicleNeonLightEnabled
        L7_2 = L6_1
        L8_2 = L5_2
        L9_2 = false
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L2_2 = A0_2.underglow
    L2_2 = L2_2.effect
    if "solid" == L2_2 then
      L2_2 = A0_2.underglow
      L2_2 = L2_2.colour
      L2_2 = L2_2.r
      L3_2 = A0_2.underglow
      L3_2 = L3_2.colour
      L3_2 = L3_2.g
      L4_2 = A0_2.underglow
      L4_2 = L4_2.colour
      L4_2 = L4_2.b
      L5_2 = SetVehicleNeonLightsColour
      L6_2 = L6_1
      L7_2 = L2_2
      L8_2 = L3_2
      L9_2 = L4_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
    L2_2 = setVehicleStatebag
    L3_2 = L6_1
    L4_2 = "underglowDirections"
    L5_2 = A0_2.underglowDirections
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = setVehicleStatebag
    L3_2 = L6_1
    L4_2 = "underglow"
    L5_2 = A0_2.underglow
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "sync-light-controller"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L5_1
  if L2_2 then
    L2_2 = L6_1
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = A1_2
  L3_2 = false
  do return L2_2(L3_2) end
  ::lbl_11::
  L2_2 = Entity
  L3_2 = L6_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L2_2 = L2_2.lightingControllerInstalled
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = false
    L1_3 = 0
    L2_3 = 0
    L3_3 = true
    L4_3 = true
    L3_1 = L4_3
    L2_1 = L3_3
    L1_1 = L2_3
    L0_1 = L1_3
    L4_1 = L0_3
    L0_3 = Wait
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = true
    L4_1 = L0_3
    L0_3 = A1_2
    L1_3 = true
    L0_3(L1_3)
  end
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNUICallback
L9_1 = "close-light-controller"
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = 0
  L3_2 = 0
  L4_2 = false
  L5_2 = false
  L6_2 = true
  L4_1 = L6_2
  L3_1 = L5_2
  L2_1 = L4_2
  L1_1 = L3_2
  L0_1 = L2_2
  L2_2 = false
  L3_2 = nil
  L6_1 = L3_2
  L5_1 = L2_2
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "isBusy"
  L5_2 = false
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = RegisterNetEvent
L9_1 = "jg-mechanic:client:show-lighting-controller"
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-mechanic:server:has-item"
  L2_2 = 250
  L3_2 = "lighting_controller"
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L5_1 = L0_2
  L0_2 = L5_1
  if not L0_2 then
    return
  end
  L0_2 = cache
  L0_2 = L0_2.vehicle
  if not L0_2 then
    L0_2 = Framework
    L0_2 = L0_2.Client
    L0_2 = L0_2.Notify
    L1_2 = Locale
    L1_2 = L1_2.notInsideVehicle
    L2_2 = "error"
    return L0_2(L1_2, L2_2)
  end
  L0_2 = cache
  L0_2 = L0_2.vehicle
  L6_1 = L0_2
  L0_2 = GetEntityModel
  L1_2 = L6_1
  L0_2 = L0_2(L1_2)
  L1_2 = IsThisModelACar
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = IsThisModelAQuadbike
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = Framework
      L1_2 = L1_2.Client
      L1_2 = L1_2.Notify
      L2_2 = "ERR_VEHICLE_TYPE_INCOMPATIBLE"
      L3_2 = "error"
      return L1_2(L2_2, L3_2)
    end
  end
  L1_2 = Entity
  L2_2 = L6_1
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.state
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "isBusy"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "show-lighting-controller"
  L4_2 = L1_2.lightingControllerInstalled
  if not L4_2 then
    L4_2 = false
  end
  L3_2.installed = L4_2
  L4_2 = L1_2.xenons
  L3_2.xenons = L4_2
  L4_2 = L1_2.underglow
  L3_2.underglow = L4_2
  L4_2 = L1_2.underglowDirections
  L3_2.underglowDirections = L4_2
  L4_2 = Locale
  L3_2.locale = L4_2
  L4_2 = Config
  L3_2.config = L4_2
  L2_2(L3_2)
end
L8_1(L9_1, L10_1)
L8_1 = CreateThread
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = cache
    L0_2 = L0_2.ped
    L1_2 = IsPedInAnyVehicle
    L2_2 = L0_2
    L3_2 = false
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = GetVehiclePedIsIn
      L2_2 = L0_2
      L3_2 = false
      L1_2 = L1_2(L2_2, L3_2)
      L2_2 = Entity
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2.state
      L3_2 = L2_2.underglow
      if L3_2 then
        while true do
          L3_2 = IsPedInVehicle
          L4_2 = L0_2
          L5_2 = L1_2
          L6_2 = false
          L3_2 = L3_2(L4_2, L5_2, L6_2)
          if not L3_2 then
            break
          end
          L3_2 = L2_2.lightingControllerInstalled
          if not L3_2 then
            break
          end
          L3_2 = L2_2.underglow
          if not L3_2 then
            break
          end
          L3_2 = L2_2.underglow
          L3_2 = L3_2.enabled
          if not L3_2 then
            break
          end
          L3_2 = L4_1
          if not L3_2 then
            break
          end
          L3_2 = 0
          L4_2 = 3
          L5_2 = 1
          for L6_2 = L3_2, L4_2, L5_2 do
            L7_2 = SetVehicleNeonLightEnabled
            L8_2 = L1_2
            L9_2 = L6_2
            L10_2 = L2_2.underglowDirections
            L11_2 = L6_2 + 1
            L10_2 = L10_2[L11_2]
            L7_2(L8_2, L9_2, L10_2)
          end
          L3_2 = L2_2.underglow
          L3_2 = L3_2.effect
          if "solid" == L3_2 then
            break
          end
          L3_2 = L2_2.underglow
          L3_2 = L3_2.effect
          if "rgb_cycle" == L3_2 then
            L3_2 = L1_1
            L3_2 = L3_2 + 0.01
            L3_2 = L3_2 % 1
            L1_1 = L3_2
            L3_2 = L7_1
            L4_2 = L1_1
            L5_2 = 1
            L6_2 = 1
            L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2, L6_2)
            L6_2 = SetVehicleNeonLightsColour
            L7_2 = L1_2
            L8_2 = L3_2
            L9_2 = L4_2
            L10_2 = L5_2
            L6_2(L7_2, L8_2, L9_2, L10_2)
            L6_2 = Wait
            L7_2 = L2_2.underglow
            L7_2 = L7_2.speed
            if not L7_2 then
              L7_2 = 1
            end
            L8_2 = 50
            L7_2 = L8_2 / L7_2
            L6_2(L7_2)
          else
            L3_2 = L2_2.underglow
            L3_2 = L3_2.effect
            if "flashing" == L3_2 then
              L3_2 = L3_1
              if L3_2 then
                L3_2 = SetVehicleNeonLightsColour
                L4_2 = L1_2
                L5_2 = 0
                L6_2 = 0
                L7_2 = 0
                L3_2(L4_2, L5_2, L6_2, L7_2)
                L3_2 = false
                L3_1 = L3_2
              else
                L3_2 = L2_2.underglow
                L3_2 = L3_2.colour
                L3_2 = L3_2.r
                L4_2 = L2_2.underglow
                L4_2 = L4_2.colour
                L4_2 = L4_2.g
                L5_2 = L2_2.underglow
                L5_2 = L5_2.colour
                L5_2 = L5_2.b
                L6_2 = SetVehicleNeonLightsColour
                L7_2 = L1_2
                L8_2 = L3_2
                L9_2 = L4_2
                L10_2 = L5_2
                L6_2(L7_2, L8_2, L9_2, L10_2)
                L6_2 = true
                L3_1 = L6_2
              end
              L3_2 = Wait
              L4_2 = L2_2.underglow
              L4_2 = L4_2.speed
              if not L4_2 then
                L4_2 = 1
              end
              L5_2 = 200
              L4_2 = L5_2 / L4_2
              L3_2(L4_2)
            else
              L3_2 = Wait
              L4_2 = 500
              L3_2(L4_2)
            end
          end
          L3_2 = Entity
          L4_2 = L1_2
          L3_2 = L3_2(L4_2)
          L2_2 = L3_2.state
        end
      end
    end
    L1_2 = Wait
    L2_2 = L4_1
    if L2_2 then
      L2_2 = 1000
      if L2_2 then
        goto lbl_149
      end
    end
    L2_2 = 1
    ::lbl_149::
    L1_2(L2_2)
  end
end
L8_1(L9_1)
L8_1 = CreateThread
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  while true do
    L0_2 = cache
    L0_2 = L0_2.ped
    L1_2 = IsPedInAnyVehicle
    L2_2 = L0_2
    L3_2 = false
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = GetVehiclePedIsIn
      L2_2 = L0_2
      L3_2 = false
      L1_2 = L1_2(L2_2, L3_2)
      L2_2 = Entity
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2.state
      L3_2 = L2_2.xenons
      if L3_2 then
        while true do
          L3_2 = IsPedInVehicle
          L4_2 = L0_2
          L5_2 = L1_2
          L6_2 = false
          L3_2 = L3_2(L4_2, L5_2, L6_2)
          if not L3_2 then
            break
          end
          L3_2 = L2_2.lightingControllerInstalled
          if not L3_2 then
            break
          end
          L3_2 = L2_2.xenons
          if not L3_2 then
            break
          end
          L3_2 = L2_2.xenons
          L3_2 = L3_2.enabled
          if not L3_2 then
            break
          end
          L3_2 = L4_1
          if not L3_2 then
            break
          end
          L3_2 = L2_2.xenons
          if L3_2 then
            L3_2 = L2_2.xenons
            L3_2 = L3_2.effect
            if "solid" == L3_2 then
              break
            end
            L3_2 = L2_2.xenons
            L3_2 = L3_2.effect
            if "rgb_cycle" == L3_2 then
              L3_2 = L0_1
              L3_2 = L3_2 + 0.01
              L3_2 = L3_2 % 1
              L0_1 = L3_2
              L3_2 = L7_1
              L4_2 = L0_1
              L5_2 = 1
              L6_2 = 1
              L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2, L6_2)
              L6_2 = SetVehicleXenonLightsCustomColor
              L7_2 = L1_2
              L8_2 = L3_2
              L9_2 = L4_2
              L10_2 = L5_2
              L6_2(L7_2, L8_2, L9_2, L10_2)
              L6_2 = Wait
              L7_2 = L2_2.xenons
              L7_2 = L7_2.speed
              if not L7_2 then
                L7_2 = 1
              end
              L8_2 = 50
              L7_2 = L8_2 / L7_2
              L6_2(L7_2)
            else
              L3_2 = L2_2.xenons
              L3_2 = L3_2.effect
              if "flashing" == L3_2 then
                L3_2 = L2_1
                if L3_2 then
                  L3_2 = SetVehicleXenonLightsCustomColor
                  L4_2 = L1_2
                  L5_2 = 0
                  L6_2 = 0
                  L7_2 = 0
                  L3_2(L4_2, L5_2, L6_2, L7_2)
                  L3_2 = false
                  L2_1 = L3_2
                else
                  L3_2 = L2_2.xenons
                  L3_2 = L3_2.colour
                  L3_2 = L3_2.r
                  L4_2 = L2_2.xenons
                  L4_2 = L4_2.colour
                  L4_2 = L4_2.g
                  L5_2 = L2_2.xenons
                  L5_2 = L5_2.colour
                  L5_2 = L5_2.b
                  L6_2 = SetVehicleXenonLightsCustomColor
                  L7_2 = L1_2
                  L8_2 = L3_2
                  L9_2 = L4_2
                  L10_2 = L5_2
                  L6_2(L7_2, L8_2, L9_2, L10_2)
                  L6_2 = true
                  L2_1 = L6_2
                end
                L3_2 = Wait
                L4_2 = L2_2.xenons
                L4_2 = L4_2.speed
                if not L4_2 then
                  L4_2 = 1
                end
                L5_2 = 200
                L4_2 = L5_2 / L4_2
                L3_2(L4_2)
              else
                L3_2 = Wait
                L4_2 = 500
                L3_2(L4_2)
              end
            end
            L3_2 = Entity
            L4_2 = L1_2
            L3_2 = L3_2(L4_2)
            L2_2 = L3_2.state
          end
        end
      end
    end
    L1_2 = Wait
    L2_2 = L4_1
    if L2_2 then
      L2_2 = 1000
      if L2_2 then
        goto lbl_139
      end
    end
    L2_2 = 1
    ::lbl_139::
    L1_2(L2_2)
  end
end
L8_1(L9_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
