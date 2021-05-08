--Settings
_G.Sword = "Cyber1"
_G.Enabled = true
_G.Range = 200

--Variable
local player = game:GetService("Players").LocalPlayer
local thing = require(game:GetService("ReplicatedFirst").UniqueId)
local RS = game:GetService("ReplicatedStorage")

--Equip
local function equip()
	local weapon = player.Character:FindFirstChildOfClass("Tool")
	if weapon then
		if weapon.Name ~= "TrainingSword" then  
			return weapon
		else
			for i, v in ipairs(player.Backpack:GetChildren()) do 
				if v.Name ~= "TrainingSword" then 
					player.Character.Humanoid:EquipTool(v)
					wait()
					return v
				end
			end		
		end
	else
		for i, v in ipairs(player.Backpack:GetChildren()) do 
			if v.Name ~= "TrainingSword" then 
				player.Character.Humanoid:EquipTool(v)
				wait()
				return v
			end
		end
	end
end

--Check
local function check(int)
	if int:FindFirstChild("HumanoidRootPart") and int:FindFirstChild("Humanoid") and int.Humanoid.Health > 0 then 
		return true
	else
		return false
	end
end

--Farm
while _G.Enabled do
	for i, child in ipairs(game:GetService("Workspace"):GetChildren()) do
		if check(child) and player.Character and check(player.Character) and child ~= player.Character and player:DistanceFromCharacter(child.HumanoidRootPart.Position) < _G.Range then 
			equip():FindFirstChildOfClass("RemoteEvent"):FireServer(player.Character.HumanoidRootPart.Position, child.HumanoidRootPart.Position, RS.Assets.Swords[_G.Sword], thing())
			wait()
			local stff = 
			{
				["id"] = thing(), 
				["humanoid"] = child.Humanoid, 
				["position"] = child.HumanoidRootPart.Position, 
				["hit"] = child.HumanoidRootPart
			}
			RS.Storage.Events.ReconcileDamage:FireServer(stff)
			wait()
		end
	end
	wait()
end