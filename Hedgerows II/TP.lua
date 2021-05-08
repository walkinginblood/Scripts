local player = game.Players.LocalPlayer
while wait() do
	for i,v in pairs(game.Players:GetPlayers()) do
		if v ~= player and v.Team ~= player.Team then
			pcall(function()
				v.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
			end)
		end
	end
end