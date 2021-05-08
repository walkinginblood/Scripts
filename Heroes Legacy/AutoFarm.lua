-- Variable
local player = game.Players.LocalPlayer
local events = game.ReplicatedStorage.RemoteEvents

-- Punch & Strength
spawn(function()
    local event = events.P
    local punch = "Left"
    while true do
        if not player:FindFirstChild("CD") then
            if player.Class.Value ~= "NINJA" then
                event:FireServer(punch.."Hand", player.Backpack.LocalScript.Knockback2)
                if punch == "Left" then
                    punch = "Right"
                else
                    punch = "Left"
                end
            else
                events.SS:FireServer()
            end
            wait(0.1)
        end
        wait()
        events.AS:FireServer("Strength", 1)
    end
end)

-- Ability
spawn(function()
    while true do
        for i = 1, 3 do
            if not player:FindFirstChild("CD"..i+1) then
                events["N_"..i]:FireServer()
            end
        end
        wait()
    end
end)

-- Bring
while true do
    for i,v in pairs(workspace.Mobs:GetChildren()) do
        if not string.find(v.Name:lower(), "bald") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            repeat
                pcall(function()
                    v.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                end)
                wait()
            until v == nil or v.Parent == nil or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
        end
    end
    wait(0.25)
end