local player = game:GetService("Players").LocalPlayer

while wait() do 
	if player.Character and player.Character:FindFirstChild("IsCreeper") and player.Character:FindFirstChild("CreeperType") and player.Character:FindFirstChild("Head") then
		if player.Character.CreeperType.Value == "Normal" then
			player.Character.Head:Destroy()
		else
			break
		end
	end
end