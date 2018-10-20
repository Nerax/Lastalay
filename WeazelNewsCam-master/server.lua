RegisterCommand("cam", function(source, args, raw)
    local src = source
    TriggerClientEvent("Cam:ToggleCam", src)
end)

RegisterCommand("bmic", function(source, args, raw)
    local src = source
    TriggerClientEvent("Mic:ToggleBMic", src)
end)

RegisterCommand("mic", function(source, args, raw)
    local src = source
    TriggerClientEvent("Mic:ToggleMic", src)
end)

RegisterCommand("lmob", function(source, args, raw)
    local src = source
    TriggerClientEvent("Mob:ToggleLMob", src)
end)

RegisterCommand("rmob", function(source, args, raw)
    local src = source
    TriggerClientEvent("Mob:ToggleRMob", src)
end)