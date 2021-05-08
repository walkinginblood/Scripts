for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= game.Players.LocalPlayer and v.Character then
		game.ReplicatedStorage.GameEvents.DoDamage:FireServer(v.Character, math.huge)
	end
end