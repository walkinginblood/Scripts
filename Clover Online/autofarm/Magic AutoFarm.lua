local player = game.Players.LocalPlayer

while wait() do 
	repeat
		game.ReplicatedStorage.Core:FireServer("BeginCharge")
		wait()
	until player.Capacity.Value == player.MaxCapacity.Value
	game.ReplicatedStorage.Core:FireServer("EndCharge")
	repeat
		game.ReplicatedStorage.AMagicFunction:FireServer("Wind Bullets")
		wait()
	until player.Capacity.Value < 25
end