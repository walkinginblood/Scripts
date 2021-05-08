local mt = getrawmetatable(game)
setreadonly(mt, false)
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
        if method == "InvokeServer" and tostring(self) == "FishBiting" then
            warn("megumu gang")
			return old(self, unpack(args)), game.ReplicatedStorage.CloudClientResources.Communication.Events.FishCaught:FireServer()
		end
        return old(self, ...)
    end
]])(old))