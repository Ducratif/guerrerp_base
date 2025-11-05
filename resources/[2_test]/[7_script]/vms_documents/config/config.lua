--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.CoreExport = function()
    return exports['es_extended']:getSharedObject()
end

Config.Notification = function(title, msg, time, icon, type)
    if type == "success" then
        exports.ox_lib:notify({
            title = title or 'Succès',
            description = msg,
            type = 'success',
            duration = time or 5000,
            icon = icon or 'check'
        })
    elseif type == "error" then
        exports.ox_lib:notify({
            title = title or 'Erreur',
            description = msg,
            type = 'error',
            duration = time or 5000,
            icon = icon or 'ban'
        })
    end
end



Config.Interact = {
    Enabled = true,
    Open = function(key, msg)
        exports["interact"]:Open(key, msg)
    end,
    Close = function()
        exports["interact"]:Close()
    end
}

Config.MustMakePhoto = true
Config.PhotoPrice = 250

Config.UseMarker = true
if Config.UseMarker then
    Config.Marker = {
        markerId = 1,
        coords = vector3(-268.3050, -957.7134, 31.2282),
        size = vec(1.0, 1.0, 1.0),
        color = {60, 120, 250, 121},
        rotate = false
    }
end

Config.DisplayTexts = {
    ["drive_bike"] = {
        have = "A",
        notHave = "A"
    },
    ["drive"] = {
        have = "B",
        notHave = "B",
    },
    ["drive_truck"] = {
        have = "C",
        notHave = "C",
    },
    ["drive_boat"] = {
        have = "YES",
        notHave = "NO",
    },
    ["flying_helicopter"] = {
        have = "Helicopter",
        notHave = "Helicopter",
    },
    ["flying_plane"] = {
        have = "Plane",
        notHave = "Plane",
    },
    ["weapon"] = {
        have = "OUI",
        notHave = "NON",
    }
}

Config.Documents = {
    ["id_card"] = {
        item = "id_card", -- nil if you want to use e.g. via trigger, if you want to use as an item set "itemname"
        color = "#f5e942",
        animation = {"random@atmrobberygen", "a_atm_mugging"},
        animationTimeout = 2500,
        header = "ID CARD",
        icon = "person", -- https://fonts.google.com/icons
        notifyText = "Vous regardez votre carte d'identité.",
    },
    ["id_drive"] = {
        item = "driver_license",
        color = "#34eb71",
        animation = {"random@atmrobberygen", "a_atm_mugging"},
        animationTimeout = 2500,
        header = "DRIVE LICENSE",
        icon = "directions_car",
        notifyText = "Vous regardez votre permis de conduire",
    },
    ["id_fly"] = {
        item = nil,
        color = "#c2ddff",
        animation = {"random@atmrobberygen", "a_atm_mugging"},
        animationTimeout = 2500,
        header = "FLY LICENSE",
        icon = "flight",
        notifyText = "Vous regardez votre d'avion",
    },
    ["id_boat"] = {
        item = nil,
        color = "#267fed",
        animation = {"random@atmrobberygen", "a_atm_mugging"},
        animationTimeout = 2500,
        header = "BOAT LICENSE",
        icon = "directions_boat",
        notifyText = "Vous regardez votre bateau",
    },
    ["id_weapon"] = {
        item = nil,
        color = "#d92b2b",
        animation = {"random@atmrobberygen", "a_atm_mugging"},
        animationTimeout = 2500,
        header = "WEAPON LICENSE",
        icon = "crisis_alert",
        notifyText = "Vous regardez votre license d'arme",
    },
}

Config.Texts = {
    ["notify_title"] = "DOCUMENTS",
    ["notify_title_photo"] = "PHOTO",
    ["no_have_photo"] = "You do not have an picture to the document. You have to make them first.",
    ["you_paid_for_photo"] = "You paid %s$ to take a photo for documents",
    ["you_do_photo"] = "You took a picture for your documents.",
    ["not_have_money"] = "You don't have enough money to take a picture.",
    ['interact_paid_photo'] = "TAKE A PHOTO ($"..Config.PhotoPrice..")",
    ['interact_free_photo'] = "TAKE A PHOTO"
}

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
