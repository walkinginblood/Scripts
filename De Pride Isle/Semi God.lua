local player = game.Players.LocalPlayer
player.Character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
	game.ReplicatedStorage.Events.Damage:FireServer("FallDamage", "-"..player.Character.Humanoid.MaxHealth - player.Character.Humanoid.Health)
end)
