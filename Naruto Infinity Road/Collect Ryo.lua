--Get Current Cash
for i, v in ipairs(game:GetService("Workspace")["Ryo on ground"]:GetChildren()) do 
	if v:FindFirstChild("TouchInterest") then 
		v.CanCollide = false
		v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end

--Get New Cash
game:GetService("Workspace")["Ryo on ground"].ChildAdded:Connect(function(v)
	repeat wait() until v:FindFirstChild("TouchInterest")
	v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
end)