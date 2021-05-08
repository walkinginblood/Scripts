for i, child in ipairs(game:GetService("Workspace").trees:GetChildren()) do
	if child.active.Value == true then
		game:GetService("ReplicatedStorage").ThisGame.Calls.worldAdd:FireServer("harvestTrees", child, os.time)
	end
end