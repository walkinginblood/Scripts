-- Settings
_G.Speed = 40

-- Variable
local player = game.Players.LocalPlayer

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
    player.Character.Humanoid:ChangeState(11)
end)

-- Get Nearest
function nearest()
	local Closest
    local Distance = math.huge
    for i,v in pairs(workspace.Trees:GetChildren()) do
        if pcall(function() return v.PhysicalTree["Smooth Block Model"],v.Health end) and v.Health.Value > 0 then 
            local newDistance = player:DistanceFromCharacter(v.PhysicalTree["Smooth Block Model"].Position)
            if newDistance < Distance then
                Closest = v
                Distance = newDistance
            end
        end
    end
	return Closest
end

-- Tool Check
function tool()
    local tool = player.Character:FindFirstChildOfClass("Tool")
    if tool then
        if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            tool:Activate()
        else
            tool.Parent = player
            repeat wait() until player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health >= 100
            tool.Parent = player.Character
        end
    elseif player:FindFirstChild("Backpack") and player.Backpack:FindFirstChildOfClass("Tool") then
        for i,v in pairs(player.Backpack:GetChildren()) do
            if string.find(v.Name, "Axe") then
                v.Parent = player.Character
            end
        end
    end
end

-- Lerp
while wait() do
    local near = nearest()
    if typeof(near) == "Instance" then
        local part = near.PhysicalTree["Smooth Block Model"]
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(part.Position)/_G.Speed, Enum.EasingStyle.Linear), {CFrame = part.CFrame-Vector3.new(0,2,0)}):Play()
        wait(player:DistanceFromCharacter(part.Position)/_G.Speed)
        repeat
            tool()
            wait()
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = part.CFrame-Vector3.new(0,2,0)
            end)
        until near.Health.Value <= 0
    end
end