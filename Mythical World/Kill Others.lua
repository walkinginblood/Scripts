for i, player in ipairs(game:GetService("Players"):GetPlayers()) do 
	if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character.Humanoid and player.Character.Humanoid.Health > 0 then 
		game:GetService("ReplicatedStorage").Events.DamageEvent:FireServer(player.Character.Humanoid, player.Character.Humanoid.Health)
	end
end