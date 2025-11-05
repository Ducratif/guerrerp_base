--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {
    Framework = 'esx', -- esx or qbcore (this is for create the item)
    Skin = "esx", -- esx, qbcore five-appearance or crm-appearance (this just depends on what your skin script is)
    Debug = false, -- Change to false if you do not need to save F8 prints

    Ring1 = { 
        Male = { chain_1 = 7, chain_2 = 0 },
        Female = { decals_1 = 52, decals_2 = 1 },
        SaveOutfit = false
    },

    Necklace = { 
        Male = { chain_1 = 129, chain_2 = 4 },
        Female = { chain_1 = 4, chain_2 = 4 },
        SaveOutfit = false
    },

    NeckBrace = { 
        Male = { chain_1 = 208, chain_2 = 0 },
        Female = { chain_1 = 180, chain_2 = 0 },
        SaveOutfit = true
    },

    HospitalGown = { 
        Male = { tshirt_1 = 15, tshirt_2 = 0, torso_1 = 581, torso_2 = 0, arms = 15, pants_1 = 29, pants_2 = 1, shoes_1 = 5, shoes_2 = 7 },
        Female = { tshirt_1 = 14, tshirt_2 = 0, torso_1 = 720, torso_2 = 0, arms = 4, pants_1 = 17, pants_2 = 0, shoes_1 = 5, shoes_2 = 2 },
        SaveOutfit = false
    },

    ArmCast = { 
        Male = { tshirt_1 = 223, tshirt_2 = 0 },
        Female = { tshirt_1 = 275, tshirt_2 = 0 },
        SaveOutfit = false
    },

    LegCast = { 
        Male = { bproof_1 = 75, bproof_2 = 0 },
        Female = { bproof_1 = 63, bproof_2 = 0 },
        SaveOutfit = false
    }
    -- These are examples. Please make sure to edit these and add more that you want

    -- **IMPORTANT** If using crm-appearance then you need to follow this format:

        -- bodyarmour = {
        --     Male = {
        --         crm_clothing = {
        --             {crm_id = 9, crm_style = 64, crm_texture = 0}, -- Body Armors
        --         },
        --     },
        --     Female = {
        --         crm_clothing = {
        --             {crm_id = 9, crm_style = 64, crm_texture = 0}, -- Body Armors
        --         },
        --     },
        --     SaveOutfit = true
        -- },
}

Config.RefreshSkin = {
    UseCommand = true, -- Set to true to enable the /refreshskin command
    UseItem = true,    -- Set to true to enable the "refreshskin" usable item
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
