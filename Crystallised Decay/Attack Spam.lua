while wait() do
	for i,v in pairs(game.Players:GetPlayers()) do
		if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
			game.Players.nohaxjustpro6o9.Backpack.Lapis.Lapis.Move4:FireServer(v.Character.HumanoidRootPart.Position)
		end
	end
end