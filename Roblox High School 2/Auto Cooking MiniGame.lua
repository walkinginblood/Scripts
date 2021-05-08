local remote = game.ReplicatedStorage.Remotes.SendActivityData 
while game.Players.LocalPlayer.PlayerGui:FindFirstChild("Cooking_Minigame") do
	remote:FireServer("CheeseCooking")
	wait()
	remote:FireServer("BroccoliCooking")
	wait()
	remote:FireServer("GrapesCooking")
	wait()
	remote:FireServer("EggCooking")
	wait()
	remote:FireServer("AppleCooking")
end