_G.Range = math.huge

local player = game.Players.LocalPlayer

for i, v in pairs(workspace:GetDescendants()) do 
	if v.Name == "Zipline_Trigger" and v:FindFirstChild("TouchInterest") and v:IsA("Part") and player:DistanceFromCharacter(v.Position) < _G.Range then 
		v.CanCollide = false
		wait()
		v.CFrame = player.Character.HumanoidRootPart.CFrame
		print(v)
		return
	end
end