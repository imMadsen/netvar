Variables = {}

exports('NetvarGetVariableValue', function(variable)
    return Variables[variable]
end)

RegisterNetEvent("Netvar:Update", function(variable, value)
    Variables[variable] = value
end)

TriggerServerEvent("Netvar:Sync")