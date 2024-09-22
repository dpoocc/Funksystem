self = {}
Player = {
  Ped = PlayerPedId(),
  Radio = nil,
  Coords = vec3(0.0, 0.0, 0.0),
  Job = ESX.GetPlayerData().job,
  IsInRadio = false,
  Settings = {};
  
  faction = {
    ["vagos"] = 1,
    ["triaden"] = 4,
  }
}

function self:print(...)
  local args = { ... }
    for _, v in next, args do
      print("^2[DEBUG] ^7" .. v)
    end
end

function self:RegisterCommand(name, callback)
  RegisterCommand(name, function(source, args, rawCommand)
      callback(source, args, rawCommand)
  end, false)
end


function self:RegisterNuiCallback(callbackName, callbackFunction)
  RegisterNUICallback(callbackName, callbackFunction)
end

function self:RegisterKeyMapping(key, description, commandName, callback)
  RegisterKeyMapping(commandName, description, 'keyboard', key)
end

function Player:OpenFunk()

  SendNUIMessage({
      action = "open:funk",
      faction = Player.Job.label,
      factionNumber = Player.faction[Player.Job.name] or 0
  })

  SetNuiFocus(true, true)
end


function Player:Animation(animDict, animName)
    Player.Settings.animdict = animDict
    Player.Settings.anim = animName
end

RegisterNUICallback('setAnimation', function(data, cb)
    local animDict = data.animDict
    local animName = data.animName

    if animDict and animName then
        Player:Animation(animDict, animName)
    end

    cb('OK')
end)

exports('IsFunkAnimTask', function()
    return {
        animdict = Player.Settings.animdict,
        anim = Player.Settings.anim
    }
end)