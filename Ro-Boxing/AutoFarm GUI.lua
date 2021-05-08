-- Variable
local player = game.Players.LocalPlayer

-- Stuff
local pool = workspace.Pool
local rope = workspace.Ropes.RopeTraining

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('box box')
w:Section('Made by Megumu')
w:Dropdown("locations", {
    location = _G;
    flag = "memes";
    list = {
        "Strength";
        "Fitness";
        "Accuracy";
        "Speed";
    }
}, function(new)
    print"yooo"    
end)
w:Toggle('Enabled', {flag = "enabled"})

-- Functions
local funcs = {}

-- Accuracy
funcs.Accuracy = function()
    if not fireclickdetector then
        game:Shutdown()
    end
    for i = 1, 4 do
        local v = workspace["Dummy_Punch"..i]
        if v and v.In_Use.Value == false then
            repeat
                player.Character.HumanoidRootPart.CFrame = v.Touch.CFrame
                wait(1)
                game.ReplicatedStorage.Strength_Exercises[v.Name]:FireServer()
            until v.In_Use.Value or not w.flags.enabled
            repeat
                for i,v in pairs(v.Buttons:GetChildren()) do
                    fireclickdetector(v.ClickDetector, 1)
                end
                wait(.1)
            until v.In_Use.Value == false or not w.flags.enabled
            return
        end
    end
end

-- Strength
funcs.Strength = function()
    repeat
        pcall(function()
            player.Character.HumanoidRootPart.CFrame = rope.Bottom.CFrame
        end)
        wait()
    until rope.Touched_Bottom:FindFirstChild(player.Name) or not w.flags.enabled
    repeat
        pcall(function()
            player.Character.HumanoidRootPart.CFrame = rope.Top.CFrame
        end)
        wait()
    until not rope.Touched_Bottom:FindFirstChild(player.Name) or not w.flags.enabled
end

-- Fitness
funcs.Fitness = function()
    repeat
        pcall(function()
            player.Character.HumanoidRootPart.CFrame = pool.Back.CFrame
        end)
        wait()
    until pool.Touched_End2:FindFirstChild(player.Name) or not w.flags.enabled
    repeat
        pcall(function()
            player.Character.HumanoidRootPart.CFrame = pool.Front.CFrame
        end) 
        wait()
    until pool.Touched_End1:FindFirstChild(player.Name) or not w.flags.enabled
end

-- Speed
funcs.Speed = function()
    for i = 1, 4 do
        local v = workspace["Tramp"..i]
        if v.In_Use.Value == false and w.flags.enabled then
            player.Character.HumanoidRootPart.CFrame = v.Touch.CFrame
            wait(1)
            game.ReplicatedStorage.Strength_Exercises[v.Name]:FireServer()
            repeat wait(1) until v.In_Use.Value == false
            return
        end
    end
end

-- Loop
while true do
    if w.flags.enabled then
        funcs[_G.memes]()
    end
    wait()
end