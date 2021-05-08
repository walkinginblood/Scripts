-- Variable
local player = game.Players.LocalPlayer

-- Platform
local plat = Instance.new("Part")
plat.Size = Vector3.new(10, 1, 10)
plat.Parent = workspace
plat.Position = Vector3.new(math.random(-99999,99999), 25000, math.random(-99999,99999))
plat.Anchored = true
wait()
player.Character.HumanoidRootPart.CFrame = plat.CFrame+Vector3.new(0,5,0)

-- Loop
while wait() do
	if player:FindFirstChild("Backpack") then
		for i,v in pairs(player.Backpack:GetChildren()) do
			v.Parent = player.Character
		end
	end
	for i,v in pairs(player.Character:GetChildren()) do
		if v:IsA("Tool") then
			v:Activate()
		end
	end
end