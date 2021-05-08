plr = game.Players.LocalPlayer

local children = workspace:GetChildren()
for i, child in ipairs(children) do
	if child:IsA("Model") and child:FindFirstChild("Owner") and child.Owner.Value == plr then
		local oldpos = plr.Character.HumanoidRootPart.Position
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(child.Well.AnimalBlock.Position)
		wait(0.2)
		game.ReplicatedStorage.UseItem:FireServer(child.Well)
		wait()
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos)
	end
end