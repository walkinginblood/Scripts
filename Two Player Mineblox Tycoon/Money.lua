local descendants = workspace:GetDescendants()
local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
for index, descendant in pairs(descendants) do
	if descendant.Name == "Coin" and descendant:FindFirstChild("TouchInterest") then
		oldpos = plr.Position
		wait()
		plr.CFrame = CFrame.new(descendant.Position)
		wait()
		plr.CFrame = CFrame.new(oldpos)
	end
end
local children = workspace:GetChildren()
for i, child in ipairs(children) do
	if child.Name == "Collect reward! (7000 Cash)" then 
		plr.CFrame = CFrame.new(child.Head.Position)
	end
end