for i, child in ipairs(workspace.Opponents:GetChildren()) do 
	game.ReplicatedStorage.DamageHandler:FireServer(math.huge, child)
end