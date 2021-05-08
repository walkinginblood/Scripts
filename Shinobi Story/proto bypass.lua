local mt = getrawmetatable(game)

if make_writeable then 
	--ProtoSmasher
	make_writeable(mt)
elseif setreadonly then 
	--Other exploits
	setreadonly(mt, false)
else
	game:GetService("Players").LocalPlayer:Kick("Get a better exploit skid")
	wait(5)
	while true do end
end

local old = mt.__namecall

mt.__namecall = function(self, ...)
    local arguments = {...}
    local method = table.remove(arguments)
    local a = table.remove(arguments)
    local b = table.remove(arguments)

    if method == "FireServer" and tostring(self) == "update" and string.find(tostring(a), "exploit") then
        return nil
    end
    return old(self, ...)
end