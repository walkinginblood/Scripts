--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Demon Slayer')
local cred = library:CreateWindow('Credits')

--Labels
cred:Label('UI: wally')
cred:Label('Dragging: Ririchi')
cred:Label('Scripts: Megumu/Purity')

--Section
w:Section('Auto Farm')

--Toggle
w:Toggle('Enabled', {flag = "autofarm"})

--Section
w:Section('Auto Stats')

--Toggle
w:Toggle('Enabled',{flag = "statpoint"})

--Dropdown
w:Dropdown("Stat", {
    location = getgenv();
    flag = "memes";
    list = {
        "Strength";
        "Physical";
        'Stamina';
        'Health';
    }
}, function(new)
    print(getgenv().memes)
end)

--Section
w:Section('Other')

--Variables
local player = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
Stepped = nil
getgenv().memes = "Strength"
getgenv().delayy = 60

--Button
local b = w:Button("Platform", function()
    local plat = Instance.new("Part", workspace)
    plat.Name = tostring(math.random(1, 9999))
    plat.Size = Vector3.new(100, 2, 100)
    plat.Position = Vector3.new(math.random(1000, 9999), 250, math.random(1000, 9999))
    plat.Anchored = true
    plat.CanCollide = true
    wait(0.25)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = plat.CFrame + Vector3.new(0, 15, 0)
    end
end)

--Toggle
w:Toggle("Auto Save",{flag = "save"})

--Slider
w:Slider("Save Delay", {
    min = 5;
    max = 60;
    flag = 'fov'
}, function(v)
    getgenv().delayy = tonumber(v);
end)

--NoClip
local function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

--Points
spawn(function()
    while true do
        if w.flags.statpoint then
            if player:FindFirstChild("PlrStats") and player.PlrStats:FindFirstChild("PlrInfo") and player.PlrStats.PlrInfo:FindFirstChild("Points") and player.PlrStats.PlrInfo.Points.Value > 0 then
                rs.StatSystem.Points:FireServer(tostring(getgenv().memes))
            end
        end
        wait()
    end
end)

--Auto Attack
spawn(function()
    while true do
        if w.flags.autofarm then
            rs.SwingEvent:FireServer()
            wait(0.25)
        end
        wait()
    end
end)

--Auto Save
spawn(function()
    while true do
        if w.flags.save then
            rs.SaveEvent:FireServer()
            wait(getgenv().delayy)
        end
        wait()
    end
end)

--Loop
while true do
    if w.flags.autofarm then
        if Stepped == nil then
            noclip()
        end
        for i,v in pairs(workspace:GetDescendants()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and not game:GetService("Players"):FindFirstChild(v.Name) then
                v.HumanoidRootPart.Anchored = true
                v.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2.5)
                wait()
            end
        end
    elseif Stepped ~= nil then
        Stepped:Disconnect()
        Stepped = nil
    end
    wait()
end