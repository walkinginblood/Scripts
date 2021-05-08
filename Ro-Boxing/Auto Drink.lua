while wait(1) do
	game.ReplicatedStorage["Drink_Shake"]:InvokeServer("Vanilla")
	wait(1)
    game.ReplicatedStorage["Drink_Shake"]:InvokeServer("Chocolate")
	wait(1)
	game.ReplicatedStorage["Drink_Shake"]:InvokeServer("Toxic")
	wait(1)
end