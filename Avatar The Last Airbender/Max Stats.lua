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
        if method == "InvokeServer" and tostring(self) == "ChangeData" then
            warn("LOGGED!")
			args[2][16][2] = 350
			args[2][17][2] = 350
			args[2][18][2] = 350
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))
