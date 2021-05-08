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
        if method == "FireServer" and tostring(self) == "Load" and tostring(args[1]) == "Subtract" then
            return
        end
        return old(self, ...)
    end
]])(old))