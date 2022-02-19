Variables = {}

exports('NetvarGetVariableValue', function(variable)
    return Variables[variable]
end)

exports('NetvarSetVariableValue', function(variable, value)
    Variables[variable] = value
    TriggerClientEvent("Netvar:Update", -1, variable, value)
end)

RegisterNetEvent("Netvar:Sync", function()
    local src = source
    for variable, value in pairs(Variables) do
        TriggerClientEvent("Netvar:Update", src, variable, value)
    end
end)