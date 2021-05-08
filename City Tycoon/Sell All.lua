local build = workspace.Buildings:GetChildren()
for i = 1, #build do local v = build[i] 
	game.ReplicatedStorage.Remotes.SellBuilding:FireServer(v)
end