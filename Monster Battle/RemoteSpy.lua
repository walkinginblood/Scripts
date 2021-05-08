-- RemoteSpy
for i,v in pairs(getnilinstances()) do
    if v.Name == "ClientNetwork" then
        n = require(v)
    end
end
local old = n.FireServerEvent
local numb = 1
n.FireServerEvent = function(...)
    warn("fired "..numb)
    numb = numb+1
    for i,v in pairs({...}) do
        warn(i,v,typeof(v))
        if typeof(v) == "table" then
            for i2,v2 in pairs(v) do
                print(i2,v2)
            end
        end
    end
    return old(...)
end