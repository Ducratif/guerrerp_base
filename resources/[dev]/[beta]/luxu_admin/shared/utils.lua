--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
-- Shared utilities module
-- Table serialization, debouncing, throttling, and coordinate parsing utilities

-- Table serialization function
local function tableToString(value, key, compact, indentLevel)
  -- Set default parameters
  compact = compact or false
  indentLevel = indentLevel or 0
  
  -- Create indentation string
  local indentation = string.rep(" ", indentLevel)
  
  -- Add key prefix if provided
  if key then
    indentation = indentation .. key .. " = "
  end
  
  local valueType = type(value)
  
  if valueType == "table" then
    -- Handle table serialization
    local result = indentation .. "{"
    result = result .. (compact and "" or "\n")
    
    -- Iterate through table entries
    for tableKey, tableValue in pairs(value) do
      local serializedEntry = tableToString(tableValue, tableKey, compact, indentLevel + 1)
      result = result .. serializedEntry .. ","
      result = result .. (compact and "" or "\n")
    end
    
    -- Close table with proper indentation
    result = result .. string.rep(" ", indentLevel) .. "}"
    return result
    
  elseif valueType == "number" then
    -- Handle number serialization
    return indentation .. tostring(value)
    
  elseif valueType == "string" then
    -- Handle string serialization with proper quoting
    return indentation .. string.format("%q", value)
    
  elseif valueType == "boolean" then
    -- Handle boolean serialization
    return indentation .. (value and "true" or "false")
    
  else
    -- Handle unserializable data types
    return indentation .. '"[inserializeable datatype:' .. valueType .. ']"'
  end
end

-- Attach table serialization to table namespace
table.tostring = tableToString
-- Debounce function implementation
local function createDebounce(callback, delay, immediate)
  local lastCallTime = 0
  local hasExecuted = false
  
  return function(...)
    -- Pack arguments for later use
    local args = { ... }
    local currentTime = GetGameTimer()
    
    if immediate then
      -- Execute immediately on first call, then debounce
      if not hasExecuted then
        callback(table.unpack(args))
        lastCallTime = currentTime
        hasExecuted = true
      end
    else
      -- Standard debounce behavior
      local timeSinceLastCall = currentTime - lastCallTime
      if timeSinceLastCall >= delay then
        if not immediate then
          callback(table.unpack(args))
        end
        lastCallTime = currentTime
        hasExecuted = false
      end
    end
  end
end

-- Export Debounce function globally
Debounce = createDebounce
-- Throttle function implementation
local function createThrottle(callback, delay)
  local lastExecutionTime = 0
  
  return function(...)
    local currentTime = GetGameTimer()
    local args = { ... }
    
    local timeSinceLastExecution = currentTime - lastExecutionTime
    if timeSinceLastExecution >= delay then
      callback(table.unpack(args))
      lastExecutionTime = currentTime
    end
  end
end

-- Export Throttle function globally
Throttle = createThrottle
-- Coordinate string parsing function
local function parseCoordsString(coordString)
  -- Pattern for vec3(x, y, z) format
  local vec3Pattern = "vec3%(%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*%)"
  local x1, y1, z1 = string.match(coordString, vec3Pattern)
  if x1 then
    local xNum = tonumber(x1)
    local yNum = tonumber(y1)
    local zNum = tonumber(z1)
    if xNum and yNum and zNum then
      return { x = xNum, y = yNum, z = zNum }
    end
  end
  
  -- Pattern for vec4(x, y, z, w) format
  local vec4Pattern = "vec4%(%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*%)"
  local x2, y2, z2, w2 = string.match(coordString, vec4Pattern)
  if x2 then
    local xNum = tonumber(x2)
    local yNum = tonumber(y2)
    local zNum = tonumber(z2)
    local wNum = tonumber(w2)
    if xNum and yNum and zNum and wNum then
      return { x = xNum, y = yNum, z = zNum, w = wNum }
    end
  end
  
  -- Pattern for vector3(x, y, z) format
  local vector3Pattern = "vector3%(%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*%)"
  local x3, y3, z3 = string.match(coordString, vector3Pattern)
  if x3 then
    local xNum = tonumber(x3)
    local yNum = tonumber(y3)
    local zNum = tonumber(z3)
    if xNum and yNum and zNum then
      return { x = xNum, y = yNum, z = zNum }
    end
  end
  
  -- Pattern for vector4(x, y, z, w) format
  local vector4Pattern = "vector4%(%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*%)"
  local x4, y4, z4, w4 = string.match(coordString, vector4Pattern)
  if x4 then
    local xNum = tonumber(x4)
    local yNum = tonumber(y4)
    local zNum = tonumber(z4)
    local wNum = tonumber(w4)
    if xNum and yNum and zNum and wNum then
      return { x = xNum, y = yNum, z = zNum, w = wNum }
    end
  end
  
  -- Pattern for array format [x, y, z] or [x, y, z, w]
  local arrayPattern = "%[%s*(.-)%s*,%s*(.-)%s*,%s*(.-)%s*(,%s*(.-)%s*)?%]"
  local x5, y5, z5, _, w5 = string.match(coordString, arrayPattern)
  if x5 then
    local xNum = tonumber(x5)
    local yNum = tonumber(y5)
    local zNum = tonumber(z5)
    local wNum = w5 and tonumber(w5) or nil
    
    if xNum and yNum and zNum then
      if not w5 then
        return { x = xNum, y = yNum, z = zNum }
      elseif wNum then
        return { x = xNum, y = yNum, z = zNum, w = wNum }
      end
    end
  end
  
  -- Pattern for object format {x: value, y: value, z: value, w: value?}
  local objectPattern = "%{%s*x:%s*(.-)%s*,%s*y:%s*(.-)%s*,%s*z:%s*(.-)%s*(,%s*w:%s*(.-)%s*)?%}"
  local x6, y6, z6, _, w6 = string.match(coordString, objectPattern)
  if x6 then
    local xNum = tonumber(x6)
    local yNum = tonumber(y6)
    local zNum = tonumber(z6)
    local wNum = w6 and tonumber(w6) or nil
    
    if xNum and yNum and zNum then
      if not w6 then
        return { x = xNum, y = yNum, z = zNum }
      elseif wNum then
        return { x = xNum, y = yNum, z = zNum, w = wNum }
      end
    end
  end
  
  -- Return nil if no pattern matches
  return nil
end

-- Export ParseCoordsString function globally
ParseCoordsString = parseCoordsString

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
