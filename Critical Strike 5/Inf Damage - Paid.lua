--ProtoSmasher Compatible
if PROTOSMASHER_LOADED then
	getgenv().getnamecallmethod = get_namecall_method
    getgenv().newcclosure = protect_function
end

--LOL!
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
        if method == "InvokeServer" and tostring(self) == "Damage" and typeof(args[3]) == "Instance" and typeof(args[4]) == "number" then
            warn("kelli king")
			args[4] = math.huge
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))