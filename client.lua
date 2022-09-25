Variables = {}
PlayerVariables = {}

function GetVariable(variable, fallback)
    return Variables[variable] or fallback
end

function GetPlayerVariable(variable, fallback)
    return PlayerVariables[variable] or fallback
end

RegisterNetEvent("netvar:_Update", function(variable, value, oldValue)
    Variables[variable] = value
    TriggerEvent("netvar:Update", variable, value, oldValue)
end)

RegisterNetEvent("netvar:_UpdatePlayer", function(variable, value, oldValue)
    PlayerVariables[variable] = value
    TriggerEvent("netvar:UpdatePlayer", variable, value, oldValue)
end)

TriggerServerEvent("netvar:Sync")

exports("GetPlayerVariable", GetPlayerVariable)
exports("GetVariable", GetVariable)
exports("GetVariableValue", GetVariable) -- DEPRECATED (Only here for backwards capability)
