game.Players.LocalPlayer.Character.combat.update:FireServer("safezone", true)
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
        if method == "FireServer" and tostring(self) == "update" and tostring(args[1]) == "safezone" then
            return
        end
        return old(self, ...)
    end
]])(old))