local class = "MONSTER"

repeat
	game.ReplicatedStorage.RemoteEvents.BS:FireServer()
	wait()
	game.ReplicatedStorage.RemoteEvents.SP:FireServer()
	wait(0.25)
until game.Players.LocalPlayer.Class.Value == class