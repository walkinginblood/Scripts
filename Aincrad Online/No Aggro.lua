pcall(function()
	local char = game.Players.LocalPlayer.Character
	local clone = char.IsPlayer:Clone()
	char.IsPlayer:Destroy()
	clone.Parent = char
end)