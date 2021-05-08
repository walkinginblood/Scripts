if PROTOSMASHER_LOADED and getwally then
	function getCook()
		for i,v in pairs(workspace.Job:GetChildren()) do
			if v.Cook.Value == game.Players.LocalPlayer.Name then
				return v
			end
		end
	end
	while true do
		local cook = getCook()
		ingred = 0
		if cook ~= nil then
			for i = 1, 2 do
				for _,k in pairs(cook.Display.Ingredients["ing"..i]:GetChildren()) do
					if k:IsA("ImageLabel") and k.ImageTransparency == 0 then
						fireclickdetector(cook.Ingredients[k.Name].ClickDetector, 1)
						ingred = ingred + 1
						wait(.1)
					end
				end
			end
			if ingred >= 3 then
				wait(.2)
				repeat
					fireclickdetector(cook.GetMoney.ClickDetector, 1)
					wait()
				until cook.Display.Burger.SurfaceGui.right.Visible == true or cook.Display.Burger.SurfaceGui.wrong.Visible == true
				repeat
					wait(.25)
				until cook.Display.Burger.SurfaceGui.right.Visible == false and cook.Display.Burger.SurfaceGui.wrong.Visible == false
				wait(.75)
				game.ReplicatedStorage.RemoteEvents.CheckInjury:FireServer("Deposit", game.Players.LocalPlayer.Data.Money.Value)
			end
		end
		wait(.1)
	end
else
	IB_CRASH()
end