_G.Collect = true --ProtoSmasher / Synapse X ONLY
_G.NPCs = { --Target list
	[1] = "Goblin",
	[2] = "Minotaur",
	[3] = "Boss",
}

--Variable
local player = game:GetService("Players").LocalPlayer

--Find
local function find()
	for i, child in ipairs(game:GetService("Workspace"):GetChildren()) do
		for i, v in pairs(_G.NPCs) do  
			if string.find(child.Name, v) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChildOfClass("Humanoid") and child:FindFirstChildOfClass("Humanoid").Health > 0 then  
				return child
			end
		end
	end
end

--Click
local function click(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		game:GetService("Players").LocalPlayer:Kick("Synapse X & ProtoSmasher ONLY")
		wait()
		while true do end
	end
end
--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then 
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
	if _G.Enabled == false then 
		Stepped:Disconnect()
	end
end)

--Farm
while _G.Enabled do
	local enemy = find()
	if enemy ~= nil then 
		repeat
			if enemy ~= nil then 
				enemy.HumanoidRootPart.Anchored = true
				wait()
				enemy.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame  CFrame.new(Vector3.new(0, 0, 5))
				game:GetService("ReplicatedStorage").InventoryEvents.Events.WeaponDmg:FireServer()
			end
			wait()
		until enemy:FindFirstChildOfClass("Humanoid").Health <= 0
	end
	if _G.Collect then 
		for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do 
			if v:FindFirstChild("ClickDetector") then 
				click(v.ClickDetector)
			end
		end
	end
end