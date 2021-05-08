local player = game.Players.LocalPlayer

pcall(function()
	local cl = player.Character.Humanoid.Stats.BaseArmor:Clone()
	player.Character.Humanoid.Stats.BaseArmor:Destroy()
	cl.Parent = player.Character.Humanoid.Stats
end)