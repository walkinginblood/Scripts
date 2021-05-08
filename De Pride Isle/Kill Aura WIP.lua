for i, player in ipairs(game.Players:GetPlayers()) do 
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer:DistanceFromCharacter(player.Character.HumanoidRootPart.Position) < 20 then 
		game.ReplicatedStorage.Events.Game:FireServer("Attacking", player.Character)
	end
end