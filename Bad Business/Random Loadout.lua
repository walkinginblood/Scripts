game.Players.LocalPlayer.Leaderboard.Deaths.Changed:Connect(function()
	for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.MenuGui.Pages.Loadout.Tiles.Loadouts.RandomizeButton.MouseButton1Click)) do
		v:Fire()
	end
end)