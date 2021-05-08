local player = game.Players.LocalPlayer

if player.Character and player.Character:FindFirstChild("ingame") then
	player.Character.ingame:Destroy()
end