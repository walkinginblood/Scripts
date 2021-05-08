--[[
    NPC List
    Mini Annihlator - Level 70
    Speed O Sound Sonic - Level 50
    Rogue Ninja - Level 30
    Gorilla Thug - Level 20
    Lion Thug - Level 20
    Strong Thug - Level 10
    Thug - Level 5
    Weak Thug - Level 1
]]

--Settings
_G.Enabled = true --Toggle On/Off
_G.Settings = {
    NPC = "Weak"; --Target NPC
	AutoQuest = true; --Toggle On/Off
    AutoStrength = true; --Automatically spend points in strength
    Delay = 0.5; --Delay between attacks
    Distance = -3; --TP Distance
    Speed = 100; --TP Speed
    Rotation = 90; --TP Rotation
}

--Variable
local player = game.Players.LocalPlayer

--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

--Click
local function click(part)
    if fireclickdetector then
        --Synapse
        fireclickdetector(part)
    elseif click_detector then
        --ProtoSmasher
        click_detector(part, 1)
    else
        game:GetService("Players").LocalPlayer:Kick("AutoQuest only works with Synapse X & ProtoSmasher")
        wait(3)
        while true do end
    end
end

--Quest
local function quest(name)
    for i, v in ipairs(workspace.Npcs:GetChildren()) do
        if string.find(v.Quest.MobName.Value:lower(), name:lower()) then
            return v
        end
    end
end

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then 
        player.Character.Humanoid:ChangeState(11)
    end
    if _G.Enabled == false then 
        Stepped:Disconnect()
    end
end)

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(workspace.Mobs:GetChildren()) do
		if _G.Enabled and string.find(v.Name:lower(), _G.Settings["NPC"]:lower()) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then 
			local newDistance = (v.HumanoidRootPart.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Attack
local function attack(class)
	local events = game.ReplicatedStorage.RemoteEvents
	if class:lower() == "ninja" then
		events.SS:FireServer(player.Backpack.LocalScript.Knockback2)
	else
        events.PH:FireServer("LeftHand", player.Backpack.LocalScript.Knockback2)
        wait(_G.Settings["Delay"])
		events.PH:FireServer("RightHand", player.Backpack.LocalScript.Knockback2)
    end 
    if _G.Settings["AutoStrength"] == true then
        game.ReplicatedStorage.RemoteEvents.AS:FireServer("Strength", 1)
    end
end

--Loop
while _G.Enabled do
    if _G.Settings["AutoQuest"] == true and not player:FindFirstChild("Quest") then
        local v = quest(_G.Settings["NPC"])
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, _G.Settings["Distance"], 0)}):Play()
        wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"])
        click(v.ClickDetector)       
    end
    local v = nearest(player.Character.HumanoidRootPart.Position)
    game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, _G.Settings["Distance"], 0)}):Play()
    wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"])
    repeat
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(_G.Settings["Rotation"]), 0, 0) + Vector3.new(0,_G.Settings["Distance"],0)
        end
        wait()
		attack(player.Class.Value)
    until _G.Enabled == false or v == nil or v.Parent == nil or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
	wait()
end