local name = game.Players.LocalPlayer.PlayerGui.HUD.Screen.PetsView.Left.PetSell:FindFirstChild("Name")
name.Changed:Connect(function()
	if name.Text ~= "Montu" then
		button = game.Players.LocalPlayer.PlayerGui.HUD.Screen.PetsView.Left.SellButton
		for i,v in pairs(getconnections(button.Activated)) do 
			v:Fire()
		end
		wait(0.1)
		for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.HUD.Screen.SellPrompt.ImageLabel.SellBtn.Activated)) do
			v:Fire()
		end
	end
end)