--[[
    Tainted Spirit - "Exorcise the Tainted Spirits in the woods."
]]

_G.Enabled = true; --Toggle On/Off
_G.Settings = { --Settings
	NPC = "snowcreature"; --Target
	Distance = -3; --TP Distance
	Quest = "SnowCreatures"; --Quest
	Weapon = "SOUL"; --Weapon Name
	Speed = 200; --TP Speed
}

--Variable
local events = game.ReplicatedStorage.Remotes.Client
local player = game.Players.LocalPlayer

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(workspace:GetChildren()) do
		if _G.Enabled and string.find(v.Name:lower(), _G.Settings["NPC"]:lower()) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
			local newDistance = (v.HumanoidRootPart.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Loop & TP
while _G.Enabled do
	--Get Nearest
	repeat
		v = nearest(player.Character.HumanoidRootPart.Position)
		wait(0.1)
	until v ~= nil

	--TP
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame}):Play()
	wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"])

	--Farm
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + v.HumanoidRootPart.CFrame.lookVector * _G.Settings["Distance"]
		player.Character[_G.Settings["Weapon"]].WeaponHandle.RemoteEvent:FireServer("SwordClick", 4)
	end
	wait()
end