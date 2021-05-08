_G.Enabled = true
_G.Weapon = "Sword"
_G.Distance = -7
_G.List = {
	["Thief"] = true,
	["Bandit"] = true,
	["Assassin"] = true,
	["Criminal"] = true,
	["Leader"] = true,
	["Slasher"] = true,
}

--Variable
local player = game:GetService("Players").LocalPlayer

--Find NPC Folder
for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
	if v:FindFirstChild("Thief") or v:FindFirstChild("Bandit") then
		EnemyFolder = v
	end
end

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

--Equip
function Equip()
	if player.Character and player.Character:FindFirstChild("Humanoid") and not player.Character:FindFirstChildOfClass("Tool") then
		repeat wait() until player.Backpack:FindFirstChild(_G.Weapon)
		Weapon = player.Backpack[_G.Weapon]
		if Weapon then
			player.Character.Humanoid:EquipTool(Weapon)
		else
			Weapon = player.Backpack:FindFirstChildOfClass("Tool")
			player.Character.Humanoid:EquipTool(Weapon)
		end
	end
end

--Farm
while wait() do
	for i, child in ipairs(EnemyFolder:GetChildren()) do
		if _G.Enabled and _G.List[child.Name] and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			repeat
				if _G.Enabled and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					Equip()
					player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,_G.Distance,0)
					wait()
					game.ReplicatedStorage.Event:FireServer("move", {_G.Weapon, "Click"})
				end
				wait()
			until child.Humanoid.Health <= 0 or child.Humanoid == nil or child.HumanoidRootPart == nil
		end
	end
end