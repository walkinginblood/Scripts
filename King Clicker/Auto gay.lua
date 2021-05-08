while wait() do
	game.ReplicatedStorage.RemoteEvent:FireServer("Click", 30)
	wait()
	game.ReplicatedStorage.RemoteEvent:FireServer("PurchaseClickUpgrade")
end