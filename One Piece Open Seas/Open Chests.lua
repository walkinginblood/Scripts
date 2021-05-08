local player = game.Players.LocalPlayer

for i,v in pairs(workspace:GetChildren()) do
	if string.find(v.Name:lower(), "chest") and v.Transparency ~= 1 and v:FindFirstChildOfClass("ClickDetector") then
		repeat
			if player.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.CFrame = v.CFrame
			end
			wait()
			if v:FindFirstChildOfClass("ClickDetector") then
				fireclickdetector(v:FindFirstChildOfClass("ClickDetector"), 1)
			end
		until v == nil or v.Parent == nil or v.Transparency == 1
	end
end