NetworkVariables = {}

exports('NetVarGetVariableValue', function(variable)
    return NetworkVariables[variable]
end)

exports('NetVarSetVariableValue', function(variable, value)
    NetworkVariables[varname] = value
    TriggerClientEvent("NetVar:Update", -1, varname, value)
end)

RegisterNetEvent("NetVar:Sync", function()
    local src = source
    for variable, value in pairs(NetworkVariables) do
        TriggerClientEvent("NetVar:Update", src, variable, value)
    end
end)