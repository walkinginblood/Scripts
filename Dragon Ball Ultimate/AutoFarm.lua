--Settings
_G.Enabled = true --Toggle On/Off
_G.Settings = { --Settings
    Mob = "X Fighter"; --Target
    Quest = "X Fighter Trainer"; --Quest
	Distance = -2; --TP Distance
}

--Variable
local player = game:GetService("Players").LocalPlayer
local events = game:GetService("ReplicatedStorage").Events

--Get Settings
local function settings()
    for i, v in pairs(_G.Settings) do
        if i == "Mob" then
            Mob = v
        elseif i == "Quest" then
            Quest = v
		elseif i == "Distance" then 
			Distance = v
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

--Function
local function quest()
    if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= Quest then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[Quest].HumanoidRootPart.CFrame
		repeat
			wait()
			events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[Quest])
		until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == Quest
	end
end

--Start
settings()
quest()

--Loop
while _G.Enabled do
    for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
        if v.Name:lower() == Mob:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            repeat
                settings()
                player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + v.HumanoidRootPart.CFrame.lookVector * Distance
                wait()
                events.p:InvokeServer(1)
            until _G.Enabled == false or v == nil or v.Humanoid.Health <= 0
			quest()
        end
    end
    wait()
end