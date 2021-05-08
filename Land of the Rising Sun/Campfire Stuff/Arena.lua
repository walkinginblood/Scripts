local root = game.Players.LocalPlayer.Character.HumanoidRootPart
local event = workspace.Remotes.placerSystem.placeLogEvent
for e = -30, 30, 4 do
    --for i = -2, 2, 2 do
		local A_1 = 
		{
            [1] = root.CFrame*CFrame.new(e,0,-30)+Vector3.new(0,i,0), 
            [2] = "Pine Log"
		}
		event:FireServer(A_1)
    --end
end
for e = -30, 30, 4 do
    --for i = -2, 2, 2 do
		local A_1 = 
		{
            [1] = root.CFrame*CFrame.new(e,0,30)+Vector3.new(0,i,0), 
            [2] = "Pine Log"
		}
		event:FireServer(A_1)
    --end
end
for e = -30, 30, 4 do
    --for i = -2, 2, 2 do
        local A_1 = 
        {
            [1] = root.CFrame*CFrame.new(-30,0,e)-Vector3.new(0,i,0), 
            [2] = "Pine Log"
        }
        event:FireServer(A_1)
    --end
end
for e = -30, 30, 4 do
    --for i = -2, 2, 2 do
        local A_1 = 
        {
            [1] = root.CFrame*CFrame.new(30,0,e)-Vector3.new(0,i,0), 
            [2] = "Pine Log"
        }
        event:FireServer(A_1)
    --end
end