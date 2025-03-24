local AllowedKeys = require("keys") 
local CurrentKey = MachoAuthenticationKey() 

local function IsKeyValid(key)
    for _, validKey in ipairs(AllowedKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    if IsKeyValid(CurrentKey) then
        print("✅ Key is authenticated [" .. CurrentKey .. "]")
        PlaySuccessAnimation()
        Citizen.Wait(2000) 
        OpenMachoMenu()
    else
        print("❌ Key is not valid [" .. CurrentKey .. "]")
    end
end)

function PlaySuccessAnimation()
    local ped = PlayerPedId()
    local dict = "mp_player_intcelebrationmale"
    local anim = "thumbs_up"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end

    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, 3000, 49, 0, false, false, false)
end
