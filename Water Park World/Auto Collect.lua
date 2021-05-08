--Get Current Coins
for i, v in pairs(workspace.LocalDump.Pickupables:GetChildren()) do
	for i = 1, 6 do
    	game.ReplicatedStorage.Comm.RequestPickUp:FireServer(i, tonumber(v.Name))
	end
end

--Get New Coins
workspace.LocalDump.Pickupables.ChildAdded:Connect(function(v)
	for i = 1, 6 do
    	game.ReplicatedStorage.Comm.RequestPickUp:FireServer(i, tonumber(v.Name))
	end
end)