--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
Config = {}

Config.oldESX = false   --set true if you need esx getSharedObject

Config.oxinv = true --set true if using ox_inventory

Config.limitSystem = false  --set to true if using esx 1.1

Config.Locale = 'fr'

Config.time = 5000  --time to craft 1 item, final time will be multiplied by the quantity

Config.locations = {    --multiple locations can be added here
    vec3(111.2247, 10.7261, 67.7734),
}

Config.cat = {--categories
    {
        catid = 'pharmacie',    --id for items in Config.items to refrence to the category 
        label = 'Medical' --label shown on the nui
    },
}

Config.items = {
    ['medikit'] = {  --itemname
        name = 'medikit',    --itemname, must be the same as the key
        label = 'Kit de soin',   --label shown on the nui
        catid = 'pharmacie',  --catid should match one of the categories in Config.cat
        material = {
            {name = 'bandage', label = 'Bandage', count = 2},--fait
            {name = 'gaze', label = 'gaze', count = 1},--fait
            {name = 'antiseptique', label = 'Antiseptique', count = 1},--fait
            {name = 'ciseaux_medicaux', label = 'Ciseaux medicaux', count = 1},--fait
            {name = 'pochette_vide', label = 'Pochette vide', count = 1},--fait
            {name = 'sparadrap', label = 'Sparadrap', count = 1},
            {name = 'coton', label = 'Coton', count = 1},--fait
            {name = 'gants', label = 'Gants', count = 1},--fait
        }
    },
    
    ['bandage'] = {  --itemname
        name = 'bandage',    --itemname, must be the same as the key
        label = 'Bandage',   --label shown on the nui
        catid = 'pharmacie',  --catid should match one of the categories in Config.cat
        material = {
            {name = 'ciseaux_medicaux', label = 'Ciseaux medicaux', count = 1},--fait
            {name = 'coton', label = 'Coton', count = 10},
        }
    },
    
}

Progbar = function(time, sucess, cancel)    --put the progress bar function here, default using ox_lib progress bar
    if lib.progressBar({
        duration = time,
        label = 'Fabrication...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_ped'
        },
    }) then
        sucess()    --return scess function when progressbar is not cancelled
    else
        cancel()    --return cancel function when progressbar is not cancelled
    end
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
