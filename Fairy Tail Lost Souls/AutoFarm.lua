local player = game.Players.LocalPlayer

local shit = game:GetService("RunService").RenderStepped:Connect(function()
	player.Character.Humanoid:ChangeState(11)
end)

function tool()
	if player.Character:FindFirstChild("Punch") then
		pcall(function()
			game.ReplicatedStorage.Remotes.Magic.ClickDown:FireServer(player.Backpack.Magic_Main.DummyValue)
		end)
	elseif pcall(function() return player.Backpack.Punch end) then
		player.Backpack.Punch.Parent = player.Character
		pcall(function()
			game.ReplicatedStorage.Remotes.Magic.ClickDown:FireServer(player.Backpack.Magic_Main.DummyValue)
		end)
	end
end

for i,v in pairs(workspace.Characters:GetChildren()) do
	if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Name ~= "owo" and not game.Players:FindFirstChild(v.Name) then
		repeat
			pcall(function()
				player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10) + Vector3.new(0, -10, 0)		
			end)
			wait()
		until v.Humanoid.Health <= 0
	end
end