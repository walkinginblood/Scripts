--Get Key
local mt = getrawmetatable(game)
make_writeable(mt)
local old = mt.__namecall
mt.__namecall = newcclosure(loadstring([[
    local old = ...
    return function(self, ...)
        local len = select("#", ...)
        local pack = {...}
        local args = {}
        for i=1,len do
            args[i] = pack[i]
        end

        local method = getnamecallmethod()
        if method == "FireServer" and tostring(self) == "MagicEvent" and #args == 2 then
            getgenv().attack = tostring(args[1])
            getgenv().remotekey = tostring(args[2])
        end
        return old(self, ...)
    end
]])(old))

--Variable
local player = game.Players.LocalPlayer

-- :)
repeat wait() until getgenv().remotekey ~= nil and getgenv().attack ~= nil

--Test
while _G.Enabled do
	wait()
    game.ReplicatedStorage.RemoteEvents.MagicEvent:FireServer(attack, remotekey)
end