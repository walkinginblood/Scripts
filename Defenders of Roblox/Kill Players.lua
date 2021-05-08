for i, player in ipairs(game.Players:GetPlayers()) do 
	if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.ReplicatedStorage.doDmg:FireServer(player.Character.Humanoid, math.huge)
	end
end