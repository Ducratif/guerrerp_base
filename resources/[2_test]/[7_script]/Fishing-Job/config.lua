--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
cfg = {
    
    esxLegacy = true,

    job = {
        ['job'] = "pecheur"
    },

    blip = {
        ['blip'] = vector3(-1690.3127, -1076.2634, 13.1522),
        ['blipfishing'] = vector3(-3830.4604, 892.7607, 0.6006),
        ['boatrent'] = vector3(-3426.8962, 966.0803, 8.3467),
        ['sell'] = vector3(-1319.8011, -1321.5725, 4.7664),

    },

    translation = {
        ['jobblip'] = "Vendeur de poisson",
        ['blipfishing'] = "Zone de pêche",
        ['buy'] = "[E] Boutique",
        ['rodname'] = "Canne à pêche - 100$",
        ['limit'] = "Vous n'avez plus de place dans l'inventaire",
        ['fishingboat'] = "Vous devez être sur le bateau que vous avez loué",
        ['instruction'] = "Appuyez sur ~INPUT_ATTACK~ pour lancer la ligne, ~INPUT_FRONTEND_RRIGHT~ pour annuler.",
        ['rodbroke'] = "Vous avez tiré trop fort et votre canne à pêche s'est cassée !",
        ['startedfish'] = "Pêche commencée",
        ['cannotfish'] = "Vous ne pouvez pas pêcher depuis un véhicule",
        ['awayfromshore'] = "Vous devez vous éloigner davantage du rivage",
        ['rentboat'] = "[E] Louer un bateau",
        ['boat'] = "Louer un bateau",
        ['return'] = "[E] Rendre le bateau",
        ['sell'] = "Vendre le poisson",
        ['sellfish'] = "[E] Vendre le poisson",
        ['nofish'] = "Vous n'avez pas de poisson"
    },
    

    marker = {
        ['buy'] = vector3(-1690.4761, -1076.6194, 13.1522),
        ['rentboat'] = vector3(-3427.3367, 966.9029, 8.3467),
        ['boatspawn']  = vector3(-3434.2373, 962.1888, -0.3905),
        ['sell'] = vector3(-1320.4606, -1321.9481, 4.7596),

    },

    shop = {
        ['price'] = 100
    },



    items = {
        ['rod'] = "rod",
        ['fish'] = "fish",
        ['fish1'] = "fish1",
        ['fish2'] = "fish2",
    },

    breakrodchance = {
        ['chance'] = 10
    }
}


Notify = function(msg)
    ESX.ShowNotification(msg)
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
