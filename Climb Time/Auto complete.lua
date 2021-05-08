--Variable
local player = game.Players.LocalPlayer

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

--TP
for i, v in ipairs(workspace.Map:GetChildren()) do 
	if v.Name == "FirstSegment" and player.CheckPoint.CurrentStage.Value == 0 then
		repeat
			player.Character.HumanoidRootPart.CFrame = v.start.CFrame + Vector3.new(0, math.random(1, 5), 0)
			wait()
		until tostring(player.CheckPoint.CurrentStage.Value) == "1"
	elseif v.Name == tostring(player.CheckPoint.CurrentStage.Value + 1) and v:FindFirstChild("start") and v.start:IsA("Part") then 
		repeat
			player.Character.HumanoidRootPart.CFrame = v.start.CFrame + Vector3.new(0, math.random(1, 5), 0)
			wait()
		until v.Name == tostring(player.CheckPoint.CurrentStage.Value)
	elseif v.Name == "End" and player.CheckPoint.CurrentStage.Value == 10 then
		player.Character.HumanoidRootPart.CFrame = v["stop"].CFrame + Vector3.new(0, math.random(1, 5), 0)
	end
end

--Stop NoClip
Stepped:Disconnect()