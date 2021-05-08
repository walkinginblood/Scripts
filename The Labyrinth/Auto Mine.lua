_G.Ores = { --Target List
	[1] = "Diamond",
	[2] = "Sapphire",
	[3] = "Ruby",
	[4] = "Amethyst",
	[5] = "Tourmaline",
	[6] = "Topaz",
	[7] = "Emerald",
	[8] = "Gold",
	[9] = "Silver",
	[10] = "Iron",
	[11] = "Copper",
	[12] = "Coal",
	[13] = "Stone",
}
_G.Speed = 50 --TP Speed

--Variable
local RS = game:GetService("ReplicatedStorage")
local work = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
		if _G.Enabled == false and Stepped then 
			Stepped:Disconnect()
		end
	end)
end

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(work.Resources.Glade.Ores:GetChildren()) do
		for i, ore in ipairs(_G.Ores) do 
			if string.find(v.Name, ore) then
				if v:FindFirstChild("MainPart") and v:FindFirstChild("Properties") and v.Properties:FindFirstChild("Alive") and v.Properties.Alive.Value == true and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
					local newDistance = (v.MainPart.Position - Pose).magnitude
					if newDistance < Distance then
						Closest = v.MainPart
						Distance = newDistance
					end
				end
			end
		end
	end
	return Closest
end

--TP
while wait() do
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local nearest = nearest(player.Character.HumanoidRootPart.Position)
		if nearest == nil then
			return
		end
		noclip()
		game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(nearest.Position)/_G.Speed, Enum.EasingStyle.Linear), {CFrame = nearest.CFrame}):Play()
		wait(player:DistanceFromCharacter(nearest.Position)/_G.Speed)
		repeat
			if nearest.Parent.Properties.Health:FindFirstChild(player.Name) then
				RS.Resources.Data.Events.Traffic.Gear:InvokeServer("Action", Vector3.new())
				wait()
			else
				keypress(0x45)
				keyrelease(0x45)
				wait(0.5)
				RS.Resources.Data.Events.Traffic.Gear:InvokeServer("Action", Vector3.new())
				wait(1)
			end
			wait()
		until nearest.Parent.Properties.Health.Value <= 0 or player.Character == nil or player.Character.HumanoidRootPart == nil
	end
end