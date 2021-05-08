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
        if method == "InvokeServer" and tostring(self) == "Gear" and #args == 3 and args[1] == "RangedAction" then
            warn("megumu gang")
            args[3] = 100
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))