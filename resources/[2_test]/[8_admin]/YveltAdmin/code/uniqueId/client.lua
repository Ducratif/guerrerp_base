--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local UIDS = nil
local UIDtoID = nil
UID = {}

RegisterNetEvent('YveltAdmin:GetInfo')
AddEventHandler('YveltAdmin:GetInfo', function(uids, ids)
	UIDS = uids
	UIDtoID = ids
end)

CreateThread(function()
	YveltHelper:getUniqueId()
end)

exports('getUIDfromID', function(ID)
    local id = ID
    return UIDS[id]
end)

exports('getIDfromUID', function(PUID)
    local id = PUID
    return UIDtoID[id]
end)

function UID:getUIDfromID(ID)
    local id = ID
    return UIDS[id]
end

function UID:getIDfromUID(PUID)
    local id = PUID
    return UIDtoID[id]
end

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
