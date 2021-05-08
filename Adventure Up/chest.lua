for i,v in pairs(workspace.Chests:GetChildren()) do
	pcall(function()
		require(game.ReplicatedStorage.Framework).Network:Send("Interactions/Chests/Open", v)
	end)
end