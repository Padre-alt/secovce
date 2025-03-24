local KeysBin = MachoWebRequest("https://github.com/Padre-alt/secovce.git")
local CurrentKey = MachoAuthenticationKey()

local KeyPresent = string.find(KeysBin, CurrentKey)
if KeyPresent ~= nil then
    print("Key is authenticated [" .. CurrentKey .. "]")
else
    print("Key is not in the list [" .. CurrentKey .. "]")
end
