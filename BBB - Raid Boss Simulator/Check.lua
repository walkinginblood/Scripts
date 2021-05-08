local mt = getrawmetatable(game)
local old = {
    namecall = mt.__namecall
    index = mt.__index
    newindex = mt.__newindex
}
setreadonly(mt, false)

_G.Locked = {
    PathToFolder = true
}

mt.__namecall(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "Destroy" then
        if not checkcaller() and _G.Locked[self] or _G.Locked[self.Parent] then
            return
        end
    end

    return old.namecall(self, ...)
end