-- Exploit Check
if not fireclickdetector then
    game:Shutdown()
end

-- Variable
local player = game.Players.LocalPlayer

-- Platform
local function platform()
    local platform = Instance.new("Part")
    platform.Parent = workspace
    platform.Anchored = true
    platform.Size = Vector3.new(math.huge, 1, math.huge)
    platform.Position = Vector3.new(math.random(-10000, 10000), 2500, math.random(-10000, 10000))
    wait()
    player.Character.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0, 50, 0)
end
platform()

-- Get Water
for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "Water" and v.Color == Color3.new(128/255, 187/255, 219/255) then
		water = v.ClickDetector
	end
end

-- Get Food
local function food()
    for i,v in pairs(workspace.Map:GetChildren()) do
        if v:FindFirstChild("ClickDetector") and v:FindFirstChild("Eat") then
            fireclickdetector(v.ClickDetector, 1)
        end
    end
end

-- Added
player.CharacterAdded:Connect(function(char)
    repeat wait() until char:FindFirstChild("HumanoidRootPart")
    platform()
end)

-- Check
while wait(1) do
    if pcall(function() return player.Character.Settings,player.Character.Aspects.Thirst,player.Character.Aspects.Hunger end) then
        if player.Character.Aspects.Thirst.Value < 100 then
            fireclickdetector(water, 1)
        end
        if player.Character.Aspects.Hunger.Value < require(player.Character.Settings).MaxHunger then
            local old = player.Character.Aspects.Hunger.Value
            food()
            wait(3)
            if old == player.Character.Aspects.Hunger.Value then
                workspace.Server.Spawn:FireServer()
            end
        end
    end
end