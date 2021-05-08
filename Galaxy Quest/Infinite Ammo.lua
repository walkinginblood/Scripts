for i, child in ipairs(game.Players.LocalPlayer.PlayerGui.CustomBackpack.LocalWeaponHandle:GetChildren()) do
	if child:IsA("ModuleScript") then 
		local gun = require(child)
		if gun.Config.MaxAmmo then 
			gun.Config.MaxAmmo = math.huge
		end
		if gun.Config.Ammo then 
			gun.Config.Ammo = math.huge
		end
	end
end