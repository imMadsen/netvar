Variables = {}
PlayerVariables = {}

-- Global
function GetVariable(variable, fallback)
    return Variables[variable]
end

function SetVariable(variable, value)
    local oldValue = Variables[variable]
    Variables[variable] = value

    TriggerClientEvent("netvar:_Update", -1, variable, value, oldValue)
end

-- Player specific
function GetPlayerVariable(variable, fallback)
    local guid = GetPlayerGuid(source)
    local variableIndex = string.format("%s:%s", guid, variable)
    return PlayerVariables[variableIndex]
end

function SetPlayerVariable(variable, source, value)
    local guid = GetPlayerGuid(source)
    
    local variableIndex = string.format("%s:%s", guid, variable)
    local oldValue = PlayerVariables[variableIndex]
    PlayerVariables[variableIndex] = value

    TriggerClientEvent("netvar:_UpdatePlayer", source, variable, value, oldValue)
end

-- Sync
RegisterNetEvent("netvar:Sync", function()
    local src = source

    for variable, value in pairs(Variables) do
        TriggerClientEvent("netvar:_Update", src, variable)
    end

    for variable, value in pairs(PlayerVariables) do
        TriggerClientEvent("netvar:_UpdatePlayer", src, variable)
    end
end)

-- Exports
exports("SetPlayerVariable", SetPlayerVariable)
exports("GetPlayerVariable", GetPlayerVariable)

exports("SetVariable", SetVariable)
exports("SetVariableValue", SetVariable) -- DEPRECATED (Only here for backwards capability)
exports("GetVariable", GetVariable)
exports("GetVariableValue", GetVariable) -- DEPRECATED (Only here for backwards capability)