while wait(10) do
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Character.Kit.Weapon.Stats:GetChildren()) do
			if string.find(v.Name:lower(), "spread") then
				v.Value = 0
			end
		end
	end)
end