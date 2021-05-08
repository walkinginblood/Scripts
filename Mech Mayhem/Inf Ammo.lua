local data = game:GetService("Players").LocalPlayer.localData

data.missileAmmo.Changed:Connect(function()
	data.missileAmmo.Value = 100
end)
data.laserAmmo.Changed:Connect(function()
	data.laserAmmo.Value = 100
end)
data.gunAmmo.Changed:Connect(function()
	data.gunAmmo.Value = 100
end)