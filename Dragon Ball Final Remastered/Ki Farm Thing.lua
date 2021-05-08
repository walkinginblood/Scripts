for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "Saibaman" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
		spawn(function()
			repeat
				pcall(function()
					if v.Humanoid.Health > 0 then
						local tab = 
						{
							[1] = "KiBlastCharge", 
							[2] = "Fire", 
							[3] = v.HumanoidRootPart.CFrame, 
							[4] = Vector3.new(v.HumanoidRootPart.Position)
						}
						game.ReplicatedStorage.Remotes.KiBlasts:InvokeServer(tab)
					end
				end)
			until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
		end)
	end
end