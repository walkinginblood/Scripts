pcall(function()
	game.Players.LocalPlayer.Character.Stats.Defense:Clone().Parent = game.Players.LocalPlayer.Character.Stats
	game.Players.LocalPlayer.Character.Stats.Defense:Destroy()
end)