--ProtoSmasher Compatible
if PROTOSMASHER_LOADED then
    getgenv().getnamecallmethod = get_namecall_method
    getgenv().newcclosure = protect_function
end

--Always Headshot
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
        if method == "FireServer" and tostring(self) == "Shoot" and typeof(args[3]) == "table" then
            for i,v in pairs(args[3]) do
                if typeof(v) == "table" then
                    args[3][i][1] = args[3][i][1].Parent.Head
                    print(args[3][i][1])
                end
            end
            return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))