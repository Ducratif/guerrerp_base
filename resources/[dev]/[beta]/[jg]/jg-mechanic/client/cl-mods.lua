--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
__JGM_GOTO_171__ = false -- injected flag to replace goto flow safely

L0_1 = nil
L1_1 = false
L2_1 = false
L3_1 = nil
L4_1 = {}
L5_1 = ""
L6_1 = false
L7_1 = false
L8_1 = true
L9_1 = false
L10_1 = false
L11_1 = {}
L12_1 = {}
L11_1.repair = L12_1
L12_1 = {}
L11_1.performance = L12_1
L12_1 = {}
L11_1.cosmetics = L12_1
L12_1 = {}
L11_1.stance = L12_1
L12_1 = {}
L11_1.respray = L12_1
L12_1 = {}
L11_1.wheels = L12_1
L12_1 = {}
L11_1.neonLights = L12_1
L12_1 = {}
L11_1.headlights = L12_1
L12_1 = {}
L11_1.tyreSmoke = L12_1
L12_1 = {}
L11_1.bulletproofTyres = L12_1
L12_1 = {}
L11_1.extras = L12_1
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 then
    return
  end
  L2_2 = SetVehicleEngineOn
  L3_2 = A0_2
  L4_2 = not A1_2
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = FreezeEntityPosition
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityCollision
  L3_2 = A0_2
  L4_2 = not A1_2
  L5_2 = not A1_2
  L2_2(L3_2, L4_2, L5_2)
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L3_1
  if not L0_2 then
    return
  end
  L0_2 = ClearPedTasks
  L1_2 = cache
  L1_2 = L1_2.ped
  L0_2(L1_2)
  L0_2 = SetVehicleTyresCanBurst
  L1_2 = L3_1
  L2_2 = L8_1
  L0_2(L1_2, L2_2)
  L0_2 = SetVehicleCurrentRpm
  L1_2 = L3_1
  L2_2 = 0
  L0_2(L1_2, L2_2)
  L0_2 = FreezeEntityPosition
  L1_2 = L3_1
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SetEntityCollision
  L1_2 = L3_1
  L2_2 = false
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = SetVehicleEngineOn
  L1_2 = L3_1
  L2_2 = false
  L3_2 = true
  L4_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = false
  L7_1 = L0_2
end
function L14_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L3_1
  if not L0_2 then
    return
  end
  L0_2 = L6_1
  if L0_2 then
    return
  end
  L0_2 = setVehicleProperties
  L1_2 = L3_1
  L2_2 = L4_1
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
end
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "string" == L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = GetLabelText
  L3_2 = GetModSlotName
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if "NULL" ~= L2_2 then
    return L2_2
  end
  L3_2 = GetModSlotName
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 and "" ~= L3_2 then
    return L3_2
  end
  L4_2 = false
  return L4_2
end
function L16_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if "LIVERY" == A1_2 then
    L4_2 = GetLabelText
    L5_2 = GetLiveryName
    L6_2 = A0_2
    L7_2 = A3_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if "NULL" ~= L4_2 then
      return L4_2
    end
  end
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "string" == L4_2 then
    L4_2 = "ERROR"
    return L4_2
  end
  L4_2 = GetLabelText
  L5_2 = GetModTextLabel
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if "NULL" ~= L4_2 then
    return L4_2
  end
  L5_2 = GetModTextLabel
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 and "" ~= L5_2 then
    return L5_2
  end
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = ""
  end
  L7_2 = " "
  L8_2 = A3_2 + 1
  L6_2 = L6_2 .. L7_2 .. L8_2
  return L6_2
end
function L17_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if A2_2 == L8_2 then
      L9_2 = true
      return L9_2
    else
      L9_2 = type
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if "string" == L9_2 then
        L9_2 = type
        L10_2 = A2_2
        L9_2 = L9_2(L10_2)
        if "number" == L9_2 then
          L9_2 = GetModSlotName
          L10_2 = A1_2
          L11_2 = A2_2
          L9_2 = L9_2(L10_2, L11_2)
          if L9_2 == L8_2 then
            L9_2 = true
            return L9_2
          end
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end
function L18_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L3_2 = Config
  L3_2 = L3_2.MechanicLocations
  L3_2 = L3_2[A2_2]
  L4_2 = L3_2.mods
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.ModsPricesAsPercentageOfVehicleValue
  if L5_2 then
    L5_2 = Framework
    L5_2 = L5_2.Client
    L5_2 = L5_2.GetVehicleValue
    L6_2 = GetEntityArchetypeName
    L7_2 = A0_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    L6_2 = pairs
    L7_2 = L4_2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2 in L6_2, L7_2, L8_2, L9_2 do
      L11_2 = L4_2[L10_2]
      L12_2 = round
      L13_2 = L4_2[L10_2]
      L13_2 = L13_2.percentVehVal
      if not L13_2 then
        L13_2 = 0.01
      end
      L13_2 = L5_2 * L13_2
      L14_2 = 0
      L12_2 = L12_2(L13_2, L14_2)
      L11_2.price = L12_2
    end
  end
  L5_2 = GetEntityModel
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = SetVehicleModKit
  L7_2 = A0_2
  L8_2 = 0
  L6_2(L7_2, L8_2)
  L6_2 = {}
  L7_2 = pairs
  L8_2 = Config
  L8_2 = L8_2.Mods
  L8_2 = L8_2.Performance
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = GetNumVehicleMods
    L14_2 = A0_2
    L15_2 = L12_2.modType
    L13_2 = L13_2(L14_2, L15_2)
    if not (L13_2 > 0) then
      L14_2 = L12_2.toggle
      if not L14_2 then
        goto lbl_187
      end
    end
    L14_2 = L15_1
    L15_2 = A0_2
    L16_2 = L12_2.modType
    L14_2 = L14_2(L15_2, L16_2)
    if not L14_2 then
      L14_2 = L12_2.name
    end
    L15_2 = {}
    L16_2 = {}
    L16_2.modIndex = -1
    L16_2.name = "Stock"
    L15_2[1] = L16_2
    L16_2 = L12_2.overrideOptions
    if L16_2 then
      L16_2 = type
      L17_2 = L12_2.overrideOptions
      L16_2 = L16_2(L17_2)
      if "table" == L16_2 then
        L16_2 = pairs
        L17_2 = L12_2.overrideOptions
        L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
        for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
          L22_2 = #L15_2
          L22_2 = L22_2 + 1
          L23_2 = {}
          L24_2 = L21_2.modIndex
          L23_2.modIndex = L24_2
          L24_2 = L21_2.name
          L23_2.name = L24_2
          L24_2 = L21_2.price
          if not L24_2 then
            L24_2 = round
            L25_2 = L4_2.performance
            L25_2 = L25_2.price
            L26_2 = L21_2.modIndex
            if L26_2 > 0 then
              L26_2 = L21_2.modIndex
              L27_2 = L4_2.performance
              L27_2 = L27_2.priceMult
              if not L27_2 then
                L27_2 = 0
              end
              L26_2 = L26_2 * L27_2
              L26_2 = 1 + L26_2
              if L26_2 then
                goto lbl_120
              end
            end
            L26_2 = 1
            ::lbl_120::
            L25_2 = L25_2 * L26_2
            L26_2 = 0
            L24_2 = L24_2(L25_2, L26_2)
          end
          L23_2.price = L24_2
          L15_2[L22_2] = L23_2
        end
    end
    else
      L16_2 = 0
      L17_2 = L13_2 - 1
      L18_2 = 1
      for L19_2 = L16_2, L17_2, L18_2 do
        L20_2 = #L15_2
        L20_2 = L20_2 + 1
        L21_2 = {}
        L21_2.modIndex = L19_2
        L22_2 = L16_1
        L23_2 = A0_2
        L24_2 = L12_2.modType
        L25_2 = L14_2
        L26_2 = L19_2
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2)
        L21_2.name = L22_2
        L22_2 = round
        L23_2 = L4_2.performance
        L23_2 = L23_2.price
        if L19_2 > 0 then
          L24_2 = L4_2.performance
          L24_2 = L24_2.priceMult
          if not L24_2 then
            L24_2 = 0
          end
          L24_2 = L19_2 * L24_2
          L24_2 = 1 + L24_2
          if L24_2 then
            goto lbl_165
          end
        end
        L24_2 = 1
        ::lbl_165::
        L23_2 = L23_2 * L24_2
        L24_2 = 0
        L22_2 = L22_2(L23_2, L24_2)
        L21_2.price = L22_2
        L15_2[L20_2] = L21_2
      end
    end
    L16_2 = #L6_2
    L16_2 = L16_2 + 1
    L17_2 = {}
    L18_2 = L12_2.modType
    L17_2.modType = L18_2
    L17_2.name = L14_2
    L17_2.mods = L15_2
    L18_2 = L12_2.toggle
    L17_2.toggle = L18_2
    L18_2 = L4_2.performance
    L18_2 = L18_2.price
    L17_2.price = L18_2
    L6_2[L16_2] = L17_2
    ::lbl_187::
  end
  L7_2 = {}
  L8_2 = pairs
  L9_2 = Config
  L9_2 = L9_2.Mods
  L9_2 = L9_2.Cosmetics
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L13_2.name
    L15_2 = L13_2.ignorePriceMult
    L16_2 = {}
    L17_2 = L13_2.modType
    if "PLATE_INDEX" == L17_2 then
      L17_2 = IsThisModelACar
      L18_2 = L5_2
      L17_2 = L17_2(L18_2)
      if not L17_2 then
        L17_2 = IsThisModelAQuadbike
        L18_2 = L5_2
        L17_2 = L17_2(L18_2)
        if not L17_2 then
          L17_2 = IsThisModelABike
          L18_2 = L5_2
          L17_2 = L17_2(L18_2)
          if not L17_2 then
            goto lbl_275
          end
        end
      end
      L17_2 = 1
      L18_2 = Config
      L18_2 = L18_2.Mods
      L18_2 = L18_2.PlateIndexes
      L18_2 = #L18_2
      L19_2 = 1
      for L20_2 = L17_2, L18_2, L19_2 do
        if not (L20_2 < 6) then
          if not (L20_2 >= 6) then
            goto lbl_273
          end
          L21_2 = GetGameBuildNumber
          L21_2 = L21_2()
          L22_2 = 3095
          if not (L21_2 >= L22_2) then
            goto lbl_273
          end
        end
        L21_2 = #L16_2
        L21_2 = L21_2 + 1
        L22_2 = Config
        L22_2 = L22_2.Mods
        L22_2 = L22_2.PlateIndexes
        L22_2 = L22_2[L20_2]
        L16_2[L21_2] = L22_2
        L21_2 = L16_2[L20_2]
        if L15_2 then
          L22_2 = L4_2.cosmetics
          L22_2 = L22_2.price
          if L22_2 then
            goto lbl_272
          end
        end
        L22_2 = round
        L23_2 = L4_2.cosmetics
        L23_2 = L23_2.price
        if L20_2 > 0 then
          L24_2 = L4_2.cosmetics
          L24_2 = L24_2.priceMult
          if not L24_2 then
            L24_2 = 0
          end
          L24_2 = L20_2 * L24_2
          L24_2 = 1 + L24_2
          if L24_2 then
            goto lbl_268
          end
        end
        L24_2 = 1
        ::lbl_268::
        L23_2 = L23_2 * L24_2
        L24_2 = 0
        L22_2 = L22_2(L23_2, L24_2)
        ::lbl_272::
        L21_2.price = L22_2
        ::lbl_273::
      end
    ::lbl_275::
    else
      L17_2 = L13_2.modType
      if "WINDOW_TINT" == L17_2 then
        L17_2 = IsThisModelABicycle
        L18_2 = L5_2
        L17_2 = L17_2(L18_2)
        if not L17_2 then
          L17_2 = 1
          L18_2 = Config
          L18_2 = L18_2.Mods
          L18_2 = L18_2.WindowTints
          L18_2 = #L18_2
          L19_2 = 1
          for L20_2 = L17_2, L18_2, L19_2 do
            L21_2 = #L16_2
            L21_2 = L21_2 + 1
            L22_2 = Config
            L22_2 = L22_2.Mods
            L22_2 = L22_2.WindowTints
            L22_2 = L22_2[L20_2]
            L16_2[L21_2] = L22_2
            L21_2 = L16_2[L20_2]
            if L15_2 then
              L22_2 = L4_2.cosmetics
              L22_2 = L22_2.price
              if L22_2 then
                goto lbl_326
              end
            end
            L22_2 = round
            L23_2 = L4_2.cosmetics
            L23_2 = L23_2.price
            if L20_2 > 0 then
              L24_2 = L4_2.cosmetics
              L24_2 = L24_2.priceMult
              if not L24_2 then
                L24_2 = 0
              end
              L24_2 = L20_2 * L24_2
              L24_2 = 1 + L24_2
              if L24_2 then
                goto lbl_322
              end
            end
            L24_2 = 1
            ::lbl_322::
            L23_2 = L23_2 * L24_2
            L24_2 = 0
            L22_2 = L22_2(L23_2, L24_2)
            ::lbl_326::
            L21_2.price = L22_2
          end
      end
      else
        L17_2 = 0
        L18_2 = L13_2.modType
        if "LIVERY" == L18_2 then
          L18_2 = GetVehicleLiveryCount
          L19_2 = A0_2
          L18_2 = L18_2(L19_2)
          L17_2 = L18_2
        else
          L18_2 = L13_2.modType
          if "LIVERY_ROOF" == L18_2 then
            L18_2 = GetVehicleRoofLiveryCount
            L19_2 = A0_2
            L18_2 = L18_2(L19_2)
            L17_2 = L18_2
          else
            L18_2 = GetNumVehicleMods
            L19_2 = A0_2
            L20_2 = L13_2.modType
            L18_2 = L18_2(L19_2, L20_2)
            L17_2 = L18_2
          end
        end
        if not (L17_2 > 0) then
          L18_2 = L13_2.toggle
          if not L18_2 then
            goto lbl_475
          end
        end
        L18_2 = L15_1
        L19_2 = A0_2
        L20_2 = L13_2.modType
        L18_2 = L18_2(L19_2, L20_2)
        L14_2 = L18_2 or L14_2
        if not L18_2 then
          L14_2 = L13_2.name
        end
        L18_2 = L13_2.modType
        if 14 == L18_2 then
          L18_2 = 1
          L19_2 = Config
          L19_2 = L19_2.Mods
          L19_2 = L19_2.Horns
          L19_2 = #L19_2
          L20_2 = 1
          for L21_2 = L18_2, L19_2, L20_2 do
            L22_2 = #L16_2
            L22_2 = L22_2 + 1
            L23_2 = Config
            L23_2 = L23_2.Mods
            L23_2 = L23_2.Horns
            L23_2 = L23_2[L21_2]
            L16_2[L22_2] = L23_2
            L22_2 = L16_2[L21_2]
            if L15_2 then
              L23_2 = L4_2.cosmetics
              L23_2 = L23_2.price
              if L23_2 then
                goto lbl_409
              end
            end
            L23_2 = round
            L24_2 = L4_2.cosmetics
            L24_2 = L24_2.price
            if L21_2 > 0 then
              L25_2 = L4_2.cosmetics
              L25_2 = L25_2.priceMult
              if not L25_2 then
                L25_2 = 0
              end
              L25_2 = L21_2 * L25_2
              L25_2 = 1 + L25_2
              if L25_2 then
                goto lbl_405
              end
            end
            L25_2 = 1
            ::lbl_405::
            L24_2 = L24_2 * L25_2
            L25_2 = 0
            L23_2 = L23_2(L24_2, L25_2)
            ::lbl_409::
            L22_2.price = L23_2
          end
        else
          L18_2 = {}
          L19_2 = {}
          L19_2.modIndex = -1
          L19_2.name = "Stock"
          L18_2[1] = L19_2
          L16_2 = L18_2
          L18_2 = 0
          L19_2 = L17_2 - 1
          L20_2 = 1
          for L21_2 = L18_2, L19_2, L20_2 do
            L22_2 = #L16_2
            L22_2 = L22_2 + 1
            L23_2 = {}
            L23_2.modIndex = L21_2
            L24_2 = Config
            L24_2 = L24_2.UseCustomNamesInTuningMenu
            if L24_2 then
              L24_2 = L13_2.name
              if L24_2 then
                goto lbl_444
              end
            end
            L24_2 = L16_1
            L25_2 = A0_2
            L26_2 = L13_2.modType
            L27_2 = L14_2
            L28_2 = L21_2
            L24_2 = L24_2(L25_2, L26_2, L27_2, L28_2)
            ::lbl_444::
            L23_2.name = L24_2
            if L15_2 then
              L24_2 = L4_2.cosmetics
              L24_2 = L24_2.price
              if L24_2 then
                goto lbl_472
              end
            end
            L24_2 = round
            L25_2 = L4_2.cosmetics
            L25_2 = L25_2.price
            if L21_2 > 0 then
              L26_2 = L4_2.cosmetics
              L26_2 = L26_2.priceMult
              if not L26_2 then
                L26_2 = 0
              end
              L26_2 = L21_2 * L26_2
              L26_2 = 1 + L26_2
              if L26_2 then
                goto lbl_468
              end
            end
            L26_2 = 1
            ::lbl_468::
            L25_2 = L25_2 * L26_2
            L26_2 = 0
            L24_2 = L24_2(L25_2, L26_2)
            ::lbl_472::
            L23_2.price = L24_2
            L16_2[L22_2] = L23_2
          end
        end
      end
    end
    ::lbl_475::
    L17_2 = #L16_2
    if L17_2 > 0 then
      L17_2 = #L7_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L13_2.modType
      L18_2.modType = L19_2
      L19_2 = Config
      L19_2 = L19_2.UseCustomNamesInTuningMenu
      if L19_2 then
        L19_2 = L13_2.name
        if L19_2 then
          goto lbl_493
        end
      end
      L19_2 = L14_2
      ::lbl_493::
      L18_2.name = L19_2
      L18_2.mods = L16_2
      L19_2 = L13_2.toggle
      L18_2.toggle = L19_2
      L19_2 = L4_2.cosmetics
      L19_2 = L19_2.price
      L18_2.price = L19_2
      L7_2[L17_2] = L18_2
    end
  end
  L8_2 = {}
  L9_2 = IsThisModelACar
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = IsThisModelAQuadbike
    L10_2 = L5_2
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L9_2 = IsThisModelABike
      L10_2 = L5_2
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        goto lbl_618
      end
    end
  end
  L9_2 = ipairs
  L10_2 = Config
  L10_2 = L10_2.Mods
  L10_2 = L10_2.WheelTypes
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = IsThisModelACar
    L16_2 = L5_2
    L15_2 = L15_2(L16_2)
    if not L15_2 then
      L15_2 = IsThisModelAQuadbike
      L16_2 = L5_2
      L15_2 = L15_2(L16_2)
      if not L15_2 then
        L15_2 = IsThisModelABike
        L16_2 = L5_2
        L15_2 = L15_2(L16_2)
        if not L15_2 then
          goto lbl_615
        end
        L15_2 = L14_2.modIndex
        if 6 ~= L15_2 then
          goto lbl_615
        end
      end
    end
    L15_2 = SetVehicleWheelType
    L16_2 = A0_2
    L17_2 = L14_2.modIndex
    L15_2(L16_2, L17_2)
    L15_2 = GetNumVehicleMods
    L16_2 = A0_2
    L17_2 = 23
    L15_2 = L15_2(L16_2, L17_2)
    if L15_2 > 0 then
      L16_2 = {}
      L17_2 = {}
      L17_2.modIndex = -1
      L17_2.name = "Stock"
      L16_2[1] = L17_2
      L17_2 = 0
      L18_2 = L15_2 - 1
      L19_2 = 1
      for L20_2 = L17_2, L18_2, L19_2 do
        L21_2 = #L16_2
        L21_2 = L21_2 + 1
        L22_2 = {}
        L22_2.modIndex = L20_2
        L23_2 = L16_1
        L24_2 = A0_2
        L25_2 = 23
        L26_2 = L14_2.name
        L27_2 = L20_2
        L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2)
        L22_2.name = L23_2
        L23_2 = round
        L24_2 = L4_2.wheels
        L24_2 = L24_2.price
        if L20_2 > 0 then
          L25_2 = L4_2.wheels
          L25_2 = L25_2.priceMult
          if not L25_2 then
            L25_2 = 0
          end
          L25_2 = L20_2 * L25_2
          L25_2 = 1 + L25_2
          if L25_2 then
            goto lbl_597
          end
        end
        L25_2 = 1
        ::lbl_597::
        L24_2 = L24_2 * L25_2
        L25_2 = 0
        L23_2 = L23_2(L24_2, L25_2)
        L22_2.price = L23_2
        L16_2[L21_2] = L22_2
      end
      L17_2 = #L8_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L14_2.modIndex
      L18_2.modType = L19_2
      L19_2 = L14_2.name
      L18_2.name = L19_2
      L18_2.mods = L16_2
      L8_2[L17_2] = L18_2
    end
    ::lbl_615::
  end
  ::lbl_618::
  L9_2 = SetVehicleWheelType
  L10_2 = A0_2
  L11_2 = A1_2.wheels
  L9_2(L10_2, L11_2)
  L9_2 = A1_2.modFrontWheels
  if L9_2 then
    L9_2 = SetVehicleMod
    L10_2 = A0_2
    L11_2 = 23
    L12_2 = A1_2.modFrontWheels
    L13_2 = A1_2.modCustomTiresF
    L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = A1_2.modBackWheels
  if L9_2 then
    L9_2 = SetVehicleMod
    L10_2 = A0_2
    L11_2 = 24
    L12_2 = A1_2.modBackWheels
    L13_2 = A1_2.modCustomTiresR
    L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = {}
  L10_2 = L4_2.repair
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = L4_2.repair
  end
  L9_2.repair = L10_2
  L10_2 = L4_2.performance
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = #L6_2
    if L10_2 then
      L10_2 = L6_2
    end
  end
  L9_2.performance = L10_2
  L10_2 = L4_2.cosmetics
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = #L7_2
    if L10_2 then
      L10_2 = L7_2
    end
  end
  L9_2.cosmetics = L10_2
  L10_2 = IsThisModelACar
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = L4_2.stance
    L10_2 = L10_2.enabled
    if L10_2 then
      L10_2 = L4_2.stance
    end
  end
  L9_2.stance = L10_2
  L10_2 = L4_2.respray
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = Config
    L10_2 = L10_2.Mods
    L10_2 = L10_2.Colours
    L10_2 = #L10_2
    if L10_2 then
      L10_2 = {}
      L11_2 = L4_2.respray
      L11_2 = L11_2.price
      L10_2.price = L11_2
      L11_2 = Config
      L11_2 = L11_2.Mods
      L11_2 = L11_2.Colours
      L10_2.colours = L11_2
    end
  end
  L9_2.respray = L10_2
  L10_2 = L4_2.wheels
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = #L8_2
    if L10_2 then
      L10_2 = L8_2
    end
  end
  L9_2.wheels = L10_2
  L10_2 = IsThisModelACar
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = IsThisModelAQuadbike
    L11_2 = L5_2
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      goto lbl_721
    end
  end
  L10_2 = L4_2.neonLights
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = L4_2.neonLights
  end
  ::lbl_721::
  L9_2.neonLights = L10_2
  L10_2 = IsThisModelABicycle
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  L10_2 = L4_2.headlights
  L10_2 = L10_2.enabled
  L10_2 = not L10_2 and L10_2 and L10_2
  L9_2.headlights = L10_2
  L10_2 = IsThisModelACar
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = IsThisModelABike
    L11_2 = L5_2
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      L10_2 = IsThisModelAQuadbike
      L11_2 = L5_2
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        goto lbl_756
      end
    end
  end
  L10_2 = L4_2.tyreSmoke
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = L4_2.tyreSmoke
  end
  ::lbl_756::
  L9_2.tyreSmoke = L10_2
  L10_2 = IsThisModelACar
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = IsThisModelABike
    L11_2 = L5_2
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      L10_2 = IsThisModelAQuadbike
      L11_2 = L5_2
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        goto lbl_777
      end
    end
  end
  L10_2 = L4_2.bulletproofTyres
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = L4_2.bulletproofTyres
  end
  ::lbl_777::
  L9_2.bulletproofTyres = L10_2
  L10_2 = L4_2.extras
  L10_2 = L10_2.enabled
  if L10_2 then
    L10_2 = next
    L11_2 = A1_2.extras
    L10_2 = L10_2(L11_2)
    L10_2 = nil ~= L10_2 and L10_2
  end
  L9_2.extras = L10_2
  return L9_2
end
function L19_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = L12_1
    L1_2 = L3_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = L14_1
    L0_2()
    L0_2 = Entity
    L1_2 = L3_1
    L0_2 = L0_2(L1_2)
    L0_2 = L0_2.state
    L1_2 = L0_2
    L0_2 = L0_2.set
    L2_2 = "unpaidModifications"
    L3_2 = false
    L4_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2)
  end
  L0_2 = SetNuiFocusKeepInput
  L1_2 = false
  L0_2(L1_2)
  L0_2 = Framework
  L0_2 = L0_2.Client
  L0_2 = L0_2.ToggleHud
  L1_2 = true
  L0_2(L1_2)
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L1_2 = L0_2
  L0_2 = L0_2.set
  L2_2 = "isBusy"
  L3_2 = false
  L4_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2)
  L0_2 = {}
  L1_2 = {}
  L0_2.repair = L1_2
  L1_2 = {}
  L0_2.performance = L1_2
  L1_2 = {}
  L0_2.cosmetics = L1_2
  L1_2 = {}
  L0_2.stance = L1_2
  L1_2 = {}
  L0_2.respray = L1_2
  L1_2 = {}
  L0_2.wheels = L1_2
  L1_2 = {}
  L0_2.neonLights = L1_2
  L1_2 = {}
  L0_2.headlights = L1_2
  L1_2 = {}
  L0_2.tyreSmoke = L1_2
  L1_2 = {}
  L0_2.bulletproofTyres = L1_2
  L1_2 = {}
  L0_2.extras = L1_2
  L11_1 = L0_2
  L0_2 = false
  L1_1 = L0_2
  L0_2 = nil
  L1_2 = nil
  L4_1 = L1_2
  L3_1 = L0_2
  L0_2 = false
  L6_1 = L0_2
end
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = Config
  L2_2 = L2_2.MechanicLocations
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L0_1 = A0_2
  L3_2 = cache
  L3_2 = L3_2.vehicle
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = cache
  L3_2 = L3_2.vehicle
  L3_1 = L3_2
  L3_2 = GetPedInVehicleSeat
  L4_2 = L3_1
  L5_2 = -1
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = cache
  L4_2 = L4_2.ped
  if L3_2 ~= L4_2 then
    L3_2 = Framework
    L3_2 = L3_2.Client
    L3_2 = L3_2.Notify
    L4_2 = Locale
    L4_2 = L4_2.notInDriversSeat
    L5_2 = "error"
    L3_2(L4_2, L5_2)
    L3_2 = nil
    L3_1 = L3_2
    L3_2 = false
    return L3_2
  end
  L3_2 = {}
  L4_2 = GetVehicleBodyHealth
  L5_2 = L3_1
  L4_2 = L4_2(L5_2)
  L5_2 = GetVehicleEngineHealth
  L6_2 = L3_1
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L4_2 = getVehicleProperties
  L5_2 = L3_1
  L6_2 = true
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = error
    L5_2 = "Could not get the vehicle's props"
    L4_2 = L4_2(L5_2)
  end
  L4_1 = L4_2
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetPlate
  L5_2 = L3_1
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = error
    L5_2 = "Could not get the vehicle's plate"
    L4_2 = L4_2(L5_2)
  end
  L5_1 = L4_2
  L4_2 = L4_1.bulletProofTyres
  L4_2 = not L4_2
  L8_1 = L4_2
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = L4_1.windowTint
  L6_2 = 0
  L4_2 = L4_2(L5_2, L6_2)
  L4_1.windowTint = L4_2
  L4_2 = L18_1
  L5_2 = L3_1
  L6_2 = L4_1
  L7_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = 0
  L6_2 = 5
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = GetPedInVehicleSeat
    L10_2 = L3_1
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    if 0 ~= L9_2 then
      L10_2 = Framework
      L10_2 = L10_2.Client
      L10_2 = L10_2.Notify
      L11_2 = Locale
      L11_2 = L11_2.passengersMustLeaveVehicleFirst
      L12_2 = "error"
      L10_2(L11_2, L12_2)
      L10_2 = false
      return L10_2
    end
  end
  L5_2 = L12_1
  L6_2 = L3_1
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetVehicleModKit
  L6_2 = L3_1
  L7_2 = 0
  L5_2(L6_2, L7_2)
  L5_2 = setupVehicleCamera
  L6_2 = L3_1
  L5_2(L6_2)
  L5_2 = Config
  L5_2 = L5_2.ChangePlateDuringPreview
  if L5_2 then
    L5_2 = lib
    L5_2 = L5_2.callback
    L5_2 = L5_2.await
    L6_2 = "jg-mechanic:server:open-mods-menu"
    L7_2 = false
    L8_2 = VehToNet
    L9_2 = L3_1
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-mechanic:server:is-mechanic-employee"
  L7_2 = false
  L8_2 = A0_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 then
    L6_2 = lib
    L6_2 = L6_2.callback
    L6_2 = L6_2.await
    L7_2 = "jg-mechanic:server:get-mechanic-balance"
    L8_2 = false
    L9_2 = A0_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 then
      goto lbl_148
    end
  end
  L6_2 = false
  ::lbl_148::
  L7_2 = lib
  L7_2 = L7_2.callback
  L7_2 = L7_2.await
  L8_2 = "jg-mechanic:server:count-currently-on-duty"
  L9_2 = false
  L10_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L2_2.type
  if "self-service" ~= L8_2 then
    L8_2 = Config
    L8_2 = L8_2.MechanicEmployeesCanSelfServiceMods
    if not (L8_2 and L5_2) then
      goto lbl_167
    end
  end
  L8_2 = "self-service"
  ::lbl_167::
  if not L8_2 then
    L8_2 = "owned"
  end
  L9_2 = LocalPlayer
  L9_2 = L9_2.state
  L10_2 = L9_2
  L9_2 = L9_2.set
  L11_2 = "isBusy"
  L12_2 = true
  L13_2 = true
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = Framework
  L9_2 = L9_2.Client
  L9_2 = L9_2.ToggleHud
  L10_2 = false
  L9_2(L10_2)
  L9_2 = SetNuiFocus
  L10_2 = true
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SendNUIMessage
  L10_2 = {}
  L10_2.type = "show-vehicle-tuning"
  L11_2 = L2_2.logo
  L10_2.logo = L11_2
  L10_2.mechanicId = A0_2
  L11_2 = A1_2 or L11_2
  if "" == A1_2 or not A1_2 then
    L11_2 = A0_2
  end
  L10_2.name = L11_2
  L10_2.mechanicType = L8_2
  L10_2.mechanicsOnDuty = L7_2
  L10_2.isMechanicEmployee = L5_2
  L11_2 = L6_2 or L11_2
  if not L5_2 or "self-service" ~= L8_2 or not L6_2 then
    L11_2 = false
  end
  L10_2.mechBalance = L11_2
  L11_2 = Framework
  L11_2 = L11_2.Client
  L11_2 = L11_2.GetBalance
  L12_2 = "bank"
  L11_2 = L11_2(L12_2)
  L10_2.bankBalance = L11_2
  L11_2 = Framework
  L11_2 = L11_2.Client
  L11_2 = L11_2.GetBalance
  L12_2 = "cash"
  L11_2 = L11_2(L12_2)
  L10_2.cashBalance = L11_2
  L11_2 = parseControlBinding
  L12_2 = 0
  L11_2 = L11_2(L12_2)
  L10_2.changeCamBtn = L11_2
  L10_2.vehicleDamaged = L3_2
  L11_2 = L4_1
  L10_2.props = L11_2
  L10_2.mods = L4_2
  L11_2 = Config
  L10_2.config = L11_2
  L11_2 = Locale
  L10_2.locale = L11_2
  L9_2(L10_2)
  L9_2 = true
  return L9_2
end
L21_1 = RegisterNetEvent
L22_1 = "jg-mechanic:client:open-customisation-menu"
L23_1 = L20_1
L21_1(L22_1, L23_1)
function L21_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = cache
  L2_2 = L2_2.vehicle
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = A0_2
    L0_1 = L0_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = L1_1
      if not L0_3 then
        L0_3 = L2_1
        if not L0_3 then
          L0_3 = Framework
          L0_3 = L0_3.Client
          L0_3 = L0_3.ShowTextUI
          L1_3 = Config
          L1_3 = L1_3.CustomiseVehiclePrompt
          L0_3(L1_3)
          L0_3 = true
          L2_1 = L0_3
        end
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = Config
      L2_3 = L2_3.CustomiseVehicleKey
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L1_1
        if not L0_3 then
          L0_3 = L20_1
          L1_3 = L0_1
          L2_3 = A1_2
          L0_3 = L0_3(L1_3, L2_3)
          if not L0_3 then
          else
            L0_3 = false
            L1_3 = true
            L1_1 = L1_3
            L2_1 = L0_3
            L0_3 = Framework
            L0_3 = L0_3.Client
            L0_3 = L0_3.HideTextUI
            L0_3()
          end
        end
      end
    end
  end
  L2_2(L3_2)
end
onEnterModsZone = L21_1
function L21_1()
  local L0_2, L1_2, L2_2
  L0_2 = nil
  L0_1 = L0_2
  L0_2 = L19_1
  L0_2()
  L0_2 = SetTimeout
  L1_2 = 1
  function L2_2()
    local L0_3, L1_3
    L0_3 = Framework
    L0_3 = L0_3.Client
    L0_3 = L0_3.HideTextUI
    L0_3()
    L0_3 = false
    L2_1 = L0_3
  end
  L0_2(L1_2, L2_2)
end
onExitModsZone = L21_1
L21_1 = RegisterNUICallback
L22_1 = "purchase-mods"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = L0_1
  if L2_2 then
    L2_2 = L3_1
    if L2_2 then
      L2_2 = L4_1
      if L2_2 then
        L2_2 = L3_1
        if L2_2 then
          goto lbl_19
        end
      end
    end
  end
  L2_2 = A1_2
  L3_2 = {}
  L3_2.error = true
  do return L2_2(L3_2) end
  ::lbl_19::
  L2_2 = A0_2.cart
  L3_2 = A0_2.paymentMethod
  if L2_2 then
    L4_2 = type
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if "table" == L4_2 then
      goto lbl_34
    end
  end
  L4_2 = A1_2
  L5_2 = {}
  L5_2.error = true
  do return L4_2(L5_2) end
  ::lbl_34::
  L4_2 = Config
  L4_2 = L4_2.MechanicLocations
  L5_2 = L0_1
  L4_2 = L4_2[L5_2]
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = {}
    L6_2.error = false
    return L5_2(L6_2)
  end
  L5_2 = getVehicleProperties
  L6_2 = L3_1
  L7_2 = true
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L5_1
  L5_2.plate = L6_2
  if not L5_2 then
    L6_2 = A1_2
    L7_2 = {}
    L7_2.error = false
    return L6_2(L7_2)
  end
  L6_2 = Framework
  L6_2 = L6_2.Client
  L6_2 = L6_2.GetVehicleValue
  L7_2 = GetEntityArchetypeName
  L8_2 = L3_1
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L7_2 = lib
  L7_2 = L7_2.callback
  L7_2 = L7_2.await
  L8_2 = "jg-mechanic:server:purchase-mods"
  L9_2 = false
  L10_2 = L0_1
  L11_2 = L6_2
  L12_2 = L2_2
  L13_2 = L3_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if false == L7_2 then
    L8_2 = A1_2
    L9_2 = {}
    L9_2.error = true
    return L8_2(L9_2)
  end
  L8_2 = lib
  L8_2 = L8_2.callback
  L8_2 = L8_2.await
  L9_2 = "jg-mechanic:server:is-mechanic-employee"
  L10_2 = false
  L11_2 = L0_1
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L4_2.type
  if "self-service" ~= L9_2 then
    L9_2 = Config
    L9_2 = L9_2.MechanicEmployeesCanSelfServiceMods
if not (L9_2 and L8_2) then __JGM_GOTO_171__ = true end
  end
  L9_2 = L12_1
  L10_2 = L3_1
  L11_2 = false
  L9_2(L10_2, L11_2)
  L9_2 = {}
  L10_2 = pairs
  L11_2 = L11_1
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
  for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
    L16_2 = tableConcat
    L17_2 = L9_2
    L18_2 = L15_2
    L16_2 = L16_2(L17_2, L18_2)
    L9_2 = L16_2
  end
  L10_2 = setStatebagsFromProps
  L11_2 = L3_1
  L12_2 = L9_2
  L13_2 = L5_1
  L10_2(L11_2, L12_2, L13_2)
  L10_2 = lib
  L10_2 = L10_2.callback
  L10_2 = L10_2.await
  L11_2 = "jg-mechanic:server:save-veh-statebag-data-to-db"
  L12_2 = false
  L13_2 = L5_1
  L10_2(L11_2, L12_2, L13_2)
  L10_2 = true
  L6_1 = L10_2
  L10_2 = lib
  L10_2 = L10_2.callback
  L10_2 = L10_2.await
  L11_2 = "jg-mechanic:server:self-service-mods-applied"
  L12_2 = false
  L13_2 = L0_1
  L14_2 = VehToNet
  L15_2 = L3_1
  L14_2 = L14_2(L15_2)
  L15_2 = L5_1
  L16_2 = L2_2
  L17_2 = L7_2
  L18_2 = L3_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L10_2 = Config
  L10_2 = L10_2.UpdatePropsOnChange
  if L10_2 then
    L10_2 = lib
    L10_2 = L10_2.callback
    L10_2 = L10_2.await
    L11_2 = "jg-mechanic:server:save-vehicle-props"
    L12_2 = false
    L13_2 = L5_1
    L14_2 = L5_2
    L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = L4_1
  if L10_2 and L5_2 then
    L10_2 = L5_2.wheels
    L4_1.wheels = L10_2
    L10_2 = L5_2.modFrontWheels
    L4_1.modFrontWheels = L10_2
    L10_2 = L5_2.modBackWheels
    L4_1.modBackWheels = L10_2
    -- removed goto lbl_191 (rewritten flow)
    if __JGM_GOTO_171__ then
    L9_2 = lib
    L9_2 = L9_2.callback
    L9_2 = L9_2.await
    L10_2 = "jg-mechanic:server:place-order"
    L11_2 = false
    L12_2 = L0_1
    L13_2 = L5_1
    L14_2 = L2_2
    L15_2 = L7_2
    L16_2 = L11_1
    L17_2 = L3_2
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    if not L9_2 then
      L10_2 = A1_2
      L11_2 = {}
      L11_2.error = true
      return L10_2(L11_2)
    end
  end
end
  L9_2 = A1_2
  L10_2 = true
  L9_2(L10_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "exit-mods"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L19_1
  L2_2()
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "switch-camera"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = A0_2
  if L2_2 then
    L2_2 = L2_2.modId
  end
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = SetVehicleDoorsShut
    L1_3 = L3_1
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = IsVehicleDoorDamaged
    L1_3 = L3_1
    L2_3 = 4
    L0_3 = L0_3(L1_3, L2_3)
    if L0_3 then
      L0_3 = SetVehicleFixed
      L1_3 = L3_1
      L0_3(L1_3)
    end
    L0_3 = L13_1
    L0_3()
    L0_3 = L17_1
    L1_3 = {}
    L2_3 = "TOP_HL_CV"
    L3_3 = "TOP_HLT"
    L4_3 = "TOP_SUNST"
    L5_3 = "HEADLIGHTS"
    L6_3 = "TOP_SPLIT"
    L1_3[1] = L2_3
    L1_3[2] = L3_3
    L1_3[3] = L4_3
    L1_3[4] = L5_3
    L1_3[5] = L6_3
    L2_3 = L3_1
    L3_3 = L2_2
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    if L0_3 then
      L0_3 = transitionCamera
      L1_3 = "frontCamera"
      L0_3(L1_3)
    else
      L0_3 = L17_1
      L1_3 = {}
      L2_3 = "TOP_TRUNK"
      L3_3 = "TOP_BOOT"
      L4_3 = "TOP_TGATE"
      L5_3 = "TOP_RPNL"
      L6_3 = "TOP_WINP"
      L7_3 = "TOP_WBAR"
      L8_3 = "TOP_COVER"
      L9_3 = "TOP_LOUV"
      L1_3[1] = L2_3
      L1_3[2] = L3_3
      L1_3[3] = L4_3
      L1_3[4] = L5_3
      L1_3[5] = L6_3
      L1_3[6] = L7_3
      L1_3[7] = L8_3
      L1_3[8] = L9_3
      L2_3 = L3_1
      L3_3 = L2_2
      L0_3 = L0_3(L1_3, L2_3, L3_3)
      if L0_3 then
        L0_3 = transitionCamera
        L1_3 = "backCamera"
        L0_3(L1_3)
      else
        L0_3 = L17_1
        L1_3 = {}
        L2_3 = "TOP_CAGE"
        L1_3[1] = L2_3
        L2_3 = L3_1
        L3_3 = L2_2
        L0_3 = L0_3(L1_3, L2_3, L3_3)
        if L0_3 then
          L0_3 = transitionCamera
          L1_3 = "interior"
          L0_3(L1_3)
        else
          L0_3 = L17_1
          L1_3 = {}
          L2_3 = "TOP_ROOFSC"
          L3_3 = "TOP_ROOFFIN"
          L1_3[1] = L2_3
          L1_3[2] = L3_3
          L2_3 = L3_1
          L3_3 = L2_2
          L0_3 = L0_3(L1_3, L2_3, L3_3)
          if L0_3 then
            L0_3 = transitionCamera
            L1_3 = "roof"
            L0_3(L1_3)
          else
            L0_3 = L17_1
            L1_3 = {}
            L2_3 = "TOP_VALHD"
            L3_3 = "TOP_ENGHD"
            L1_3[1] = L2_3
            L1_3[2] = L3_3
            L2_3 = L3_1
            L3_3 = L2_2
            L0_3 = L0_3(L1_3, L2_3, L3_3)
            if L0_3 then
              L0_3 = transitionCamera
              L1_3 = "backCamera"
              L0_3(L1_3)
              L0_3 = SetVehicleDoorOpen
              L1_3 = L3_1
              L2_3 = 4
              L3_3 = false
              L4_3 = true
              L0_3(L1_3, L2_3, L3_3, L4_3)
            else
              L0_3 = L17_1
              L1_3 = {}
              L2_3 = "TOP_SIDE_PAN"
              L3_3 = "TOP_MIR"
              L1_3[1] = L2_3
              L1_3[2] = L3_3
              L2_3 = L3_1
              L3_3 = L2_2
              L0_3 = L0_3(L1_3, L2_3, L3_3)
              if L0_3 then
                L0_3 = transitionCamera
                L1_3 = "sideCamera"
                L0_3(L1_3)
              else
                L0_3 = L17_1
                L1_3 = {}
                L2_3 = "TOP_CATCH"
                L1_3[1] = L2_3
                L2_3 = L3_1
                L3_3 = L2_2
                L0_3 = L0_3(L1_3, L2_3, L3_3)
                if L0_3 then
                  L0_3 = transitionCamera
                  L1_3 = "engineBay"
                  L0_3(L1_3)
                else
                  L0_3 = L17_1
                  L1_3 = {}
                  L2_3 = "TOP_ENGINE"
                  L3_3 = "TOP_BRACE"
                  L4_3 = "TOP_ENGD"
                  L1_3[1] = L2_3
                  L1_3[2] = L3_3
                  L1_3[3] = L4_3
                  L2_3 = L3_1
                  L3_3 = L2_2
                  L0_3 = L0_3(L1_3, L2_3, L3_3)
                  if L0_3 then
                    L0_3 = transitionCamera
                    L1_3 = "engineBay"
                    L0_3(L1_3)
                    L0_3 = GetEntityArchetypeName
                    L1_3 = L3_1
                    L0_3 = L0_3(L1_3)
                    if "z190" == L0_3 then
                      L0_3 = SetVehicleDoorBroken
                      L1_3 = L3_1
                      L2_3 = 4
                      L3_3 = true
                      L0_3(L1_3, L2_3, L3_3)
                    end
                    L0_3 = SetVehicleDoorOpen
                    L1_3 = L3_1
                    L2_3 = 4
                    L3_3 = false
                    L4_3 = true
                    L0_3(L1_3, L2_3, L3_3, L4_3)
                  else
                    L0_3 = L17_1
                    L1_3 = {}
                    L2_3 = 1
                    L3_3 = 6
                    L4_3 = 26
                    L5_3 = 42
                    L6_3 = 43
                    L1_3[1] = L2_3
                    L1_3[2] = L3_3
                    L1_3[3] = L4_3
                    L1_3[4] = L5_3
                    L1_3[5] = L6_3
                    L2_3 = L3_1
                    L3_3 = L2_2
                    L0_3 = L0_3(L1_3, L2_3, L3_3)
                    if L0_3 then
                      L0_3 = transitionCamera
                      L1_3 = "frontCamera"
                      L0_3(L1_3)
                    else
                      L0_3 = L17_1
                      L1_3 = {}
                      L2_3 = 37
                      L1_3[1] = L2_3
                      L2_3 = L3_1
                      L3_3 = L2_2
                      L0_3 = L0_3(L1_3, L2_3, L3_3)
                      if L0_3 then
                        L0_3 = transitionCamera
                        L1_3 = "backCamera"
                        L0_3(L1_3)
                        L0_3 = SetVehicleDoorOpen
                        L1_3 = L3_1
                        L2_3 = 5
                        L3_3 = false
                        L4_3 = true
                        L0_3(L1_3, L2_3, L3_3, L4_3)
                      else
                        L0_3 = L17_1
                        L1_3 = {}
                        L2_3 = 5
                        L3_3 = 27
                        L4_3 = 32
                        L5_3 = "COLOR_INTERIOR"
                        L1_3[1] = L2_3
                        L1_3[2] = L3_3
                        L1_3[3] = L4_3
                        L1_3[4] = L5_3
                        L2_3 = L3_1
                        L3_3 = L2_2
                        L0_3 = L0_3(L1_3, L2_3, L3_3)
                        if L0_3 then
                          L0_3 = transitionCamera
                          L1_3 = "interior"
                          L0_3(L1_3)
                        else
                          L0_3 = L17_1
                          L1_3 = {}
                          L2_3 = 4
                          L1_3[1] = L2_3
                          L2_3 = L3_1
                          L3_3 = L2_2
                          L0_3 = L0_3(L1_3, L2_3, L3_3)
                          if L0_3 then
                            L0_3 = transitionCamera
                            L1_3 = "exhaust"
                            L0_3(L1_3)
                          else
                            L0_3 = L17_1
                            L1_3 = {}
                            L2_3 = 0
                            L3_3 = 2
                            L4_3 = 4
                            L5_3 = 25
                            L6_3 = "PLATE_INDEX"
                            L1_3[1] = L2_3
                            L1_3[2] = L3_3
                            L1_3[3] = L4_3
                            L1_3[4] = L5_3
                            L1_3[5] = L6_3
                            L2_3 = L3_1
                            L3_3 = L2_2
                            L0_3 = L0_3(L1_3, L2_3, L3_3)
                            if L0_3 then
                              L0_3 = transitionCamera
                              L1_3 = "backCamera"
                              L0_3(L1_3)
                            else
                              L0_3 = L17_1
                              L1_3 = {}
                              L2_3 = 3
                              L3_3 = 8
                              L4_3 = 23
                              L5_3 = 24
                              L6_3 = "WHEELS"
                              L1_3[1] = L2_3
                              L1_3[2] = L3_3
                              L1_3[3] = L4_3
                              L1_3[4] = L5_3
                              L1_3[5] = L6_3
                              L2_3 = L3_1
                              L3_3 = L2_2
                              L0_3 = L0_3(L1_3, L2_3, L3_3)
                              if L0_3 then
                                L0_3 = transitionCamera
                                L1_3 = "sideCamera"
                                L0_3(L1_3)
                              else
                                L0_3 = L17_1
                                L1_3 = {}
                                L2_3 = 7
                                L1_3[1] = L2_3
                                L2_3 = L3_1
                                L3_3 = L2_2
                                L0_3 = L0_3(L1_3, L2_3, L3_3)
                                if L0_3 then
                                  L0_3 = transitionCamera
                                  L1_3 = "engineBay"
                                  L0_3(L1_3)
                                else
                                  L0_3 = L17_1
                                  L1_3 = {}
                                  L2_3 = 39
                                  L3_3 = 40
                                  L4_3 = 41
                                  L1_3[1] = L2_3
                                  L1_3[2] = L3_3
                                  L1_3[3] = L4_3
                                  L2_3 = L3_1
                                  L3_3 = L2_2
                                  L0_3 = L0_3(L1_3, L2_3, L3_3)
                                  if L0_3 then
                                    L0_3 = transitionCamera
                                    L1_3 = "engineBay"
                                    L0_3(L1_3)
                                    L0_3 = GetEntityArchetypeName
                                    L1_3 = L3_1
                                    L0_3 = L0_3(L1_3)
                                    if "banshee2" == L0_3 then
                                      L0_3 = SetVehicleDoorBroken
                                      L1_3 = L3_1
                                      L2_3 = 4
                                      L3_3 = true
                                      L0_3(L1_3, L2_3, L3_3)
                                    end
                                    L0_3 = SetVehicleDoorOpen
                                    L1_3 = L3_1
                                    L2_3 = 4
                                    L3_3 = false
                                    L4_3 = true
                                    L0_3(L1_3, L2_3, L3_3, L4_3)
                                  else
                                    L0_3 = L17_1
                                    L1_3 = {}
                                    L2_3 = 31
                                    L1_3[1] = L2_3
                                    L2_3 = L3_1
                                    L3_3 = L2_2
                                    L0_3 = L0_3(L1_3, L2_3, L3_3)
                                    if L0_3 then
                                      L0_3 = transitionCamera
                                      L1_3 = "doorSpeaker"
                                      L0_3(L1_3)
                                    else
                                      L0_3 = L17_1
                                      L1_3 = {}
                                      L2_3 = 28
                                      L3_3 = 29
                                      L4_3 = 30
                                      L5_3 = 33
                                      L6_3 = 34
                                      L7_3 = "COLOR_DASHBOARD"
                                      L1_3[1] = L2_3
                                      L1_3[2] = L3_3
                                      L1_3[3] = L4_3
                                      L1_3[4] = L5_3
                                      L1_3[5] = L6_3
                                      L1_3[6] = L7_3
                                      L2_3 = L3_1
                                      L3_3 = L2_2
                                      L0_3 = L0_3(L1_3, L2_3, L3_3)
                                      if L0_3 then
                                        L0_3 = transitionCamera
                                        L1_3 = "pov"
                                        L0_3(L1_3)
                                      else
                                        L0_3 = transitionCamera
                                        L1_3 = "default"
                                        L0_3(L1_3)
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L0_3 = A1_2
    L1_3 = true
    L0_3(L1_3)
  end
  L3_2(L4_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "toggle-freecam"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.enable
  if L2_2 then
    L3_2 = true
    L9_1 = L3_2
    L3_2 = toggleCamTemporarily
    L4_2 = false
    L3_2(L4_2)
  else
    L3_2 = toggleCamTemporarily
    L4_2 = true
    L3_2(L4_2)
    L3_2 = false
    L9_1 = L3_2
  end
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "move-freecam"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L9_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SetNuiFocusKeepInput
  L3_2 = true
  L2_2(L3_2)
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3
    while true do
      L0_3 = L9_1
      if not L0_3 then
        break
      end
      L0_3 = DisableAllControlActions
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = EnableControlAction
      L1_3 = 0
      L2_3 = 0
      L3_3 = false
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = EnableControlAction
      L1_3 = 0
      L2_3 = 1
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = EnableControlAction
      L1_3 = 0
      L2_3 = 2
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = EnableControlAction
      L1_3 = 0
      L2_3 = 59
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "stop-moving-freecam"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetNuiFocusKeepInput
  L3_2 = false
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "repair-vehicle"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L3_1
  if L2_2 then
    L2_2 = L3_1
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
  L2_2 = L2_2.GetVehicleValue
  L3_2 = GetEntityArchetypeName
  L4_2 = L3_1
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-mechanic:server:self-service-repair-vehicle"
  L5_2 = false
  L6_2 = L0_1
  L7_2 = L2_2
  L8_2 = A0_2
  if L8_2 then
    L8_2 = L8_2.paymentMethod
  end
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  if L3_2 then
    L4_2 = Framework
    L4_2 = L4_2.Client
    L4_2 = L4_2.RepairVehicle
    L5_2 = L3_1
    L4_2(L5_2)
    L4_2 = L4_1
    if L4_2 then
      L4_1.dirtLevel = 0.0
      L4_1.engineHealth = 1000.0
      L4_1.bodyHealth = 1000.0
      L4_1.tankHealth = 1000.0
      L4_1.windowStatus = nil
      L4_1.doorStatus = nil
      L4_1.tireHealth = nil
      L4_1.tireBurstState = nil
      L4_1.tireBurstCompletely = nil
      L4_1.windowsBroken = nil
      L4_1.doorsBroken = nil
      L4_1.tyreBurst = nil
    end
  end
  L4_2 = A1_2
  L5_2 = true
  L4_2(L5_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-performance-mod"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = A0_2.propKey
  L3_2 = A0_2.modType
  L4_2 = A0_2.modIndex
  L5_2 = A0_2.toggleMod
  L6_2 = SetVehicleModKit
  L7_2 = L3_1
  L8_2 = 0
  L6_2(L7_2, L8_2)
  if L5_2 then
    L6_2 = ToggleVehicleMod
    L7_2 = L3_1
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = L11_1.performance
    L6_2[L2_2] = L4_2
  else
    L6_2 = type
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    if "number" == L6_2 then
      L6_2 = SetVehicleMod
      L7_2 = L3_1
      L8_2 = L3_2
      L9_2 = L4_2
      L10_2 = false
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = L11_1.performance
      L6_2[L2_2] = L4_2
    end
  end
  L6_2 = A1_2
  L7_2 = true
  L6_2(L7_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-cosmetic-mod"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = A0_2.propKey
  L3_2 = A0_2.modType
  L4_2 = A0_2.modIndex
  L5_2 = A0_2.toggleMod
  L6_2 = SetVehicleModKit
  L7_2 = L3_1
  L8_2 = 0
  L6_2(L7_2, L8_2)
  if "LIVERY" == L3_2 then
    L6_2 = SetVehicleLivery
    L7_2 = L3_1
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
  elseif "LIVERY_ROOF" == L3_2 then
    L6_2 = SetVehicleRoofLivery
    L7_2 = L3_1
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
  elseif "PLATE_INDEX" == L3_2 then
    L6_2 = SetVehicleNumberPlateTextIndex
    L7_2 = L3_1
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
  elseif "WINDOW_TINT" == L3_2 then
    L6_2 = SetVehicleWindowTint
    L7_2 = L3_1
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
  elseif 14 == L3_2 then
    L6_2 = SetVehicleMod
    L7_2 = L3_1
    L8_2 = 14
    L9_2 = L4_2
    L10_2 = false
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = Citizen
    L6_2 = L6_2.CreateThreadNow
    function L7_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = L10_1
      if L0_3 then
        L0_3 = false
        L10_1 = L0_3
        L0_3 = Wait
        L1_3 = 10
        L0_3(L1_3)
      end
      L0_3 = true
      L10_1 = L0_3
      L0_3 = Config
      L0_3 = L0_3.Mods
      L0_3 = L0_3.Horns
      L1_3 = L4_2
      L1_3 = L1_3 + 2
      L0_3 = L0_3[L1_3]
      L0_3 = L0_3.musical
      if L0_3 then
        L0_3 = 750
        if L0_3 then
          goto lbl_25
        end
      end
      L0_3 = 100
      ::lbl_25::
      while L0_3 > 1 do
        L1_3 = L10_1
        if not L1_3 then
          break
        end
        L1_3 = SetControlNormal
        L2_3 = 0
        L3_3 = 86
        L4_3 = 1.0
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = Wait
        L2_3 = 1
        L1_3(L2_3)
        L0_3 = L0_3 - 1
      end
    end
    L6_2(L7_2)
  elseif L5_2 then
    L6_2 = ToggleVehicleMod
    L7_2 = L3_1
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2(L7_2, L8_2, L9_2)
  else
    L6_2 = type
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    if "number" == L6_2 then
      L6_2 = SetVehicleMod
      L7_2 = L3_1
      L8_2 = L3_2
      L9_2 = L4_2
      L10_2 = false
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  end
  L6_2 = L11_1.cosmetics
  L6_2[L2_2] = L4_2
  L6_2 = A1_2
  L7_2 = true
  L6_2(L7_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-wheels"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = SetVehicleWheelType
  L3_2 = L3_1
  L4_2 = A0_2.modType
  L2_2(L3_2, L4_2)
  L2_2 = L11_1.wheels
  L3_2 = A0_2.modType
  L2_2.wheels = L3_2
  L2_2 = SetVehicleMod
  L3_2 = L3_1
  L4_2 = 23
  L5_2 = A0_2.modIndex
  L6_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L11_1.wheels
  L3_2 = A0_2.modIndex
  L2_2.modFrontWheels = L3_2
  L2_2 = IsThisModelABike
  L3_2 = GetEntityModel
  L4_2 = L3_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 then
    L2_2 = SetVehicleMod
    L3_2 = L3_1
    L4_2 = 24
    L5_2 = A0_2.modIndex
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = L11_1.wheels
    L3_2 = A0_2.modIndex
    L2_2.modBackWheels = L3_2
  end
  L2_2 = L11_1.wheels
  L3_2 = GetVehicleWheelWidth
  L4_2 = L3_1
  L3_2 = L3_2(L4_2)
  L2_2.wheelWidth = L3_2
  L2_2 = L11_1.wheels
  L3_2 = GetVehicleWheelSize
  L4_2 = L3_1
  L3_2 = L3_2(L4_2)
  L2_2.wheelSize = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-pri-sec-colours"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "primarySecondarySync"
  L5_2 = A0_2.primarySecondarySync
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L11_1.respray
  L3_2 = A0_2.primarySecondarySync
  L2_2.primarySecondarySync = L3_2
  L2_2 = A0_2.paintTypeKey
  if "paintType1" == L2_2 then
    L2_2 = A0_2.enableRgb
    if L2_2 then
      L2_2 = SetVehicleModColor_1
      L3_2 = L3_1
      L4_2 = A0_2.paint
      L5_2 = 0
      L6_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2)
      L2_2 = SetVehicleCustomPrimaryColour
      L3_2 = L3_1
      L4_2 = A0_2.rgbColour
      L4_2 = L4_2[1]
      L5_2 = A0_2.rgbColour
      L5_2 = L5_2[2]
      L6_2 = A0_2.rgbColour
      L6_2 = L6_2[3]
      L2_2(L3_2, L4_2, L5_2, L6_2)
      L2_2 = L11_1.respray
      L3_2 = A0_2.rgbColour
      L2_2.color1 = L3_2
    else
      L2_2 = GetVehicleColours
      L3_2 = L3_1
      L2_2, L3_2 = L2_2(L3_2)
      L4_2 = SetVehicleColours
      L5_2 = L3_1
      L6_2 = A0_2.colourId
      L7_2 = L3_2
      L4_2(L5_2, L6_2, L7_2)
      L4_2 = ClearVehicleCustomPrimaryColour
      L5_2 = L3_1
      L4_2(L5_2)
      L4_2 = L11_1.respray
      L5_2 = A0_2.colourId
      L4_2.color1 = L5_2
    end
    L2_2 = L11_1.respray
    L3_2 = A0_2.paint
    L2_2.paintType1 = L3_2
  end
  L2_2 = A0_2.paintTypeKey
  if "paintType2" ~= L2_2 then
    L2_2 = A0_2.primarySecondarySync
    if not L2_2 then
      goto lbl_118
    end
  end
  L2_2 = A0_2.enableRgb
  if L2_2 then
    L2_2 = SetVehicleModColor_2
    L3_2 = L3_1
    L4_2 = A0_2.paint
    L5_2 = 0
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetVehicleCustomSecondaryColour
    L3_2 = L3_1
    L4_2 = A0_2.rgbColour
    L4_2 = L4_2[1]
    L5_2 = A0_2.rgbColour
    L5_2 = L5_2[2]
    L6_2 = A0_2.rgbColour
    L6_2 = L6_2[3]
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = L11_1.respray
    L3_2 = A0_2.rgbColour
    L2_2.color2 = L3_2
  else
    L2_2 = GetVehicleColours
    L3_2 = L3_1
    L2_2, L3_2 = L2_2(L3_2)
    L4_2 = SetVehicleColours
    L5_2 = L3_1
    L6_2 = L2_2
    L7_2 = A0_2.colourId
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = ClearVehicleCustomSecondaryColour
    L5_2 = L3_1
    L4_2(L5_2)
    L4_2 = L11_1.respray
    L5_2 = A0_2.colourId
    L4_2.color2 = L5_2
  end
  L2_2 = L11_1.respray
  L3_2 = A0_2.paint
  L2_2.paintType2 = L3_2
  ::lbl_118::
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-other-colours"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.colourIdKey
  if "dashboardColor" == L2_2 then
    L2_2 = SetVehicleDashboardColor
    L3_2 = L3_1
    L4_2 = A0_2.colourId
    L2_2(L3_2, L4_2)
  else
    L2_2 = A0_2.colourIdKey
    if "interiorColor" == L2_2 then
      L2_2 = SetVehicleInteriorColor
      L3_2 = L3_1
      L4_2 = A0_2.colourId
      L2_2(L3_2, L4_2)
    else
      L2_2 = GetVehicleExtraColours
      L3_2 = L3_1
      L2_2, L3_2 = L2_2(L3_2)
      L4_2 = A0_2.colourIdKey
      if "pearlescentColor" == L4_2 then
        L4_2 = SetVehicleExtraColours
        L5_2 = L3_1
        L6_2 = A0_2.colourId
        L7_2 = L3_2
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = Entity
        L5_2 = L3_1
        L4_2 = L4_2(L5_2)
        L4_2 = L4_2.state
        L5_2 = L4_2
        L4_2 = L4_2.set
        L6_2 = "disablePearl"
        L7_2 = A0_2.disablePearl
        if not L7_2 then
          L7_2 = false
        end
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = L11_1.respray
        L5_2 = A0_2.disablePearl
        if not L5_2 then
          L5_2 = false
        end
        L4_2.disablePearl = L5_2
      end
      L4_2 = A0_2.colourIdKey
      if "wheelColor" == L4_2 then
        L4_2 = SetVehicleExtraColours
        L5_2 = L3_1
        L6_2 = L2_2
        L7_2 = A0_2.colourId
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  L2_2 = L11_1.respray
  L3_2 = A0_2.colourIdKey
  L4_2 = A0_2.colourId
  L2_2[L3_2] = L4_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-xenons"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = ToggleVehicleMod
  L3_2 = L3_1
  L4_2 = 22
  L5_2 = A0_2.enableXenons
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetVehicleLights
  L3_2 = L3_1
  L4_2 = 2
  L2_2(L3_2, L4_2)
  L2_2 = SetVehicleXenonLightsColor
  L3_2 = L3_1
  L4_2 = A0_2.xenonColor
  L2_2(L3_2, L4_2)
  L2_2 = L11_1.headlights
  L2_2.modXenon = true
  L2_2 = L11_1.headlights
  L3_2 = A0_2.xenonColor
  L2_2.xenonColor = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-neons"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = 0
  L3_2 = 3
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = SetVehicleNeonLightEnabled
    L7_2 = L3_1
    L8_2 = L5_2
    L9_2 = A0_2.enableNeons
    L10_2 = L5_2 + 1
    L9_2 = L9_2[L10_2]
    L6_2(L7_2, L8_2, L9_2)
  end
  L2_2 = SetVehicleNeonLightsColour
  L3_2 = L3_1
  L4_2 = A0_2.neonColor
  L4_2 = L4_2[1]
  L5_2 = A0_2.neonColor
  L5_2 = L5_2[2]
  L6_2 = A0_2.neonColor
  L6_2 = L6_2[3]
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L11_1.neonLights
  L3_2 = A0_2.enableNeons
  L2_2.neonEnabled = L3_2
  L2_2 = L11_1.neonLights
  L3_2 = A0_2.neonColor
  L2_2.neonColor = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-tyre-smoke"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L7_1
  if L2_2 then
    L2_2 = A0_2.enableTyreSmoke
    if not L2_2 then
      L2_2 = L13_1
      L2_2()
    end
  end
  L2_2 = L7_1
  if not L2_2 then
    L2_2 = A0_2.enableTyreSmoke
    if L2_2 then
      L2_2 = CreateThread
      function L3_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = true
        L7_1 = L0_3
        L0_3 = L8_1
        if L0_3 then
          L0_3 = SetVehicleTyresCanBurst
          L1_3 = L3_1
          L2_3 = false
          L0_3(L1_3, L2_3)
        end
        L0_3 = SetVehicleEngineOn
        L1_3 = L3_1
        L2_3 = true
        L3_3 = true
        L4_3 = true
        L0_3(L1_3, L2_3, L3_3, L4_3)
        L0_3 = SetEntityCollision
        L1_3 = L3_1
        L2_3 = true
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = FreezeEntityPosition
        L1_3 = L3_1
        L2_3 = false
        L0_3(L1_3, L2_3)
        L0_3 = TaskVehicleTempAction
        L1_3 = cache
        L1_3 = L1_3.ped
        L2_3 = L3_1
        L3_3 = 30
        L4_3 = 999999
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      L2_2(L3_2)
    end
  end
  L2_2 = SetVehicleModKit
  L3_2 = L3_1
  L4_2 = 0
  L2_2(L3_2, L4_2)
  L2_2 = ToggleVehicleMod
  L3_2 = L3_1
  L4_2 = 20
  L5_2 = A0_2.enableTyreSmoke
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetVehicleTyreSmokeColor
  L3_2 = L3_1
  L4_2 = A0_2.tyreSmokeColor
  L4_2 = L4_2[1]
  L5_2 = A0_2.tyreSmokeColor
  L5_2 = L5_2[2]
  L6_2 = A0_2.tyreSmokeColor
  L6_2 = L6_2[3]
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L11_1.tyreSmoke
  L3_2 = A0_2.enableTyreSmoke
  L2_2.modSmokeEnabled = L3_2
  L2_2 = L11_1.tyreSmoke
  L3_2 = A0_2.tyreSmokeColor
  L2_2.tyreSmokeColor = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-bulletproof-tyres"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = A0_2.enableBulletproofTyres
  L2_2 = not L2_2
  L3_2 = SetVehicleTyresCanBurst
  L4_2 = L3_1
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L8_1 = L2_2
  L3_2 = L11_1.bulletproofTyres
  L4_2 = A0_2.enableBulletproofTyres
  L3_2.bulletProofTyres = L4_2
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-extras"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = pairs
  L3_2 = A0_2.extras
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = SetVehicleExtra
    L9_2 = L3_1
    L10_2 = tonumber
    L11_2 = L6_2
    L10_2 = L10_2(L11_2)
    L11_2 = not L7_2
    L8_2(L9_2, L10_2, L11_2)
  end
  L2_2 = L11_1.extras
  L3_2 = A0_2.extras
  L2_2.extras = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "preview-stance"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = previewVehicleStance
  L3_2 = L3_1
  L4_2 = A0_2.enableStance
  L5_2 = A0_2.defaultStance
  L6_2 = A0_2.stance
  L2_2(L3_2, L4_2, L5_2, L6_2)
  PreviewingNewStance = true
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "save-previewed-stance"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L3_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = Entity
  L3_2 = L3_1
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "unpaidModifications"
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = setStanceState
  L3_2 = L3_1
  L4_2 = A0_2.enableStance
  L5_2 = A0_2.wheelsAdjIndv
  L6_2 = A0_2.defaultStance
  L7_2 = A0_2.stance
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  PreviewingNewStance = false
  L2_2 = L11_1.stance
  L3_2 = A0_2.enableStance
  L2_2.enableStance = L3_2
  L2_2 = L11_1.stance
  L3_2 = A0_2.wheelsAdjIndv
  L2_2.wheelsAdjIndv = L3_2
  L2_2 = L11_1.stance
  L3_2 = A0_2.defaultStance
  L2_2.defaultStance = L3_2
  L2_2 = L11_1.stance
  L3_2 = A0_2.stance
  L2_2.stance = L3_2
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = AddEventHandler
L22_1 = "onResourceStop"
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = L3_1
    if L1_2 then
      L1_2 = L14_1
      L1_2()
      L1_2 = Entity
      L2_2 = L3_1
      L1_2 = L1_2(L2_2)
      L1_2 = L1_2.state
      L2_2 = L1_2
      L1_2 = L1_2.set
      L3_2 = "unpaidModifications"
      L4_2 = false
      L5_2 = true
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = L12_1
      L2_2 = L3_1
      L3_2 = false
      L1_2(L2_2, L3_2)
    end
  end
end
L21_1(L22_1, L23_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
