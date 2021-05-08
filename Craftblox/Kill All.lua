for i, v in pairs(game.Players:GetPlayers()) do
	if v ~= game.Players.LocalPlayer and v.Character then
		game.ReplicatedStorage.DamageHumanoid:InvokeServer(v.Character, math.huge, Vector3.new(), false)
	end
end