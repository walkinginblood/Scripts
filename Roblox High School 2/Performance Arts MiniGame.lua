while game.Players.LocalPlayer.PlayerGui:FindFirstChild("Minigame_PerformanceArts") do 
	game:GetService("ReplicatedStorage").Remotes.SendActivityData:FireServer("PerformanceArts", true)
	wait()
end