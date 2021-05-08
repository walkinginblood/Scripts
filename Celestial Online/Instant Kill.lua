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
        if method == "FireServer" and tostring(self) == "COMBAT" and args[2]["Multiplicator"] then
            warn("megumu gang!")
			args[2]["Multiplicator"] = 1e13
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))