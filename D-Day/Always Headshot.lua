--LOL!
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
        if method == "FireServer" and tostring(self) == "Attempt_Fire" and typeof(args[2]) == "Instance" then
			pcall(function()
				warn("boop")
				args[2] = args[2].Parent.Head
			end)
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))
