--Settings
_G.Amount = 2000000000
_G.Currency = "Lamina" --Lamina | Aurem

--Find
function remote()
	for i, v in ipairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
		if v:FindFirstChild("FF") then 
			return v
		end
	end
end

--Fire
remote().SetStat:FireServer(_G.Currency, _G.Amount, "math.random() is the best thing ever")