self:RegisterCommand('funk', function() Player:OpenFunk() end)
self:RegisterKeyMapping('F1', 'FUNKSYSTEM', 'funk', function() end)

RegisterNUICallback('betreten', function(data, cb)
    local channel = tonumber(data.input)
    
    if channel then
        exports['pma-voice']:setRadioChannel(channel)
        
        Player.IsInRadio = true

        SendNUIMessage({
            action = "update:radioStatus",
            isInRadio = Player.IsInRadio
        })
    end

    cb('OK')
end)


RegisterNUICallback('verlassen', function(cb)

    exports['pma-voice']:removePlayerFromRadio()

    Player.IsInRadio = false

    SendNUIMessage({
        action = "update:radioStatus",
        isInRadio = Player.IsInRadio
    })
    
end)

RegisterNUICallback('closeFunkUI', function(cb)
    SetNuiFocus(false, false)
end)

exports("IsInRadio", Player.IsInRadio)