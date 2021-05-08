pcall(function()
	local char = game.Players.LocalPlayer.Character
	local clone = char.fakehealth:Clone()
	char.fakehealth:Destroy()
	clone.Parent = char
end)