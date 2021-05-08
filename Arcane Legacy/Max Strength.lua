--Variable
player = game:GetService("Players").LocalPlayer

--Check
function check()
	if player and player.Character and player.Character:FindFirstChild("Humanoid") and not player.Character:FindFirstChild("Combat") then
		player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChild("Combat"))
	end
end

--Farm
while wait() do 
	repeat check() wait() until player.Character:FindFirstChild("Combat")
	player.Character.Combat.FightingStyle:FireServer("Kick", false)
	player.Character.Combat.FightingStyle:FireServer("Punch", false)
end