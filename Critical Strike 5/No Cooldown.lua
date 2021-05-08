local c = getgc()
local player = game.Players.LocalPlayer
local scr = player.PlayerGui.ClassGui.Main
local funcs = {}
for i = 1, #c do local v = c[i]
    if typeof(v) == "function" and getfenv(v).script ~= nil and getfenv(v).script == scr then
        local stuff = debug.getupvalues(v)
        if typeof(stuff[1]) == "boolean" and stuff[2] == player.Character and typeof(stuff[3]) == "number" then
            table.insert(funcs, v)
        end
    end
end
repeat
    for i = 1, #funcs do local v = funcs[i]
        debug.setupvalue(v, 3, 0)
    end
    game:GetService("RunService").RenderStepped:Wait()
until not pcall(function() return player.Character.HumanoidRootPart.CFrame end)