--Find
function remote()
	for i, v in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
		if v:FindFirstChild("FF") then 
			return v
		end
	end
end

--Fire
for i, player in ipairs(game:GetService("Players"):GetPlayers()) do 
	if player.Character and player.Character:FindFirstChild("Humanoid") and player ~= game:GetService("Players").LocalPlayer then 
		remote().Donate:FireServer(_G.Currency, 100000)
	end
end