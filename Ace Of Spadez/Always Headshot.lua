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
        if method == "FireServer" and tostring(self) == "BulletHumanoidHit" and typeof(args[2]) == "Instance" then
            warn("kelli king")
			pcall(function()
            	args[2] = args[2].Parent.Head
			end)
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))