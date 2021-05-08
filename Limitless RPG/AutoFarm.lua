--Variable
local player = game.Players.LocalPlayer

--Credits
game.StarterGui:SetCore("SendNotification", {
	Title = "Discord: 8JRAyM9";
	Text = "Made by Megumu#8008";
	Icon = "";
	Duration = 20;
})

--Equip
function Equip()
	pcall(function()
		if player.Character and not player.Character:FindFirstChildOfClass("Tool") then 
			local Weapon = player.Backpack:FindFirstChildOfClass("Tool")
			if Weapon and player.Character:FindFirstChild("Humanoid") then 
				player.Character.Humanoid:EquipTool(Weapon)
			end
		end
	end)
end

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

--Farm
pcall(function()
	while wait() do 
		for i, child in pairs(workspace.Enemies[_G.Area]:GetChildren()) do
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") then
				local time = _G.Timer * 30
				repeat
					Equip()
					time = time - 1
					wait()
					player.Character.HumanoidRootPart.CFrame = CFrame.new(child.HumanoidRootPart.Position.X, child.HumanoidRootPart.Position.Y - 10, child.HumanoidRootPart.Position.Z)
					game.ReplicatedStorage.Remotes.RemoteEvent:FireServer("DamageInvoke", child)
				until child.Humanoid.Health <= 0 or child == nil or time <= 0
			end
		end
	end
end)