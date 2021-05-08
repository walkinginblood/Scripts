for i = 1, 3 do
    game.StarterGui:SetCore("SendNotification", {
        Title = "Made by Megumu";
        Text = "";
        Icon = "";
        Duration = 5;
    })
end

-- Fire
function fire(...)
	if not game.ReplicatedStorage:FindFirstChild("remoteEvent") then
        ni = getnilinstances()
		for i = 1, #ni do local event = ni[i]
		    if event:IsA("RemoteEvent") and event.Name == "remoteEvent" then
		    	event.Parent = game.ReplicatedStorage
	    		event:FireServer(...)
		    end
		end
	else
		game.ReplicatedStorage.remoteEvent:FireServer(...)
	end
end

-- Bonk
for i = 1, 5 do
	spawn(function()
		while true do
            local npcs = workspace.NPCs:GetChildren()
			for i = 1, #npcs do local v = npcs[i]
				if pcall(function() return v.Health.Value, v.MaxHealth.Value, v:FindFirstChildOfClass("Humanoid").Health end) and v.Health.Value > 0 and v:FindFirstChildOfClass("Humanoid").Health > 0 then
					repeat
						wait()
			            fire(game.Players.LocalPlayer, "hit", v, false)
					until v == nil or v.Parent == nil or not v:FindFirstChild("Health") or not v:FindFirstChildOfClass("Humanoid") or v.Health.Value <= 0 or v:FindFirstChildOfClass("Humanoid").Health <= 0
				end
			end
			wait()
		end
	end)
end