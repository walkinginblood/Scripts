--Variable
local player = game.Players.LocalPlayer

--Hide
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") then 
	player.Character.Head.NameTag:Destroy()
end