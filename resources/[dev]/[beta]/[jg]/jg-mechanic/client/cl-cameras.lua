--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = nil
L1_1 = {}
L2_1 = false
L3_1 = nil
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = pairs
  L1_2 = L1_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DestroyCam
    L7_2 = L5_2
    L8_2 = true
    L6_2(L7_2, L8_2)
  end
  L0_2 = RenderScriptCams
  L1_2 = false
  L2_2 = false
  L3_2 = 0
  L4_2 = true
  L5_2 = true
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = nil
  L3_1 = L0_2
end
exitCamera = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = RenderScriptCams
  L2_2 = A0_2
  L3_2 = false
  L4_2 = 0
  L5_2 = true
  L6_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
toggleCamTemporarily = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2
  L1_2 = GetEntityModel
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetModelDimensions
  L3_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = L3_2.y
  L5_2 = L2_2.y
  L4_2 = L4_2 - L5_2
  L4_2 = L4_2 * 0.9
  L5_2 = L3_2.x
  L6_2 = L2_2.x
  L5_2 = L5_2 - L6_2
  L5_2 = L5_2 * 0.9
  L6_2 = L3_2.z
  L7_2 = L2_2.z
  L6_2 = L6_2 - L7_2
  L6_2 = L6_2 * 0.9
  L7_2 = CreateCam
  L8_2 = "DEFAULT_SCRIPTED_CAMERA"
  L9_2 = true
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = GetOffsetFromEntityInWorldCoords
  L9_2 = A0_2
  L10_2 = L5_2 * 1.5
  L11_2 = L3_2.y
  L11_2 = L11_2 + 1.0
  L12_2 = 0.0
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = SetCamCoord
  L10_2 = L7_2
  L11_2 = L8_2.x
  L12_2 = L8_2.y
  L13_2 = L8_2.z
  L13_2 = L13_2 + 1.0
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = PointCamAtEntity
  L10_2 = L7_2
  L11_2 = A0_2
  L12_2 = 0.0
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L9_2 = SetCamFov
  L10_2 = L7_2
  L11_2 = 60.0
  L9_2(L10_2, L11_2)
  L9_2 = CreateCam
  L10_2 = "DEFAULT_SCRIPTED_CAMERA"
  L11_2 = true
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = GetOffsetFromEntityInWorldCoords
  L11_2 = A0_2
  L12_2 = 0.0
  L13_2 = L4_2
  L14_2 = 0.0
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = SetCamCoord
  L12_2 = L9_2
  L13_2 = L10_2.x
  L14_2 = L10_2.y
  L15_2 = L10_2.z
  L15_2 = L15_2 + 1.0
  L11_2(L12_2, L13_2, L14_2, L15_2)
  L11_2 = PointCamAtEntity
  L12_2 = L9_2
  L13_2 = A0_2
  L14_2 = 0.0
  L15_2 = 0.0
  L16_2 = 0.0
  L17_2 = true
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2 = SetCamFov
  L12_2 = L9_2
  L13_2 = GetGameplayCamFov
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L13_2()
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L11_2 = CreateCam
  L12_2 = "DEFAULT_SCRIPTED_CAMERA"
  L13_2 = true
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = GetOffsetFromEntityInWorldCoords
  L13_2 = A0_2
  L14_2 = 0.0
  L15_2 = -L4_2
  L16_2 = 0.0
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L13_2 = SetCamCoord
  L14_2 = L11_2
  L15_2 = L12_2.x
  L16_2 = L12_2.y
  L17_2 = L12_2.z
  L17_2 = L17_2 + 1.0
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = PointCamAtEntity
  L14_2 = L11_2
  L15_2 = A0_2
  L16_2 = 0.0
  L17_2 = 0.0
  L18_2 = 0.0
  L19_2 = true
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L13_2 = SetCamFov
  L14_2 = L11_2
  L15_2 = GetGameplayCamFov
  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L15_2()
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L13_2 = CreateCam
  L14_2 = "DEFAULT_SCRIPTED_CAMERA"
  L15_2 = true
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = GetOffsetFromEntityInWorldCoords
  L15_2 = A0_2
  L16_2 = 0.0
  L17_2 = -L4_2
  L18_2 = 0.0
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
  L15_2 = SetCamCoord
  L16_2 = L13_2
  L17_2 = L14_2.x
  L18_2 = L14_2.y
  L19_2 = L14_2.z
  L19_2 = L19_2 + 0.5
  L15_2(L16_2, L17_2, L18_2, L19_2)
  L15_2 = PointCamAtEntity
  L16_2 = L13_2
  L17_2 = A0_2
  L18_2 = 0.0
  L19_2 = 0.0
  L20_2 = 0.0
  L21_2 = true
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L15_2 = SetCamFov
  L16_2 = L13_2
  L17_2 = GetGameplayCamFov
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L17_2()
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L15_2 = CreateCam
  L16_2 = "DEFAULT_SCRIPTED_CAMERA"
  L17_2 = true
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = GetOffsetFromEntityInWorldCoords
  L17_2 = A0_2
  L18_2 = L4_2
  L19_2 = 0.0
  L20_2 = 0.0
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
  L17_2 = SetCamCoord
  L18_2 = L15_2
  L19_2 = L16_2.x
  L20_2 = L16_2.y
  L21_2 = L16_2.z
  L21_2 = L21_2 + 0.5
  L17_2(L18_2, L19_2, L20_2, L21_2)
  L17_2 = PointCamAtEntity
  L18_2 = L15_2
  L19_2 = A0_2
  L20_2 = 0.0
  L21_2 = -0.25
  L22_2 = 0.0
  L23_2 = true
  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L17_2 = SetCamFov
  L18_2 = L15_2
  L19_2 = GetGameplayCamFov
  L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L19_2()
  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L17_2 = CreateCam
  L18_2 = "DEFAULT_SCRIPTED_CAMERA"
  L19_2 = true
  L17_2 = L17_2(L18_2, L19_2)
  L18_2 = GetOffsetFromEntityInWorldCoords
  L19_2 = A0_2
  L20_2 = 0.0
  L21_2 = L4_2 * 0.7
  L22_2 = 0.5
  L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
  L19_2 = SetCamCoord
  L20_2 = L17_2
  L21_2 = L18_2.x
  L22_2 = L18_2.y
  L23_2 = L18_2.z
  L23_2 = L23_2 + 1.0
  L19_2(L20_2, L21_2, L22_2, L23_2)
  L19_2 = PointCamAtEntity
  L20_2 = L17_2
  L21_2 = A0_2
  L22_2 = 0.0
  L23_2 = 0.0
  L24_2 = -1.0
  L25_2 = true
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L19_2 = SetCamFov
  L20_2 = L17_2
  L21_2 = GetGameplayCamFov
  L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L21_2()
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L19_2 = CreateCam
  L20_2 = "DEFAULT_SCRIPTED_CAMERA"
  L21_2 = true
  L19_2 = L19_2(L20_2, L21_2)
  L20_2 = GetOffsetFromEntityInWorldCoords
  L21_2 = A0_2
  L22_2 = 0.0
  L23_2 = 0.0
  L24_2 = L3_2.z
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
  L21_2 = SetCamCoord
  L22_2 = L19_2
  L23_2 = L20_2.x
  L24_2 = L20_2.y
  L24_2 = L24_2 - 1.25
  L25_2 = L20_2.z
  L26_2 = L5_2 / 1.5
  L25_2 = L25_2 + L26_2
  L21_2(L22_2, L23_2, L24_2, L25_2)
  L21_2 = PointCamAtEntity
  L22_2 = L19_2
  L23_2 = A0_2
  L24_2 = 0.0
  L25_2 = 0.0
  L26_2 = 0.0
  L27_2 = false
  L21_2(L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
  L21_2 = SetCamFov
  L22_2 = L19_2
  L23_2 = GetGameplayCamFov
  L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2 = L23_2()
  L21_2(L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2)
  L21_2 = CreateCam
  L22_2 = "DEFAULT_SCRIPTED_CAMERA"
  L23_2 = true
  L21_2 = L21_2(L22_2, L23_2)
  L22_2 = GetEntityBoneIndexByName
  L23_2 = A0_2
  L24_2 = "seat_dside_f"
  L22_2 = L22_2(L23_2, L24_2)
  L23_2 = GetWorldPositionOfEntityBone
  L24_2 = A0_2
  L25_2 = L22_2
  L23_2 = L23_2(L24_2, L25_2)
  L24_2 = GetEntityForwardVector
  L25_2 = A0_2
  L24_2 = L24_2(L25_2)
  L25_2 = -0.1
  L26_2 = -0.4
  L27_2 = 0.6
  L28_2 = L23_2.x
  L29_2 = L24_2.x
  L29_2 = L29_2 * L26_2
  L28_2 = L28_2 + L29_2
  L28_2 = L28_2 + L25_2
  L29_2 = L23_2.y
  L30_2 = L24_2.y
  L30_2 = L30_2 * L26_2
  L29_2 = L29_2 + L30_2
  L30_2 = L23_2.z
  L30_2 = L30_2 + L27_2
  L31_2 = SetCamCoord
  L32_2 = L21_2
  L33_2 = L28_2
  L34_2 = L29_2
  L35_2 = L30_2
  L31_2(L32_2, L33_2, L34_2, L35_2)
  L31_2 = 0.5
  L32_2 = L24_2.x
  L32_2 = L32_2 * L31_2
  L32_2 = L28_2 + L32_2
  L33_2 = L24_2.y
  L33_2 = L33_2 * L31_2
  L33_2 = L29_2 + L33_2
  L34_2 = L23_2.z
  L34_2 = L34_2 + 0.4
  L35_2 = PointCamAtCoord
  L36_2 = L21_2
  L37_2 = L32_2
  L38_2 = L33_2
  L39_2 = L34_2
  L35_2(L36_2, L37_2, L38_2, L39_2)
  L35_2 = SetCamFov
  L36_2 = L21_2
  L37_2 = 70.0
  L35_2(L36_2, L37_2)
  L35_2 = CreateCam
  L36_2 = "DEFAULT_SCRIPTED_CAMERA"
  L37_2 = true
  L35_2 = L35_2(L36_2, L37_2)
  L36_2 = GetOffsetFromEntityInWorldCoords
  L37_2 = A0_2
  L38_2 = 0.0
  L39_2 = 0.0
  L40_2 = 0.5
  L36_2 = L36_2(L37_2, L38_2, L39_2, L40_2)
  L37_2 = SetCamCoord
  L38_2 = L35_2
  L39_2 = L36_2.x
  L40_2 = L36_2.y
  L41_2 = L36_2.z
  L37_2(L38_2, L39_2, L40_2, L41_2)
  L37_2 = GetOffsetFromEntityInWorldCoords
  L38_2 = A0_2
  L39_2 = 1.5
  L40_2 = 1.0
  L41_2 = 0.5
  L37_2 = L37_2(L38_2, L39_2, L40_2, L41_2)
  L38_2 = PointCamAtCoord
  L39_2 = L35_2
  L40_2 = L37_2.x
  L41_2 = L37_2.y
  L42_2 = L37_2.z
  L38_2(L39_2, L40_2, L41_2, L42_2)
  L38_2 = SetCamFov
  L39_2 = L35_2
  L40_2 = 100.0
  L38_2(L39_2, L40_2)
  L38_2 = CreateCam
  L39_2 = "DEFAULT_SCRIPTED_CAMERA"
  L40_2 = true
  L38_2 = L38_2(L39_2, L40_2)
  L39_2 = L3_2.y
  L40_2 = L2_2.y
  L39_2 = L39_2 - L40_2
  L40_2 = L3_2.z
  L41_2 = L2_2.z
  L40_2 = L40_2 - L41_2
  L41_2 = 0.5
  L42_2 = 0.6
  L43_2 = L3_2.y
  L44_2 = L39_2 * L41_2
  L43_2 = L43_2 - L44_2
  L44_2 = math
  L44_2 = L44_2.max
  L45_2 = L43_2
  L46_2 = L3_2.y
  L46_2 = L46_2 * 0.05
  L44_2 = L44_2(L45_2, L46_2)
  L43_2 = L44_2
  L44_2 = L3_2.z
  L44_2 = L44_2 * L42_2
  L45_2 = GetOffsetFromEntityInWorldCoords
  L46_2 = A0_2
  L47_2 = 0.0
  L48_2 = L43_2
  L49_2 = L44_2
  L45_2 = L45_2(L46_2, L47_2, L48_2, L49_2)
  L46_2 = SetCamCoord
  L47_2 = L38_2
  L48_2 = L45_2.x
  L49_2 = L45_2.y
  L50_2 = L45_2.z
  L46_2(L47_2, L48_2, L49_2, L50_2)
  L46_2 = L2_2.y
  L47_2 = L39_2 * 0.25
  L46_2 = L46_2 + L47_2
  L47_2 = GetOffsetFromEntityInWorldCoords
  L48_2 = A0_2
  L49_2 = 0.0
  L50_2 = L46_2
  L51_2 = L2_2.z
  L52_2 = L40_2 / 2
  L51_2 = L51_2 + L52_2
  L47_2 = L47_2(L48_2, L49_2, L50_2, L51_2)
  L48_2 = PointCamAtCoord
  L49_2 = L38_2
  L50_2 = L47_2.x
  L51_2 = L47_2.y
  L52_2 = L47_2.z
  L48_2(L49_2, L50_2, L51_2, L52_2)
  L48_2 = SetCamFov
  L49_2 = L38_2
  L50_2 = 100.0
  L48_2(L49_2, L50_2)
  L48_2 = {}
  L48_2.default = L7_2
  L48_2.frontCamera = L9_2
  L48_2.backCamera = L11_2
  L48_2.exhaust = L13_2
  L48_2.sideCamera = L15_2
  L48_2.engineBay = L17_2
  L48_2.roof = L19_2
  L48_2.pov = L21_2
  L48_2.doorSpeaker = L35_2
  L48_2.interior = L38_2
  L1_1 = L48_2
  L48_2 = SetCamActive
  L49_2 = L7_2
  L50_2 = true
  L48_2(L49_2, L50_2)
  L48_2 = RenderScriptCams
  L49_2 = true
  L50_2 = false
  L51_2 = 0
  L52_2 = true
  L53_2 = true
  L48_2(L49_2, L50_2, L51_2, L52_2, L53_2)
  L48_2 = "default"
  L0_1 = L7_2
  L3_1 = L48_2
end
setupVehicleCamera = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L0_1
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = L3_1
  if A0_2 == L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  L3_1 = A0_2
  L2_2 = SetCamActiveWithInterp
  L3_2 = L1_2
  L4_2 = L0_1
  L5_2 = 500
  L6_2 = 1
  L7_2 = 1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = SetCamActive
  L3_2 = L0_1
  L4_2 = false
  L2_2(L3_2, L4_2)
  L0_1 = L1_2
  L2_2 = true
  return L2_2
end
moveCameraToVehiclePreset = L4_1
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3
    while true do
      L0_3 = L2_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 100
      L0_3(L1_3)
    end
    L0_3 = true
    L2_1 = L0_3
    L0_3 = moveCameraToVehiclePreset
    L1_3 = A0_2
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = Wait
      L1_3 = 500
      L0_3(L1_3)
    end
    L0_3 = false
    L2_1 = L0_3
  end
  L1_2(L2_2)
end
transitionCamera = L4_1

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
