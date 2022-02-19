NetworkVariables = {}

exports('NetVarGetVariableValue', function(variable)
    return NetworkVariables[variable]
end)

RegisterNetEvent("NetVar:Update", function(variable, value)
    NetworkVariables[variable] = value
end)

TriggerServerEvent("NetVar:Sync")