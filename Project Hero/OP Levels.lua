local player = game.Players.LocalPlayer

for i = 1, 10 do
	spawn(function()
		while wait() do 
			pcall(function()
				player.Character.Combat.Damage:FireServer(player.PlrStats.Stats.Money, nil, nil)
				if player.PlrStats.PlrInfo.Level.Value == 4000 then
					return
				end
			end)
		end
	end)
end

while wait() do
	local mobs = workspace.Mob:GetChildren()
	for i = 1, #mobs do local v = mobs[i]
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			repeat
				pcall(function()
					player.Character.Combat.Damage:FireServer(player.PlrStats.Stats.Melee, v.HumanoidRootPart, nil)
				end)
				wait()
			until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
		end
	end
end