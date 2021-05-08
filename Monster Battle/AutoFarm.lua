--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('monster woosh')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "enabled"})
w:Dropdown("Target", {
    location = _G;
    flag = "memes";
    list = {
        "Boost Stone";
        "Enemies";
    }
}, function(new)
    _G.Target = tostring(new)
end)
w:Dropdown("Weapon", {
    location = _G;
    flag = "memes";
    list = {
        "Melee";
        "Range";
    }
}, function(new)
    _G.Weapon = tostring(new)
end)
w:Box('Delay', {
    flag = "delay";
    type = 'number';
}, function(new)
    _G.Delay = tonumber(new)
end)
w:Slider("Distance", {
    min = -28;
    max = 28;
    flag = 'Distance'
}, function(v)
    _G.Distance = tonumber(v)
end)
w:Box('Minimum Level', {
    flag = "enemyLvl";
    type = 'number';
}, function(new)
    _G.Lvl = tonumber(new)
end)

-- Variable
local player = game.Players.LocalPlayer
local n

-- Globals
_G.Lvl = 1
_G.Distance = -20
_G.Delay = 1
_G.Weapon = "Melee"
_G.Target = "Boost Stone"

-- Get Network Module
for i,v in pairs(getnilinstances()) do
    if v.Name == "ClientNetwork" then
        n = require(v)
    end
end

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
    if w.flags.enabled then
        pcall(function()
            player.Character.Humanoid:ChangeState(11)
        end)
    end
end)

-- Target Check
local function targetCheck(v)
    if _G.Target == "Enemies" then
        if string.find(v.Name:lower(), "lvl") and tonumber(string.split(string.split(v.Name:lower(), "lvl ")[2], ")")[1]) >= _G.Lvl then
            return true
        end
    elseif _G.Target == "Boost Stone" then
        if string.find(v.Name:lower(), "boost stone") then
            return true
        end
    end
end

-- Loop
spawn(function()
    while true do
        if w.flags.enabled then
            for i,v in pairs(workspace.Enemies:GetChildren()) do
                if w.flags.enabled and pcall(function() return v.HumanoidRootPart.Position, v.Humanoid.Health end) and targetCheck(v) then
                    repeat
                        if _G.Weapon == "Melee" then
                            pcall(function()
                                n:FireServerEvent("MeleeHitEvent", v, v.HumanoidRootPart.Position)
                            end)
                        else
                            pcall(function()
                                A_1 = n
                                A_2 = "GunHitEvent"
                                A_3 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                                A_4 = Ray.new(v.HumanoidRootPart.CFrame.p+Vector3.new(0, 5, 0),Vector3.new(0,-5,0))
                                A_5 = v
                                if v:FindFirstChild("Head") then
                                    A_6 = v.Head
                                    A_7 = v.Head.Position + Vector3.new(0, 5, 0)
                                else
                                    A_6 = v.HumanoidRootPart
                                    A_7 = v.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
                                end
                                n.FireServerEvent(A_1, A_2, A_3, A_4, A_5, A_6, A_7)
                            end)
                        end
                        spawn(function()
                            for i = 1, _G.Delay * 10 do
                                pcall(function()
                                    player.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) + Vector3.new(0, _G.Distance, 0)
                                end)
                                if not w.flags.enabled then
                                    return
                                end
                                wait(0.1)
                            end
                        end)
                        wait(_G.Delay)
                    until not w.flags.enabled or v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                end
            end
        end
        wait(.25)
    end
end)