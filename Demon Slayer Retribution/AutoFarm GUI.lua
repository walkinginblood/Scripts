-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

-- Main
local w = library:CreateWindow('Demon Slayer')
local cred = library:CreateWindow('Credits')

-- Labels
cred:Label('UI: wally')
cred:Label('Dragging: Ririchi')
cred:Label('Scripts: Megumu')

-- Section
w:Section('Auto Farm')

-- Toggle
w:Toggle('Enabled', {flag = "autofarm"})
w:Toggle('Auto Strength', {flag = "strength"})

-- Variables
local player = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
Stepped = nil
getgenv().memes = "Strength"
getgenv().delayy = 60

-- Button
w:Button("Platform", function()
    local plat = Instance.new("Part", workspace)
    plat.Name = tostring(math.random(1, 9999))
    plat.Size = Vector3.new(100, 2, 100)
    plat.Position = Vector3.new(math.random(1000, 9999), 250, math.random(1000, 9999))
    plat.Anchored = true
    plat.CanCollide = true
    wait(0.25)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = plat.CFrame + Vector3.new(0, 12, 0)
    end
end)

-- NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    end)
end

-- Strength
spawn(function()
    while true do
        if w.flags.strength then
            game.ReplicatedStorage.StatSystem.Points:FireServer("Strength")
        end
        wait()
    end
end)

-- AutoFarm
while true do
    if w.flags.autofarm then
        for i,v in pairs(workspace["Npc's"]:GetChildren()) do
            if w.flags.autofarm and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                noclip()
                repeat
                    pcall(function()
                        v.HumanoidRootPart.Anchored = true
                        v.HumanoidRootPart.CFrame = player.Character.Sword.Sword.CFrame + Vector3.new(math.random(1/10), 0, 0)
                        player.Character.EquipScript.SwingEvent:FireServer(true)
                    end)
                    wait()
                until not w.flags.autofarm or v == nil or v.Parent == nil or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                Stepped:Disconnect()
            end
        end
    end
    wait()
end