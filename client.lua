Variables = {}

exports("GetVariableValue", function(variable, fallback)
    return Variables[variable] or fallback
end)

RegisterNetEvent("netvar:_Update", function(variable, value, oldValue)
    Variables[variable] = value
    TriggerEvent("netvar:Update", variable, value, oldValue)
end)

TriggerServerEvent("netvar:Sync")