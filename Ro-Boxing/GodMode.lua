local player = game.Players.LocalPlayer
if player.Character and player.Character:FindFirstChild("Defense") then
	player.Character.Defense:Destroy()
end