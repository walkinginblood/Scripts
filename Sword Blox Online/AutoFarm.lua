--Settings
_G.Distance = 12.5

--Variable
local player = game.Players.LocalPlayer

--Teleport
local function TP(enemy)
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
		player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, _G.Distance, 0)
	end
end

--NoClip
game:GetService("RunService").Stepped:Connect(function()
   if player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid:ChangeState(10)
   end
end)

--Farm
for i, child in ipairs(workspace.Mobs:GetChildren()) do 
	if child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then 
		TP(child)
		wait(0.5)
		repeat
			wait()
			game.ReplicatedStorage.DamageMob:FireServer(child.Humanoid, false)
		until child.Humanoid.Health <= 0
	end
end