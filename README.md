
# Netvar

Netvar is  used to sync server variables with the client effortlessly

## FAQ

#### Does it have to run in a thread

Yes, due to us wanting to gurantee the variable it does have to run in a thread, though ONLY on the client.

#### Isn't it dangerous to sync client and server variables

Yes! Therefore netvar only simply mirros the server variable, and does not allow it to be changed from the client.

#### Can I use this in a commercial product

Use this however you want. Just DONT reupload it and claim it as your own. 


## API Reference

#### Get all items

```lua
-- client.lua
CreateThread(function()
    print(N["MyNameIs"]) -- Rasmus Madsen
    print(N["IsSynced"]) -- true
end)

-- server.lua
N["MyNameIs"] = "Rasmus Madsen"
N["IsSynced"] = true
```
