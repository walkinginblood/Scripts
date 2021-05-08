--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('chest tp')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "toggle1"})
w:Box('Speed', {flag = "speed", type = 'number';}, function(new)
    getgenv().Speed = tonumber(new)
end)

-- Chest Folder
function chestFolder()
	for i,v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("Chest") then
			return v
		end
	end
end

-- Variable
local player = game.Players.LocalPlayer

-- Auto Rejoin
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
end)

-- Find Nearest
function nearest(Pose)
	local Closest
    local Distance = math.huge
    local folder = chestFolder()
    if typeof(folder) == "Instance" then
        for _,v in pairs(chestFolder():GetChildren()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
                local newDistance = (v.Position - Pose).magnitude
                if newDistance < Distance then
                    Closest = v
                    Distance = newDistance
                end
            end
        end
    end
	return Closest
end

-- Platform
function platform()
    local plat = Instance.new("Part", workspace)
    plat.Size = Vector3.new(10, 1, 10)
    plat.Transparency = 1
    plat.Anchored = true
    repeat
        plat.CFrame = player.Character.PrimaryPart.CFrame + Vector3.new(0, -5.2, 0)
        wait()
    until _G.travel
    plat:Destroy()
end

-- Loop & AutoFarm
while true do
    if w.flags.toggle1 then
        near = nil;
        repeat
            pcall(function()
                near = nearest(player.Character.HumanoidRootPart.Position)
            end)
            wait()
        until near ~= nil and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        _G.travel = false
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(near.Position)/getgenv().Speed, Enum.EasingStyle.Linear), {CFrame = near.CFrame}):Play()
        spawn(platform)
        wait(player:DistanceFromCharacter(near.Position)/getgenv().Speed)
        _G.travel = true
		local attempts = 12
        repeat
            pcall(function()
                game.ReplicatedStorage.Remotes.ChestOpened:FireServer(near)
            end)
            wait(0.25)
			attempts = attempts - 1
        until attempts <= 0 or not w.flags.toggle1 or near == nil or near.Parent == nil or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")
    end
	wait(0.25)
end