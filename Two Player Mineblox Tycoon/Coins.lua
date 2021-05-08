while wait() do
	local descendants = workspace:GetDescendants()
	local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
	for index, descendant in pairs(descendants) do
		if descendant.Name == "Coin" and descendant:FindFirstChild("TouchInterest") then
			descendant.CFrame = CFrame.new(plr.Position)
		end
	end
end