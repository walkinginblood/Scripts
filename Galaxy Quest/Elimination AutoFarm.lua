--Wait for stuff to load
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer.Character
wait(1)

if game.PlaceId == 2783554705 then

	game.ReplicatedStorage.Events.CreateCustomMatch:FireServer("Single player", _G.Mode, "Keplar Mining Base", "Elimination")

else

	--Variables
	local Stepped
	local plooers = game:GetService("Players")
	local player = plooers.LocalPlayer
	local humpart = plooers.LocalPlayer.Character.HumanoidRootPart
	local work = game:GetService("Workspace")
	local enemies = work.Live

	--Credits
	game.StarterGui:SetCore("SendNotification", {
		Title = "Made by Megumu#8008";
		Text = "Discord: 8JRAyM9";
		Icon = "";
		Duration = 20;
	})

	--Find Enemy
	local function FindEnemy()
		enemy = enemies:FindFirstChildOfClass("Model")
		if enemy and enemy:FindFirstChild("NPCData") and enemy.NPCData.Health.Value > 0 then
			print("Found")
		elseif enemy.Name == "DSythe" then 
			print("Found Boss")
		else
			enemy:Destroy()
			wait()
			FindEnemy()
		end
	end

	--Attack
	local function Attack()
		game.ReplicatedStorage.Events.FireWeapon:FireServer("StaffSword1", Vector3.new())
	end

	--NoClip
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	--Start
	for i = 1, 10 do
		local loot = workspace.Entities.Lootables:FindFirstChildOfClass("UnionOperation") or workspace.Entities.Lootables:FindFirstChildOfClass("Part")
		if loot then 
			plooers.LocalPlayer.Character.HumanoidRootPart.CFrame = loot.CFrame
			wait(0.15)
			loot:Destroy()
			wait()
		else
			game:GetService("TeleportService"):Teleport(2783554705, game.Players.LocalPlayer)
		end
	end

	--Kill Enemy
	repeat
		if player.Character then
			FindEnemy()
			wait()
			local Time = 300
			repeat
				humpart.CFrame = enemy.Root.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,-12.5,0)
				wait()
				Attack()
				Time = Time - 1
			until enemy.NPCData.Health.Value <= 0 or Time <= 0
		end
		wait()
	until work.Live:FindFirstChild("DSythe")

	--Boss
	local BOSS = work.Live:FindFirstChild("DSythe")

	--Kill Boss
	repeat
		humpart.CFrame = BOSS.Root.CFrame * CFrame.new(Vector3.new(0, 0, math.random(8)))
		Attack()
		wait()
	until BOSS.NPCData.Health.Value <= 0

	--Disable NoClip
	Stepped:Disconnect()

	--GET THE LOOT
	while wait() do
		for i, child in ipairs(workspace.Entities.Drops:GetChildren()) do
			if child:FindFirstChild("holder") and player.Character then
				humpart.CFrame = child.holder.CFrame
				wait()
			end
		end
	end
end