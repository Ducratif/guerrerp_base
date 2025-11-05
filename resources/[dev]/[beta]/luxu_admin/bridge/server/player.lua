--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local ESX = Framework.object
local QBCore = Framework.object
local QBX = Framework.object
local Ox = Framework.object --[[ @as OxServer ]]


---@return fun(playerObj:table, account:string):number
local function getAccountBalance()
      if Framework.name == 'esx' then
            return function(playerObj, account)
                  return playerObj.getAccount(account)
            end
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return function(playerObj, account)
                  return playerObj.PlayerData.money[account]
            end
      elseif Framework.name == 'ox' then
            return function(playerObj, account)
                  return playerObj.getAccount(account).balance
            end
      else
            return function()
                  return 0
            end
      end
end

---@class PlayerServer
local player = {}

---@param source number
---@return table?
function player.getPlayerObject(source)
      if Framework.name == 'esx' then
            return ESX.GetPlayerFromId(source)
      elseif Framework.name == 'qb' then
            return QBCore.Functions.GetPlayer(source)
      elseif Framework.name == 'qbx' then
            return QBX.Functions.GetPlayer(source)
      elseif Framework.name == 'ox' then
            return Ox.GetPlayer(source)
      end
end

---@param playerObj table
function player.getCharId(playerObj)
      if Framework.name == 'esx' then
            return playerObj.getIdentifier()
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.citizenid
      elseif Framework.name == 'ox' then
            return (playerObj --[[ @as OxPlayer ]]).charId
      else
            return "" --[[ CUSTOM FRAMEWORK ]]
      end
end

---@param playerObj table
---@return string
function player.getCharName(playerObj)
      if Framework.name == 'esx' then
            return playerObj.getName()
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.charinfo.firstname .. " " .. playerObj.PlayerData.charinfo.lastname
      end
end

---@param playerObj table
---@return string
function player.getCharBirthday(playerObj)
      if Framework.name == 'esx' then
            return playerObj.get("dateofbirth")
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.charinfo.birthdate
      elseif Framework.name == 'ox' then
            return playerObj.get("birthdate")
      end
end

---@param source number
function player.revive(source)
      TriggerClientEvent('visn_are:resetHealthBuffer', source)

      if GetResourceState('wasabi_ambulance') == "started" then
            exports.wasabi_ambulance:RevivePlayer(source)
      elseif GetResourceState('ars_ambulancejob') == "started" then
            TriggerClientEvent('ars_ambulancejob:healPlayer', source, { revive = true })
      else
            if Framework.name == 'qb' or Framework.name == 'qbx' then
                  TriggerClientEvent('hospital:client:Revive', source)
                  TriggerClientEvent('qbx_medical:client:playerRevived', source)
            elseif Framework.name == 'esx' then
                  TriggerClientEvent('esx_ambulancejob:revive', source)
                  Player(source).state:set('isDead', false, true)
            end
      end

      Luxu.triggerClientEvent("actions:revive", source)

      TriggerClientEvent('refine-hp:client:Revive', source)
      TriggerClientEvent('refine-hp:client:adminHeal', source)
end

---@param source number
---@param playerObj table
---@return string?
function player.getPhoneNumber(source, playerObj)
      if GetResourceState("okokPhone") == "started" then
            return exports['okokPhone']:getPhoneNumberFromSource(source)
      end

      if GetResourceState("lb-phone") == "started" then
            return Player(source).state.phoneNumber
      end

      if GetResourceState("qs-smartphone-pro") == "started" then
            return exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(
                  playerObj?.PlayerData?.citizenid or playerObj.identifier, false)
      end


      if Framework.name == 'esx' then
            return Player(source).state.phoneNumber
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.charinfo.phone
      end
end

---@param playerObj table
---@return table<string,number>
function player.getMoneyAccounts(playerObj)
      if Framework.name == 'esx' then
            local data = playerObj.getAccounts()
            local accounts = {}
            for _, a in ipairs(data) do
                  accounts[a.name] = a.money
            end
            return accounts
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.money
      elseif Framework.name == 'ox' then
            local account = playerObj.getAccount()
            return { bank = account.get("balance") } --[[ @as table {[string]:number} ]]
      else
            return {} --[[ CUSTOM FRAMEWORK ]]
      end
end

function player.setAccountMoney(source, playerObj, account, amount)
      -- Cash as Item ? Missing checks?
      if account == 'cash' and GetResourceState('ox_inventory') == 'started' then
            local current = exports.ox_inventory:GetItem(source, 'cash', nil, true) --[[ @as number ]]
            exports.ox_inventory:RemoveItem(source, 'cash', current or 0)
            exports.ox_inventory:AddItem(source, 'cash', amount)
      end

      if Framework.name == 'esx' then
            playerObj.setAccountMoney(account, amount)
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            playerObj.Functions.SetMoney(account, amount)
      elseif Framework.name == 'ox' then
            --[[    playerObj.setAccountMoney(account, amount) ]]
      end
end

---@param source number
---@param playerObj table
---@param item string
---@param count number
---@param slot? number
function player.removeItem(source, playerObj, item, count, slot)
      if Framework.name == 'esx' then
            playerObj.removeInventoryItem(item, count)
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            playerObj.Functions.RemoveItem(item, count)
      elseif Framework.name == 'ox' then
            exports.ox_inventory:RemoveItem(source, item, count, nil, slot)
      else
            --[[ CUSTOM FRAMEWORK ]]
      end
end

---@return boolean
function player:canCarryItem(source, playerObj, item, count)
      if Config.inventory.name == "ox_inventory" then
            return exports.ox_inventory:CanCarryItem(source, item, count) == true
      elseif Config.inventory.name == "origen_inventory" then
            return exports.origen_inventory:CanCarryItem(source, item, count)
      elseif Config.inventory.name == "qs-inventory" then
            return exports['qs-inventory']:CanCarryItem(source, item, count)
      elseif Config.inventory.name == "tgiann-inventory" then
            return exports["tgiann-inventory"]:CanCarryItem(source, item, count)
      elseif Config.inventory.name == "core_inventory" then
            local inventory = 'content-' .. (self.getCharId(playerObj)):gsub(":", "")
            return exports['core_inventory']:canCarry(inventory, item, count)
      else
            return true
      end
end

function player.addItem(playerObj, item, count)
      if Framework.name == 'esx' then
            return playerObj.addInventoryItem(item, count)
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.addInventoryItem(item, count)
      end
end

---@param playerObj table
---@param status "thirst" | "hunger"
---@param value number
function player.setStatus(playerObj, status, value)
      if Framework.name == 'esx' then
            --[[ return playerObj.setStatus(status) ]]
            TriggerClientEvent('esx_status:set', playerObj.source, status, 1000000)
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            playerObj.Functions.SetMetaData(status, value)
            if status == 'hunger' or status == 'thirst' then
                  TriggerClientEvent('hud:client:UpdateNeeds', playerObj.PlayerData.source,
                        playerObj.PlayerData.metadata['hunger'],
                        playerObj.PlayerData.metadata['thirst'])
            end
      elseif Framework.name == 'ox' then
            playerObj.setStatus(status, value)
      end
end

function player.setJob(playerObj, job, grade)
      if Framework.name == 'esx' then
            playerObj.setJob(job, grade)
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            playerObj.Functions.SetJob(job, grade)
      end
end

---@param playerObj table
---@return {name:string, label:string, grade:number, gradeName:string, duty:boolean} | nil
function player.getJob(playerObj)
      if Framework.name == 'esx' then
            local job = playerObj.getJob()
            if not job or not job.name then return nil end

            return {
                  name = job.name,
                  label = job.label or job.name,
                  grade = job.grade,
                  gradeName = job.grade_label,
                  duty = job.onDuty and not job.name:find("off_"),
            }
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            if not playerObj.PlayerData.job or not playerObj.PlayerData.job.name then return nil end

            return {
                  name = playerObj.PlayerData.job.name,
                  label = playerObj.PlayerData.job.label or playerObj.PlayerData.job.name,
                  grade = playerObj.PlayerData.job.grade.level,
                  gradeName = playerObj.PlayerData.job.grade.name,
                  duty = playerObj.PlayerData.job.duty,
            }
      end
end

function player.giveVehicleKeys(source, plate, modelHash)
      local resources = {
            { name = "okokGarage",     event = "okokGarage:GiveKeys", args = { source, plate },                  type = "server" },
            { name = "qb-vehiclekeys", event = 'GiveKeys',            args = { source, plate },                  type = "export" },
            { name = "qs-vehiclekeys", event = 'GiveServerKeys',      args = { source, plate, modelHash, true }, type = "export" },
            { name = "cd_garage",      event = 'cd_garage:AddKeys',   args = { source, plate },                  type = "client" },
            { name = "gflp10-carkeys", event = 'AddCarkey',           args = { source, modelHash, plate },       type = "export" },
            { name = "wasabi_carlock", event = 'GiveKey',             args = { source, plate, false },           type = "export" }
      }

      if GetResourceState("qbx_vehiclekeys") == "started" and GetResourceState("qbx_vehicles") == "started" then
            local vehicle = exports.qbx_vehicles:GetVehicleIdByPlate(plate)
            if vehicle then
                  return exports.qbx_vehiclekeys:GiveKeys(source, vehicle)
            end
      end

      for _, resource in ipairs(resources) do
            if GetResourceState(resource.name) == "started" then
                  if resource.type == "server" then
                        return TriggerEvent(resource.event, table.unpack(resource.args))
                  elseif resource.type == "client" then
                        return TriggerClientEvent(resource.event, table.unpack(resource.args))
                  elseif resource.type == "export" then
                        return exports[resource.name][resource.event](exports[resource.name][resource.event],
                              table.unpack(resource.args))
                  end
            end
      end
      ---Fallback for clientside exports
      TriggerClientEvent("vehiclekeys:client:SetOwner", source, plate)
      --- Check client/player.lua
      TriggerClientEvent('luxu_admin:client:giveVehicleKeys', source, plate, modelHash)
end

function player.getGender(playerObj)
      if Framework.name == 'esx' then
            return playerObj.get("sex") == 0 and "male" or "female"
      elseif Framework.name == 'qb' or Framework.name == 'qbx' then
            return playerObj.PlayerData.charinfo.gender == 0 and "male" or "female"
      end
end

function player.openClothingMenu(source)
      if GetResourceState('illenium-appearance') == "started" then
            TriggerClientEvent("illenium-appearance:client:openClothingShop", source, true)
      elseif GetResourceState('qb-clothing') == "started" then
            TriggerClientEvent('qb-clothing:client:openMenu', source)
      elseif GetResourceState('esx_skin') == "started" then
            TriggerClientEvent('esx_skin:openSaveableMenu', source)
      elseif GetResourceState("dpclothing") == "started" or GetResourceState("dpclothing-master") == "started" then
            TriggerClientEvent("dpc:ToggleMenu", source)
      elseif GetResourceState("rcore_clothing") == "started" then
            TriggerClientEvent('rcore_clothing:openShop', source, "binco")
      elseif GetResourceState("ak47_clothing") == "started" then
            TriggerClientEvent('ak47_clothing:openOutfit', source)
      elseif GetResourceState("ak47_qb_clothing") == "started" then
            TriggerClientEvent('ak47_qb_clothing:openOutfit', source)
      elseif GetResourceState("qs-appearance") == "started" then
            TriggerClientEvent("illenium-appearance:client:openClothingShop", source, true)
      elseif GetResourceState("codem-appearance") == "started" then
            -- ???????
            -- There is no official way to open this clothing menu
            -- If you have this resource, ask the author to create exports or event and add to the documentation
      end
end

return player

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
