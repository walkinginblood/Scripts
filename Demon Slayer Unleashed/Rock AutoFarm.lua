local player = game.Players.LocalPlayer
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end
function rock()
	if player.Character:FindFirstChild("rock") then
		return true
	elseif player.Backpack:FindFirstChild("rock") then
		player.Backpack.rock.Parent = player.Character
		return true
	elseif #workspace.CanPick.Rocks:GetChildren() > 0 then
		fireclickdetector(workspace.CanPick.Rocks.Rock.click, 1)
	else
		pcall(function()
			player.Character.PrimaryPart.CFrame = CFrame.new(math.random(1, 1000), 2000, math.random(1, 1000))
		end)
		repeat wait() until #workspace.CanPick.Rocks:GetChildren() > 0
		wait(0.5)
	end
	return false
end
while wait() do
	for i,v in pairs(workspace.npcs.Humans:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			noclip()
			repeat
				pcall(function()
					player.Character.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 10, 0)
				end)
				wait(0.25)
				if rock() then
					game.ReplicatedStorage.events.remote:FireServer("ThrowRock", "", v.Head.Position)
				end
			until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
			Stepped:Disconnect()
		end
	end
end