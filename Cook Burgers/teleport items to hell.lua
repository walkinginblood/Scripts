while wait() do
	for i,v in pairs(workspace.Items:GetChildren()) do
		game.ReplicatedStorage.Events.Network.SetNetworkOwnership:FireServer(v, game.Players.LocalPlayer)
		pcall(function()
			v.CFrame = CFrame.new(math.huge, math.huge, math.huge)
		end)
	end
end