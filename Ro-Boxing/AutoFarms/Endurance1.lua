--Player1
local ring = workspace.Spar_Ring2
local player = game.Players.LocalPlayer

while wait() do
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and ring.Ring_Empty.Value == true then 
		player.Character.HumanoidRootPart.CFrame = ring.Player1_Button.CFrame
		wait(0.5)
	else
		repeat
			if game.Players:FindFirstChild(ring.P2_Name.Value) then
				enemy = game.Players:FindFirstChild(ring.P2_Name.Value)
			end
			if enemy ~= nil and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.CFrame = enemy.Character.HumanoidRootPart.CFrame
				wait(0.25)
				game:GetService("ReplicatedStorage")["Punch_Input_Spar_Ring2"]:FireServer("Jab")
			end
			wait()
		until ring.Ring_Empty.Value == true
		wait()
	end
end

--YEET--

--Player2
local ring = workspace.Spar_Ring2
local player = game.Players.LocalPlayer

while wait() do
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and ring.Ring_Empty.Value == true then 
		player.Character.HumanoidRootPart.CFrame = ring.Player2_Button.CFrame
		wait(0.5)
	end
end