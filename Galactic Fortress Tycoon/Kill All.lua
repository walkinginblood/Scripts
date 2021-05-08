local player = game.Players.LocalPlayer
while wait() do
	for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= player then
			pcall(function()
		        game.ReplicatedStorage.InflictTarget:FireServer(player.Character:FindFirstChildOfClass("Tool"), player, v.Character.Humanoid, v.Character.HumanoidRootPart, 100, {0, 0, false, false})
			end)
			wait(.5)
	    end
	end
end