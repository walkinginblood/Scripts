local plr = game.Players.LocalPlayer

pcall(function()
	while wait() do
		for i, player in ipairs(game.Players:GetPlayers()) do 
			if player ~= plr and player.Character and player.Character:FindFirstChild("Head") and player.Team ~= plr.Team then 
				workspace.MangoNyah.Weapon.RemoteEvent:FireServer("HitPlayer", player.Character, false, player.Character.Head.Position)
			end
		end
	end
end)