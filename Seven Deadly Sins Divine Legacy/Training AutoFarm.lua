--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")

--Find Nearest
function find(pos)
	repeat wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local Closest
	local Distance = math.huge
	for _,v in pairs(work:GetChildren()) do
		if string.find(v.Name, "Dummy") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
			local newDistance = (v.HumanoidRootPart.Position - pos).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Farm
while wait() do
	nearest = find(player.Character.HumanoidRootPart.Position)
	local timer = 100
	if nearest then 
		player.Character.Humanoid:MoveTo(nearest.HumanoidRootPart.Position)
		repeat
			game:GetService("ReplicatedStorage").dmg:FireServer(nearest.Humanoid, nearest.HumanoidRootPart)
			wait()
			timer = timer - 1
		until nearest.Humanoid.Health <= 0 or timer <= 0
	end
end