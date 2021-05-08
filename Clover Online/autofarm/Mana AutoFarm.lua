while wait() do
	game.ReplicatedStorage.Core:FireServer("BeginCharge")
	game.ReplicatedStorage.AMagicFunction:FireServer("Wind Bullets")
end