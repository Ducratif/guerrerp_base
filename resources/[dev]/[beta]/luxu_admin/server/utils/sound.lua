--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1
L0_1 = "https://cfx-nui-%s/web/sfx/"
L1_1 = L0_1
L0_1 = L0_1.format
L2_1 = GetCurrentResourceName
L2_1, L3_1 = L2_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L1_1 = {}
Sound = L1_1
L1_1 = Sound
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = A2_2
  L5_2 = A2_2.find
  L7_2 = "^https?://"
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = L0_1
    L6_2 = A2_2
    L5_2 = L5_2 .. L6_2
    A2_2 = L5_2
  end
  L5_2 = exports
  L5_2 = L5_2.xsound
  L6_2 = L5_2
  L5_2 = L5_2.PlayUrl
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A4_2
  return L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L1_1.player = L2_1
L1_1 = exports
L2_1 = "sound:player"
function L3_1(...)
  local L0_2, L1_2
  L0_2 = Sound
  L0_2 = L0_2.player
  L1_2 = ...
  return L0_2(L1_2)
end
L1_1(L2_1, L3_1)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
