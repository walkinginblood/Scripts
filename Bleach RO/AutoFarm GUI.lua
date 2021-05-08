--Variable
local player = game:GetService("Players").LocalPlayer
local remotes = game:GetService("ReplicatedStorage").Remotes

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Bleach My Eyes')
local cred = library:CreateWindow('Credits')

--Credits
cred:Label("UI: wally")
cred:Label("Dragging: Ririchi")
cred:Label("Scripts: Purity")

--Farm
w:Section('Discord: PXdNwN5')
w:Toggle('Enabled',{flag = "enabled"})
w:Toggle('Auto Stat',{flag = "stat"})

--Table Check
local function tableCheck(instanceName, tableName)
    for i,v in pairs(tableName) do
        if v == instanceName then
            return
        end
    end
    table.insert(tableName, instanceName)
end

--Get Enemies
local enemies = {}
for i,v in pairs(workspace:GetChildren()) do
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and not game:GetService("Players"):FindFirstChild(v.Name) then
        tableCheck(v.Name, enemies)
    end
end

--Slider
local s = w:Slider("Distance", {
    min = -10;
    max = 0;
    flag = 'fov'
}, function(v)
    _G.Distance = tonumber(v);
end)

--Dropdown
w:Dropdown("Enemy", {
    location = _G;
    flag = "memes";
    list = enemies
}, function(new)
    _G.memes = new
end)

--Check
local function check(thing)
    if thing and thing:FindFirstChild("Humanoid") and thing:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

--NoClip
spawn(function()
    while wait(0.25) do
        if w.flags.enabled and tostring(Stepped) ~= "Connection" then
            Stepped = game:GetService('RunService').Stepped:Connect(function()
                if check(player.Character) then 
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end)
        elseif not w.flags.enabled and Stepped then
            Stepped:Disconnect()
            Stepped = nil
        end
    end
end)

--AutoFarm
spawn(function()
    while true do
        if w.flags.enabled then
            for i,v in pairs(workspace:GetChildren()) do
                if check(player.Character) and check(v) and v.Name == _G.memes and w.flags.enabled then
                    repeat
                        if check(player.Character) and check(v) then
                            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,_G.Distance,0)
                        end
                        wait()
                        pcall(function()
                            remotes.Punch:InvokeServer(math.random(1,2))
                        end)
                    until v == nil or v.Parent == nil or not check(v) or v.Humanoid.Health <= 0 or not w.flags.enabled
                end
            end
        end
        wait()
    end
end)

--AutoPoints
spawn(function()
    while true do
        if w.flags.stat then
            remotes.AddStatPnt:InvokeServer("Kendo")
            wait()
        end
        wait()
    end
end)