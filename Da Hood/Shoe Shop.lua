--Settings
_G.Enabled = true --Toggle On/Off
_G.Settings = {
    Distance = -7; --TP Distance
    Speed = 40; --TP Speed
}

--Variable
local player = game:GetService("Players").LocalPlayer

--Get Settings
local function settings()
	for i, v in pairs(_G.Settings) do 
		if i == "Distance" then 
			Distance = v
        elseif i == "Speed" then
            Speed = v
		end
	end
end

--Click Function
local function click(part)
	if fireclickdetector then
		--Synapse
		fireclickdetector(part)
	elseif click_detector then
		--ProtoSmasher
		click_detector(part, 1)
	else
		game:GetService("Players").LocalPlayer:Kick("S^X & ProtoSmasher ONLY")
		wait(0.25)
		while true do end
	end
end

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(workspace.Ignored.Drop:GetChildren()) do
		if _G.Enabled and v:IsA("MeshPart") and v:FindFirstChild("ClickDetector") then 
			local newDistance = (v.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Get Shoe
local function getshoe()
	local v = nearest(player.Character.HumanoidRootPart.Position)
	if v == nil then
		wait(0.5)
		getshoe()
	end
	return v
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

--Load Settings
settings()

--Loop
while _G.Enabled do
	wait()
	repeat
		v = getshoe()
		wait(0.25)
	until v ~= nil
	settings()
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = v.CFrame + Vector3.new(0, Distance, 0)}):Play()
	wait(player:DistanceFromCharacter(v.Position)/Speed)
	click(v.ClickDetector)
	local v = workspace.Ignored["Clean the shoes on the floor and come to me for cash"].HumanoidRootPart
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = v.CFrame + Vector3.new(0, Distance, 0)}):Play()
	wait(player:DistanceFromCharacter(v.Position)/Speed)
	click(v.Parent.ClickDetector)
end