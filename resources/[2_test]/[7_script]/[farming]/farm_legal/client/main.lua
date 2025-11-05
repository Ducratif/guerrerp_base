--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
ESX = exports["es_extended"]:getSharedObject()
local menuOpen = false
local wasOpen = false

Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.FarmDealer.coords, true) < 0.5 then
			if not menuOpen then
				ESX.ShowHelpNotification(_U('dealer_prompt'))

				if IsControlJustReleased(0, 38) then
					wasOpen = true
					OpenFarmShop()
				end
			else
				Citizen.Wait(500)
			end
		else
			if wasOpen then
				wasOpen = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)
		end
	end
end)

function OpenFarmShop()
    menuOpen = true
    local elements = {}

    for _, v in pairs(ESX.GetPlayerData().inventory) do
        local price = Config.FarmDealerItems[v.name]

        if price and v.count > 0 then
            table.insert(elements, {
                title = ('%s - $%s'):format(v.label, ESX.Math.GroupDigits(price)),
                description = ('Quantité disponible: %s'):format(v.count),
                icon = 'fa-solid fa-apple-whole',
                onSelect = function()
                    local input = lib.inputDialog('Vendre ' .. v.label, {
                        { type = 'number', label = 'Quantité', default = 1, min = 1, max = v.count }
                    })

                    if input and input[1] then
                        TriggerServerEvent('esx_farm:sellFarm', v.name, input[1])
                    end
                    -- après la vente, tu peux fermer le menu et reset menuOpen
                    menuOpen = false
                end
            })
        end
    end

    lib.registerContext({
        id = 'farm_shop',
        title = _U('dealer_title'),
        options = elements,
        onExit = function()
            menuOpen = false
        end
    })

    lib.showContext('farm_shop')
end



AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Update Menu OX By Ducratif
function OpenBuyLicenseMenu(licenseName)
    menuOpen = true
    local license = Config.LicensePrices[licenseName]

    lib.registerContext({
        id = 'license_shop',
        title = _U('license_title'),
        options = {
            {
                title = _U('license_no'),
                icon = 'fa-solid fa-xmark',
                onSelect = function()
                    ESX.ShowNotification('Achat annulé')
                    menuOpen = false
                end
            },
            {
                title = license.label,
                description = ('Prix: $%s'):format(ESX.Math.GroupDigits(license.price)),
                icon = 'fa-solid fa-id-card',
                onSelect = function()
                    ESX.TriggerServerCallback('esx_farm:buyLicense', function(boughtLicense)
                        if boughtLicense then
                            ESX.ShowNotification(_U('license_bought', license.label, ESX.Math.GroupDigits(license.price)))
                        else
                            ESX.ShowNotification(_U('license_bought_fail', license.label))
                        end
                        menuOpen = false
                    end, licenseName)
                end
            }
        },
        onExit = function()
            menuOpen = false
        end
    })

    lib.showContext('license_shop')
end


-- End Update Menu OX By Ducratif

function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)

	-- create a blip in the middle
	if Config.Blip then
		blip = AddBlipForCoord(coords)
	else
	end

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
	for k,zone in pairs(Config.CircleZones) do
		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
