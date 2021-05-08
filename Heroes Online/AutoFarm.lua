--[[
	Quest List

	-Hero-
	UAStudent (Level 1-20)
	Hooligans (Level 15-40)
	Thugs (Level 30-70)

	-Villain-
	Policemen (Level 1-20)
	HosuCaptains (Level 15-40)
	NaturiaGuards (Level 30-70)
	ArmedPolice (Level 60-85)
	HosuKnights (Level 80-100)
]]

--Settings
_G.Enabled = true --Toggle On/Off
_G.Settings = {
	AutoQuest = "Thugs"; --Which quest you want to farm
	Speed = 100; --TP Speed
	Distance = 4.5; --TP Distance
	Rotation = -90 --TP Rotation
	Attempts = 120; --Number of attacks it will perform before force switching to another target, to prevent getting stuck
}

--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")

--Get Settings
function settings()
	for i, v in pairs(_G.Settings) do
		if i == "AutoQuest" then
			AutoQuest = v:lower()
		elseif i == "Speed" then
			Speed = v
		elseif i == "Distance" then
			Distance = v
		elseif i == "Attempts" then
			Attempts = v
		elseif i == "Rotation" then
			Rotation = v
		end
	end
end

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
	if _G.Enabled == false and Stepped then 
		Stepped:Disconnect()
	end
end)

--Crash Client
function crash(message)
	game:GetService("Players").LocalPlayer:Kick(message)
	wait(0.25)
	while true do end
end

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(work:GetChildren()) do
		if _G.Enabled and string.find(v.Name, player.Quest.TargetType.Value) and v:FindFirstChild("Settings") and v.Settings:FindFirstChild("FakeHealth") and v.Settings.FakeHealth.Value > 0 and v:FindFirstChild("HumanoidRootPart") then 
			local newDistance = (v.HumanoidRootPart.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v.HumanoidRootPart
				Distance = newDistance
			end
		end
	end
	return Closest
end

--AutoQuest
function autoquest()
	--Find Quest
	if AutoQuest == "policeman" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 20 then
			mission = "99"
			wait()
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "uastudent" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 20 then
			mission = "1"
			wait()
		else
			print("Too high level for this quest")
			return
		end	
	elseif AutoQuest == "hosucaptains" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 40 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 14 then
				print("Too low level for this quest")
				return
			else
				mission = "98"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "naturiaguards" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 70 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 30 then
				print("Too low level for this quest")
				return
			else
				mission = "97"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "armedpolice" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 85 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 60 then
				print("Too low level for this quest")
				return
			else
				mission = "96"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "hosuknights" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 100 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 80 then
				print("Too low level for this quest")
				return
			else
				mission = "95"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "hooligans" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 40 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 15 then
				print("Too low level for this quest")
				return
			else
				mission = "2"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	elseif AutoQuest == "thugs" then
		if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 70 then
			if tonumber(player.PlayerGui.GameGui.MainFrame.HUD.Level.Text) <= 30 then
				print("Too low level for this quest")
				return
			else
				mission = "3"
				wait()
			end
		else
			print("Too high level for this quest")
			return
		end
	else
		crash("Invalid Quest")
	end
	--TP & Accept
	for i, v in ipairs(work:GetChildren()) do
		if v:FindFirstChild("Settings") and v.Settings:FindFirstChild("MissionNumber") and v.Settings.MissionNumber.Value == tonumber(mission) then
			game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, Distance, 0)}):Play()
			wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/Speed)
			RS.Events.DataEvent:FireServer("InitiateQuest", mission)
		end
	end
end

--AutoFarm
while _G.Enabled do
	--Load Settings
	settings()
	--Quest
	if player.Quest.TargetType.Value == "" then
		autoquest()
		wait()
	end
	--Find
	local target = nearest(player.Character.HumanoidRootPart.Position)
	if target == nil then 
		return
	end
	--TP
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(target.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = target.CFrame + Vector3.new(0, Distance, 0)}):Play()
	wait(player:DistanceFromCharacter(target.Position)/Speed)
	--Kill
	local try = Attempts
	repeat
		for i = 0, 3 do
			if target.Parent ~= nil then
				player.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.Angles(math.rad(Rotation), 0, 0) + Vector3.new(0,Distance,0)
				wait() 
				RS.Events.DataEvent:FireServer("Melee", target.Parent.Name, i, 1)
			end
			wait()
		end
		wait()
		try = try - 1 
	until try <= 0 or target == nil or target.Parent == nil or target.Parent.Settings.FakeHealth.Value <= 0 or _G.Enabled == false 	
end