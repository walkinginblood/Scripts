_G.Settings = {
    MinCharge = 0.9; --Decimal percentage. 0.9 = 90% = 9/10
    Multiplier = 0.5; --Adds to the power. Current power + multiplier = total. if charge is 100% itll be like 1 + 0.5 = 1.5
}

if _G.Executed == nil then
    _G.Executed = "EGG"
    warn("The script is now running - made by Megumu")
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
            if method == "FireServer" and tostring(self) == "Input" and typeof(args[2]) == "table" and args[1] == "spike" then
                if args[2]["power"] > _G.Settings["MinCharge"] then
                    warn("changed power to: ".. args[2]["power"] + _G.Settings["Multiplier"])
                    args[2]["power"] = args[2]["power"] + _G.Settings["Multiplier"]
                end
                return old(self, unpack(args))
            end
            return old(self, ...)
        end
    ]])(old))
end