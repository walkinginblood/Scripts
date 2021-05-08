while wait(0.25) do
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game:GetService("Players").LocalPlayer and v.Name ~= "KeIIiKing" then
			pcall(function()
				game.ReplicatedStorage.GunModule.RemoteEvent:FireServer(v.Character.Humanoid, 0)
			end)
		end
	end
end