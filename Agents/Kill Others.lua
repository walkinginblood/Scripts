local plr = game.Players.LocalPlayer

pcall(function()
	if plr.Character and plr.Character:FindFirstChild("Humanoid") and not plr.Character:FindFirstChild("Net Gun") then 
		plr.Character.Humanoid:EquipTool(plr.Backpack["Net Gun"])
	end
	wait(0.5)
	for i, player in ipairs(game.Players:GetPlayers()) do 
		if plr ~= player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Head") then 
			game.Players.LocalPlayer.Character["Net Gun"]["GunScript_Server"].InflictTarget:FireServer(player.Character.Humanoid, player.Character.Head, math.huge, Vector3.new(), 0, 0, false)
		end
	end
end)