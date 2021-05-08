local mt = getrawmetatable(game)
local old = mt.__index
make_writeable(mt)
mt.__index = newcclosure(function(t, k)
    if k == "Value" and typeof(t) == "Instance" and tostring(t) == "Length" then
		return 0
    end
    return old(t, k)
end)