for i, child in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
	if child:FindFirstChild("Ammo") then 
		child.Ammo.Value = math.huge
	end
end