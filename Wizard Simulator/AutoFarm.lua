_G.Enabled = true --Toggle On/Off
_G.Settings = { --Settings
    Speed = 20; --TP Speed
    Distance = 15; --TP Distance
    MinMana = 3; --When you want to recharge
}

--Variable
local player = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")

--Get Settings
function settings()
    for i, v in pairs(_G.Settings) do
        if i == "Speed" then
            Speed = v
        elseif i == "MinMana" then
            MinMana = v
        elseif i == "Distance" then
            Distance = v
        end
    end
end

--Load Settings
settings()

--Restore
function restore()
    game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(workspace.Levels.Forest.SpawnPoint.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = workspace.Levels.Forest.SpawnPoint.CFrame}):Play()
    wait(player:DistanceFromCharacter(workspace.Levels[player.Level.Value].SpawnPoint.Position)/Speed)
    repeat
        wait()
    until player.Mana.Value == player.MaxMana.Value
end

--NoClip
Stepped = game:GetService("RunService").Stepped:connect(function()
    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
    end
    if _G.Enabled == false then
        Stepped:Disconnect()
    end
end)

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(game:GetService("Workspace").Levels[player.Level.Value].Enemies:GetChildren()) do
		if _G.Enabled and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and v.Health.Value > 0 then 
			local newDistance = (v.HumanoidRootPart.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--Farm
while _G.Enabled do
    local target = nearest(player.Character.HumanoidRootPart.Position)
    if target == nil then
        return
    end
    settings()
    game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(target.HumanoidRootPart.Position)/Speed, Enum.EasingStyle.Linear), {CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0, Distance, 0)}):Play()
    wait(player:DistanceFromCharacter(target.HumanoidRootPart.Position)/Speed)
    repeat wait()
        player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,Distance,0)
        RS.Remote.CastSpell:FireServer(1, target)
        RS.Remote.CastSpell:FireServer(2, target)
        if player.Mana.Value <= MinMana then
            restore()
        end
    until target == nil or target.Health.Value <= 0 or _G.Enabled == false
    wait()
end