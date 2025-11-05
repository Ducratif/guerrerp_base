--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
function PlayUrl(source, name_, url_, volume_, loop_)
    TriggerClientEvent("xsound:stateSound", source, "play", {
        soundId = name_,
        url = url_,
        volume = volume_,
        loop = loop_
    })
end

exports('PlayUrl', PlayUrl)

function PlayUrlPos(source, name_, url_, volume_, pos, loop_)
    TriggerClientEvent("xsound:stateSound", source, "playpos", {
        soundId = name_,
        position = pos,
        url = url_,
        volume = volume_,
        loop = loop_
    })
end

exports('PlayUrlPos', PlayUrlPos)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
