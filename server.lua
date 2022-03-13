Variables = {}

exports("GetVariableValue", function(variable)
    return Variables[variable]
end)

exports("SetVariableValue", function(variable, value)
    local oldValue = Variables[variable]
    TriggerClientEvent("netvar:_Update", -1, variable, value, oldValue)
    Variables[variable] = value
end)

RegisterNetEvent("netvar:Sync", function()
    local src = source
    for variable, value in pairs(Variables) do
        TriggerClientEvent("netvar:_Update", src, variable)
    end
end)