for i, v in pairs(workspace:GetChildren()) do 
	if v:IsA("Tool") and v.Handle then 
		v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end