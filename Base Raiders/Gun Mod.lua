for i, child in ipairs(game.ReplicatedStorage.WeaponScripts.WeaponConfigs:GetChildren()) do 
	if child:IsA("ModuleScript") then 
		local gun = require(child)
		if gun.magSize then 
			gun.magSize = 100000
		end
		if gun.spreadAdd then 
			gun.spreadAdd = 0
		end
		if gun.minSpread then 
			gun.minSpread = 0
		end
		if gun.maxSpread then 
			gun.maxSpread = 0
		end
		if gun.fireMode then 
			gun.fireMode = 1
		end
		if gun.RPM then 
			gun.RPM = 20000
		end
		if gun.pellets then 
			gun.pellts = 100
		end
	end
end