local eventName = "netvar#" .. GetCurrentResourceName()

if IsDuplicityVersion() then
    N = {__data = {}}

    setmetatable(N, {
        __index = function(self, key)
            return self.__data[key]
        end,
        __newindex = function(self, key, value)
            self.__data[key] = value
            TriggerClientEvent(eventName, -1, key, value)
        end
    })

    RegisterNetEvent(eventName, function(key)
        TriggerClientEvent(eventName, source, key, N[key])
    end)
else
    N = {__data = {}, __hasBeenRequested = {}, __awaitingPromises = {}, __subscribers = {}}

    setmetatable(N, {
        __index = function(self, key)
            -- Request the variable from the server if it hasn't been requested yet
            if (not self.__hasBeenRequested[key]) then
                self.__hasBeenRequested[key] = true
                self.__awaitingPromises[key] = promise.new()
                TriggerServerEvent(eventName, key)
                Citizen.Await(self.__awaitingPromises[key])
            end

            return self.__data[key]
        end,
        __newindex = function(self, key, value)
            if self.__subscribers[key] == nil then
                self.__subscribers[key] = {}
            end
            
            table.insert(self.__subscribers[key], value)
        end
    })

    -- Subscribe to variable changes
    RegisterNetEvent(eventName, function(key, value)
        if N.__subscribers[key] ~= nil then
            for _, callback in pairs(N.__subscribers[key]) do
                callback(value, N.__data[key])
            end
        end

        N.__data[key] = value

        if (N.__awaitingPromises[key]) then
            N.__awaitingPromises[key]:resolve()
            N.__awaitingPromises[key] = nil
        end
    end)
end