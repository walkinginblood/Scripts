--[[
	Made by Megumu/Mommy Mango
	<3
]]


local player = game.Players.LocalPlayer

if player.Character and player.Character:FindFirstChild("Kit") and player.Character.Kit:FindFirstChild("Stats") then 
	if player.Character.Kit.Stats:FindFirstChild("Health") then
		player.Character.Kit.Stats.Health:Destroy()
	end
	if player.Character.Kit.Stats:FindFirstChild("Shield") then 
		player.Character.Kit.Stats.Shield:Destroy()
	end
end