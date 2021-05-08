local player = game.Players.LocalPlayer

while wait() do
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		if player.Character.Humanoid.MaxHealth ~= player.Character.Humanoid.Health then 
			game.ReplicatedStorage.DamageHandler:FireServer(tonumber("-"..player.Character.Humanoid.MaxHealth - player.Character.Humanoid.Health), player.Character)
		end
	end
end