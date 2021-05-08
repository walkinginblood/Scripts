local player = game.Players.LocalPlayer

while wait() do
	if player.Character and player.Character:FindFirstChild("Health") then
		player.Character.Health:Destroy()
	end
end