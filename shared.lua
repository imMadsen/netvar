exports('NetVarGetVariableMatches', function(match)
    local matches = {}

    for variable, _ in pairs(NetworkVariables) do
        if string.match(variable, match) then
            table.insert(matches, variable)
        end
    end

    return matches
end)