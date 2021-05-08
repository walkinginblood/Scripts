--Loop
while wait() do
	--Variable
	local RS = game:GetService("ReplicatedStorage")
	local players = game:GetService("Players")
	local player = players.LocalPlayer

	--Script
	for i, v in ipairs(players:GetPlayers()) do 
		if v ~= player and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
			for index, child in ipairs(player.Backpack.ExeCarry:GetChildren()) do 
				if child:IsA("RemoteEvent") then 
					child:FireServer(v.Character)
				end
			end
		end
	end
end