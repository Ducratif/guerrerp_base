--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
locales = locales or {}

function getLocalizedText(text, ...)
    local message = nil

    if(locales[config.locale][text]) then
        message = locales[config.locale][text]
    else
        message = locales["en"][text]
    end
    
    return string.format(message, ...)
end

function setupESX()
    while ESX == nil do
	    ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end

    if(IsDuplicityVersion()) then
        setupESXCallbacks()
    else
        Citizen.Wait(3000)
    end

    TriggerEvent('esx_job_creator:esx:ready')
end

RegisterNetEvent('esx_job_creator:database:ready', setupESX)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
