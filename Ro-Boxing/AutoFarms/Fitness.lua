--Settings
_G.Enabled = true --Toggle On/Off

--Variable
local player = game.Players.LocalPlayer

--Find Pool
for i, child in ipairs(workspace:GetChildren()) do 
	if child:FindFirstChild("ting1") then 
		POOL1 = child.ting1
	end
	if child:FindFirstChild("ting2") then 
		POOL2 = child.ting2
	end
end

--Loop
while _G.Enabled do
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
		POOL1.CFrame = player.Character.HumanoidRootPart.CFrame
		POOL2.CFrame = player.Character.HumanoidRootPart.CFrame
		player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0.01, 0)
	end
	wait()
end