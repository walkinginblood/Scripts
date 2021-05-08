pcall(function()
	local c = game.Players.LocalPlayer.Character.Armor:Clone()
	c.Parent = game.Players.LocalPlayer.Character.Armor.Parent
	game.Players.LocalPlayer.Character.Armor:Destroy()
end)