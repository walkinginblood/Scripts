--Find
function remote()
	for i, v in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
		if v:FindFirstChild("FF") then 
			return v
		end
	end
end

--Farm
repeat
	remote().SetStat:FireServer("EXP", 999999999, "math.random() is the best thing ever")
	wait()
until game:GetService("Players").LocalPlayer.bin.Level.Value == 200
print("Max level!")