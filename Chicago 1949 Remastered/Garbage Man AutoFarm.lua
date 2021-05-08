_G.Enabled = true

--Variable
local player = game.Players.LocalPlayer

--Clicky
function clicky(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then 
		clic_detector(part, 1)
	else
		player:Kick("Get S^X or ProtoSmasher")
		wait(5)
		while true do end
	end
end

--Check
function check()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then 
		return true
	else
		return false
	end
end

--Apply
game.ReplicatedStorage.EVENTS.NETWORKING:FireServer("JobApp", "Garbage Man")

while _G.Enabled == true do 
	wait()
	for i, child in ipairs(workspace.PROXIMITY:GetChildren()) do
		if child.Name == "Garbage Man" and check() then 
			player.Character.HumanoidRootPart.CFrame = child.CFrame
			wait(0.1)
			clicky(child.ClickDetector)
			wait()
		end
	end
	wait(0.5)
	player.Character.HumanoidRootPart.CFrame = workspace.PROXIMITY2.ATM.CFrame
	wait(0.1)
	game.ReplicatedStorage.EVENTS.NETWORKING:FireServer("Deposit", 100)
end