for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "scroll" then
		v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end