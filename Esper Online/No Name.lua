local player = game.Players.LocalPlayer

--No Name
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("Bar") then 
	player.Character.Head.Bar:Destroy()
end