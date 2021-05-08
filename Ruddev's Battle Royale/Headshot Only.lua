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
        if method == "FireServer" and tostring(self) == "Hit" then
            args[1] = args[1].Parent.Head
			print(args[1])
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))