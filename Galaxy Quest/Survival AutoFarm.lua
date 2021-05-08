repeat
	wait()
until game.Players.LocalPlayer.Character

--Check for game
if game.PlaceId == 2783554705 then 
	
	repeat
		wait()
	until game.ReplicatedStorage.Events:FindFirstChild("CreateCustomMatch")
	game.ReplicatedStorage.Events.CreateCustomMatch:FireServer("Single player", _G.Mode, _G.Map, "Survival")

else

	--Credits
	game.StarterGui:SetCore("SendNotification", {
	Title = "Made by Megumu#8008";
	Text = "Discord: 8JRAyM9";
	Icon = ""; 
	Duration = 20;
	})

	--Variable
	local player = game.Players.LocalPlayer

	--Wait for stuff to load
	repeat
		wait()
	until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

	--Create Platform
	local platform = Instance.new("Part", workspace)
	platform.Name = "Platform"
	platform.Position = Vector3.new(0, 0, 0)
	platform.Size = Vector3.new(math.huge, 100, math.huge)
	platform.Anchored = true
	platform.CanCollide = true

	--Loop Sword & NoClip
	game:GetService"RunService".RenderStepped:Connect(function()
		game.ReplicatedStorage.Events.FireWeapon:FireServer("StaffSword1", Vector3.new())
		game.ReplicatedStorage.Events.FireAbilityUse:InvokeServer(1)
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	--Lil wait
	wait(1)

	--Get Loot
	workspace.Entities.Drops.ChildAdded:Connect(function(drop)
		if drop:FindFirstChild("holder") and player.Character then 
			drop.holder.CFrame = player.Character.HumanoidRootPart.CFrame
		end
	end)

	--Get Lockers
	if _G.Lootables == true then 
		for i, v in ipairs(workspace.Entities.Lootables:GetChildren()) do 
			if player.Character then 
				player.Character.HumanoidRootPart.CFrame = v.CFrame
				wait(1.2)
			end
		end
	elseif _G.Lootables == false then
		local oldpos = player.Character.HumanoidRootPart.CFrame 
		wait()
		player.Character.HumanoidRootPart.CFrame = workspace:FindFirstChildOfClass("Part").CFrame
		wait(2)
		player.Character.HumanoidRootPart.CFrame = oldpos
	end

	--AutoFarm & AutoCollect
	while wait() do
		for i, child in ipairs(workspace.Live:GetChildren()) do 
			if child:FindFirstChild("Root") and child:FindFirstChild("NPCData") and child.NPCData:FindFirstChild("Health") then 
				local time = 120
				repeat
					if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Root") then 
						player.Character.HumanoidRootPart.CFrame = child.Root.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,-12.5,0)
						wait()
						time = time - 1
						player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					end
					wait()
				until child.NPCData.Health.Value <= 0 or time <= 0
			end
		end
	end
end