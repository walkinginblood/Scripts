for i, child in ipairs(workspace:GetChildren()) do 
	if child.Name == "Ring" and child:FindFirstChild("Handle") then 
		child.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end
wait(1)
for i, child in ipairs(workspace:GetChildren()) do 
	if child.Name == "Amulet" and child:FindFirstChild("Handle") then 
		child.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end