--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- i recommend to NOT change the command name. it will make easier for people to use this command
-- when ever is this library.. so please keep this command name on "streamermode" command
RegisterCommand("streamermode", function(source, args, rawCommand)
    disableMusic = not disableMusic
    TriggerEvent("xsound:streamerMode", disableMusic)
    if disableMusic then
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_on"] } })
    else
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_off"] } })
    end
end, false)

AddEventHandler("xsound:streamerMode", function(status)
    if status then
        for k, v in pairs(soundInfo) do
            Destroy(v.id)
        end
    end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
