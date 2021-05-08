local player = game.Players.LocalPlayer
while wait() do
	for i,v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < 16 then
			game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(v.Character)
		end
	end
end