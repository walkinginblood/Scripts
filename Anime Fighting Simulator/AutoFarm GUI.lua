-- Settings
getgenv().Settings = {
    NPC = "Zombie", -- Target NPC
    Type = "Weapon", -- Weapon or Meister [Case Sensitive]
    Speed = 70, -- TP Speed
    Rotation = -90, -- TP Rotation
    Distance = 13, -- TP Distance
    Souls = false, -- Automatically collect souls, roblox window needs to be focused while using this
	Skills = { -- Auto Skill
		Q = true,
		E = false,
		F = false
	}
}

-- Variable
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
	player.Character.Humanoid:ChangeState(11)
end)

-- Find Nearest
function nearest()
	local Closest
    local Distance = math.huge
    local shit = workspace.NPCS:GetChildren()
    for i = 1, #shit do local v = shit[i]
        local v = v:FindFirstChildOfClass("Model")
        if pcall(function() return v.HumanoidRootPart,v.Humanoid,v.Aggro end) and string.find(v.Name:lower(), getgenv().Settings.NPC:lower()) and v.Humanoid.Health > 0 then
            local newDistance = player:DistanceFromCharacter(v.HumanoidRootPart.Position)
            if newDistance < Distance then
                Closest = v
                Distance = newDistance
            end
        end
    end
	return Closest
end

-- Aim At
function aimAt(vector)
    if completeStop then return end
    local newpos = workspace.CurrentCamera:WorldToScreenPoint(vector)
    mousemoverel((newpos.X - mouse.X), (newpos.Y - mouse.Y))
end

-- Auto Quest
function quest()
    -- Variables
    local npcName = getgenv().Settings.NPC:lower()
    local near = false
    local questName

    -- Quest Check
    if string.find("blademaster", npcName) then
        near = workspace.NPCS.Quests.BurnedTunafishDog.HumanoidRootPart
        questName = "Blademaster"
    end
    if string.find("psychopath", npcName) then
        near = workspace.NPCS.Quests.PoliceQuest.HumanoidRootPart
        questName = "Psychopath"
    end
    if string.find("zombie", npcName) then
        near = workspace.NPCS.Quests.ZombieQuest.HumanoidRootPart
        questName = "Zombie"
    end
    if string.find("meister", npcName) then
        near = workspace.NPCS.Quests.Chrona.HumanoidRootPart
        questName = "Meister"
    end

    -- Get Quest
    if typeof(near) == "Instance" and player[getgenv().Settings.Type .."stats"].Quest.Value ~= questName then
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(near.Position)/getgenv().Settings.Speed, Enum.EasingStyle.Linear), {CFrame = near.CFrame}):Play()
        wait(player:DistanceFromCharacter(near.Position)/getgenv().Settings.Speed)
        game.ReplicatedStorage.Remotes.Quest:FireServer(questName, near.Parent.Detect)
    end
end

-- Farm
while wait() do
    local near = nearest()
    if typeof(near) == "Instance" then
        quest()
        local near = near.HumanoidRootPart
        repeat
            if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player:DistanceFromCharacter(near.Position) < 25 then
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(near.Position) * CFrame.Angles(math.rad(getgenv().Settings.Rotation), 0, 0) + Vector3.new(math.random(-5,5),getgenv().Settings.Distance,0)
                    for _,k in pairs(getgenv().Settings.Skills) do
                        if k then
                            game.ReplicatedStorage.Remotes.KeyEvent:FireServer(_, "\240\159\152\153\240\159\152\153\240\159\152\161\240\159\152\173\240\159\152\173\240\159\152\173\240\159\152\173\240\159\164\160", "Down")
                        end
                    end
                    game.ReplicatedStorage.Remotes.KeyEvent:FireServer("Up", near.CFrame, "\240\159\152\153\240\159\152\153\240\159\152\161\240\159\152\173\240\159\152\173\240\159\152\173\240\159\152\173\240\159\164\160", "Down")
                end)
            elseif player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                pcall(function()
                    game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(near.Position)/getgenv().Settings.Speed, Enum.EasingStyle.Linear), {CFrame = near.CFrame}):Play()
                    wait(player:DistanceFromCharacter(near.Position)/getgenv().Settings.Speed)
                end)
            end
            wait()
        until not pcall(function() return near.Parent.Humanoid end) or near.Parent.Humanoid.Health <= 0
        if getgenv().Settings.Souls then
            repeat
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = workspace.KeishenEgg.Part.CFrame + Vector3.new(0, 5, 0)
                    aimAt(workspace.KeishenEgg.Part.Position)
                    mouse2click()
                end)
                wait()
            until not workspace:FindFirstChild("KeishenEgg")
        end
    end
end