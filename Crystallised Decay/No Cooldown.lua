local c = getgc()
local player = game.Players.LocalPlayer
local scr = player.Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript")
local funcs = {}
for i = 1, #c do local v = c[i]
    if typeof(v) == "function" and getfenv(v).script ~= nil and getfenv(v).script == scr then
        local stuff = debug.getupvalues(v)
        if #stuff > 1 then
            table.insert(funcs, v)
        end
    end
end
repeat
    for i = 1, #funcs do local v = funcs[i]
        debug.setupvalue(v, 2, true)
    end
    game:GetService("RunService").Heartbeat:Wait()
until not pcall(function() return scr end)