--Settings
_G.Loop = true
_G.Speed = 120

--Variable
local player = game:GetService("Players").LocalPlayer

--Credits
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Discord: 8JRAyM9";
    Text = "Made by Megumu#8008";
    Duration = 40;
})

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end

--Find Chests
function chest()
	for i, child in ipairs(game:GetService("Workspace"):GetChildren()) do 
		if child:FindFirstChild("Chest") then 
			return child
		end
	end
end

--Find Nearest
function FindDiamond(Pose)
	repeat wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local Closest
	local Distance = math.huge
	for _,v in pairs(chest():GetChildren()) do
		if v.Opened.Value == false then 
			local newDistance = (v.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Find Remote
function remote()
	for i, v in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
		if v:FindFirstChild("ChestOpened") then 
			return v
		end
	end
end

--Farm
function farm()
	local nearest = FindDiamond(player.Character.HumanoidRootPart.Position)
	noclip()
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(nearest.Position)/_G.Speed, Enum.EasingStyle.Linear), {CFrame = nearest.CFrame}):Play()
	wait(player:DistanceFromCharacter(nearest.Position)/_G.Speed)
	Stepped:Disconnect()
	remote().ChestOpened:FireServer(nearest)
end

--Start
farm()

--Loop
while _G.Loop do
	farm()
	wait()
end