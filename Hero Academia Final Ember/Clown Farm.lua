-- Settings
_G.Settings = {
    Speed = 300;
    Distance = Vector3.new(0, 15, 0);
}

-- Variable
local player = game.Players.LocalPlayer

-- NoClip
Stepped = game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		player.Character.Humanoid:ChangeState(11)
	end)
end)

-- Grab
for i,v in pairs(workspace.Collectibles:GetChildren()) do
	click = v:FindFirstChild("ClickDetector")
	if v:IsA("Model") then
		v = v:FindFirstChildOfClass("Part")
		click = v.Parent.ClickDetector
	end
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.Position+_G.Settings["Distance"])/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.CFrame+_G.Settings["Distance"]}):Play()
	wait(player:DistanceFromCharacter(v.Position+_G.Settings["Distance"])/_G.Settings["Speed"])
	click_detector(click, 1)
end

-- End
Stepped:Disconnect()