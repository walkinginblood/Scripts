local player = game.Players.LocalPlayer
while wait() do
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= player then
			player.Character:FindFirstChildOfClass("Tool")["GunScript_Server"].InflictTarget:FireServer(v.Character.Humanoid, v.Character.HumanoidRootPart, false, Vector3.new())
			wait()
		end
	end
end