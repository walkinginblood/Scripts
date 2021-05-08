local hum = game.Players.LocalPlayer.Character.Humanoid
hum.Changed:Connect(function()
	hum.WalkSpeed = 40
end)