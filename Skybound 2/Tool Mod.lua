for index, descendant in pairs(game.Players.LocalPlayer.PlayerGui.PlayerSystem.ToolSystem.Modules:GetDescendants()) do
	if descendant:IsA("ModuleScript") and descendant.Name == "Config" then
		local tool = require(descendant)
		if typeof(tool) == "table" then 
			if tool.MinDamage then 
				tool.MinDamage = 100
			end
			if tool.MaxDamage then 
				tool.MaxDamage = 10000
			end
			if tool.HeadshotDamageMin then 
				tool.HeadshotDamageMin = 100
			end
			if tool.HeadshotDamageMax then 
				tool.HeadshotDamageMax = 10000
			end
			if tool.MaxCharges then 
				tool.MaxCharges = math.huge
			end
			if tool.Cooldown then 
				tool.Cooldown = 0
			end
			if tool.MinimumShipDamage then 
				tool.MinimumShipDamage = 100
			end
			if tool.MaximumShipDamage then 
				tool.MaximumShipDamage = 10000
			end
			if tool.ReloadTime then 
				tool.ReloadTime = 0
			end
			if tool.BlastRadius then 
				tool.BlastRadius = 100
			end
			if tool.MaxFuel then 
				tool.MaxFuel = math.huge
			end
			if tool.ConsumptionPerSecond then 
				tool.ConsumptionPerSecond = 0
			end
			if tool.MaxSpeed then 
				tool.MaxSpeed = 1000
			end
			if tool.RechargeDelay then 
				tool.RechargeDelay = 0
			end
			if tool.Ammo then 
				tool.Ammo = math.huge
			end
			if tool.MinSpread then 
				tool.MinSpread = 0
			end
			if tool.MaxSpread then 
				tool.MaxSpread = 0
			end
		end
	end
end