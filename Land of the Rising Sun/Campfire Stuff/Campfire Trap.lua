local root = game.Players.LocalPlayer.Character.Head
local event = workspace.Remotes.placerSystem.placeLogEvent
for i,v in pairs(game.Players:GetPlayers()) do
    if pcall(function() return v.Character.Head end) and v ~= game.Players.LocalPlayer then
		local root = v.Character.Head
		for e = -3.5, 3.5, 3.5 do
			for i = 1, 5, 1.5 do
				local A_1 = 
				{
					[1] = root.CFrame*CFrame.new(e,0,-2.5)-Vector3.new(0,i,0), 
					[2] = "Pine Log"
				}
				event:FireServer(A_1)
			end
		end
		for e = -3.5, 3.5, 3.5 do
			for i = 1, 5, 1.5 do
				local A_1 = 
				{
					[1] = root.CFrame*CFrame.new(e,0,2.5)-Vector3.new(0,i,0), 
					[2] = "Pine Log"
				}
				event:FireServer(A_1)
			end
		end
		for i = 1, 5, 1.5 do
			local A_1 = 
			{
				[1] = root.CFrame*CFrame.new(2.5,0,0)-Vector3.new(0,i,0), 
				[2] = "Pine Log"
			}
			event:FireServer(A_1)
		end
		for i = 1, 5, 1.5 do
			local A_1 = 
			{
				[1] = root.CFrame*CFrame.new(-2.5,0,0)-Vector3.new(0,i,0), 
				[2] = "Pine Log"
			}
			event:FireServer(A_1)
		end
		local A_1 = 
		{
			[1] = root.CFrame+Vector3.new(0,2,0), 
			[2] = "Pine Log"
		}
		event:FireServer(A_1)
    end
end