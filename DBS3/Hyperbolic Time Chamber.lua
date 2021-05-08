while wait() do
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "Dummy" then
			local stff = {
				[1] = v, 
				[2] = 0.1, 
				[3] = 2356012642, 
				[4] = 0.5, 
				[5] = 0.1, 
				[6] = false, 
				[7] = "Backwards", 
				[8] = false, 
				[9] = false, 
				[10] = "SmallHits", 
				[11] = math.huge, 
				[12] = "E"
			}
			game.ReplicatedStorage.Events.DamageEvent:FireServer(stff)
		end
	end
end