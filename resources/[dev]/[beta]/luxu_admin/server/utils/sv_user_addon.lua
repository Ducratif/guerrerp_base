--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Luxu
  L2_2 = L2_2.registerServerCallback
  L3_2 = "custom_functions:callback:"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  function L4_2(A0_3, ...)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = pcall
    L2_3 = A1_2
    L3_3 = A0_3
    L4_3, L5_3 = ...
    L1_3, L2_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
    if not L1_3 then
      L3_3 = Luxu
      L3_3 = L3_3.print
      L3_3 = L3_3.error
      L4_3 = "ERROR DURING Server custom function handler"
      L5_3 = A0_2
      L3_3(L4_3, L5_3)
      L3_3 = Luxu
      L3_3 = L3_3.print
      L3_3 = L3_3.error
      L4_3 = L2_3
      L3_3(L4_3)
      L3_3 = false
      return L3_3
    end
    return L2_3
  end
  L2_2(L3_2, L4_2)
end
RegisterAddonCallback = L0_1
L0_1 = {}
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = L0_1
  L2_2[A0_2] = A1_2
end
RegisterAddonStatisticBlocksCallback = L1_1
L1_1 = Luxu
L1_1 = L1_1.registerServerCallback
L2_1 = "custom_functions:statistic_blocks:get"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L0_1
    L9_2 = L9_2[L8_2]
    if L9_2 then
      L9_2 = pcall
      L10_2 = L0_1
      L10_2 = L10_2[L8_2]
      L11_2 = A0_2
      L9_2, L10_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L11_2 = L10_2
        if L11_2 then
          L11_2 = L11_2.title
        end
        if L11_2 then
          L11_2 = L10_2
          if L11_2 then
            L11_2 = L11_2.description
          end
          if L11_2 then
            L11_2 = L10_2
            if L11_2 then
              L11_2 = L11_2.value
            end
            if L11_2 then
              goto lbl_53
            end
          end
        end
        L11_2 = Luxu
        L11_2 = L11_2.print
        L11_2 = L11_2.error
        L12_2 = "Invalid result for statistic block:"
        L13_2 = L8_2
        L11_2(L12_2, L13_2)
        L11_2 = Luxu
        L11_2 = L11_2.print
        L11_2 = L11_2.error
        L12_2 = L10_2
        L11_2(L12_2)
        L11_2 = Luxu
        L11_2 = L11_2.print
        L11_2 = L11_2.error
        L12_2 = "Expected result to be a table with title, description, and value"
        L11_2(L12_2)
        goto lbl_69
        ::lbl_53::
        L11_2 = #L2_2
        L11_2 = L11_2 + 1
        L2_2[L11_2] = L10_2
      else
        L11_2 = Luxu
        L11_2 = L11_2.print
        L11_2 = L11_2.error
        L12_2 = "ERROR during custom statistic block callback:"
        L13_2 = L8_2
        L11_2(L12_2, L13_2)
        L11_2 = Luxu
        L11_2 = L11_2.print
        L11_2 = L11_2.error
        L12_2 = L10_2
        L11_2(L12_2)
      end
    end
    ::lbl_69::
  end
  return L2_2
end
L4_1 = true
L5_1 = 50000.0
L1_1(L2_1, L3_1, L4_1, L5_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
