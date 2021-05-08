--ProtoSmasher Compatible
if PROTOSMASHER_LOADED then
    getgenv().mouse1click = Input.LeftClick
    getgenv().newcclosure = protect_function
    getgenv().fireclickdetector = click_detector
end

--Settings
getgenv().AutoStrength = true;
getgenv().Skills = {
    [1] = true;
    [2] = true;
    [3] = true;
    [4] = false;
}

--Wait for loading
repeat wait() until game:GetService("Players") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
wait(5)

--Variable
local player = game.Players.LocalPlayer
local timer = 1
Stepped = nil -- Place Holder
getgenv().Key = "egg"
getgenv().Loaded = false

--Auto Rejoin | MADE BY PEPSI <3
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(2066381781, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(2066381781, game:GetService("Players").LocalPlayer))
end)

--Check
local function check(v)
    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
        return true
    else
        return false
    end
end

--Timer
spawn(function()
    local timer = 0
    repeat
        timer = timer + 1
        wait()
        print(timer)
        if getgenv().Loaded then
            return
        end
    until timer >= 1000
    game:GetService("TeleportService"):Teleport(3382113885, game.Players.LocalPlayer)
end)

--Dungeon Timer
spawn(function()
    local timer = 0
    repeat
		timer = timer + 1
		wait(1)
	until timer >= 120
    game:GetService("TeleportService"):Teleport(3382113885, game.Players.LocalPlayer)
end)

--Click Part
local function click(part)
    if fireclickdetector then
        --Synapse X
        fireclickdetector(part)
    elseif click_detector then
        --ProtoSmasher
        click_detector(part, 1)
    else
        --Garbage
        player:Kick("no")
        wait()
        while true do end
        repeat until nil
    end
end

--Game Check
if game.PlaceId ~= 3850289901 then
    game:GetService("TeleportService"):Teleport(3850289901, game.Players.LocalPlayer)
    return
else
    repeat
        wait()
    until check(player.Character) and workspace:FindFirstChild("BeginPart") and workspace.BeginPart:FindFirstChild("ClickDetector")
    click(workspace.BeginPart.ClickDetector)
    repeat wait() until not workspace:FindFirstChild("BeginPart")
end

--NoClip
local function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

--Check For Weapon
if not player.Character:FindFirstChild("Weapon") then
    player.Character.CombatV1.Equip:FireServer()
end

--Get Remote Key
local mt = getrawmetatable(game)
make_writeable(mt)
local old = mt.__namecall
mt.__namecall = newcclosure(loadstring([[
    local old = ...
    return function(self, ...)
        local len = select("#", ...)
        local pack = {...}
        local args = {}
        for i=1,len do
            args[i] = pack[i]
        end

        local method = getnamecallmethod()
        if method == "FireServer" and tostring(self) == "CombatRemote" and tostring(args[1]) then
            getgenv().Key = tostring(args[1])
        end
        return old(self, ...)
    end
]])(old))

--Wait for key
repeat
    mouse1click()
    wait(0.5)
until getgenv().Key ~= "egg"

--Auto Strength
if getgenv().AutoStrength then
    spawn(function()
        while wait(2) do
            player.PlayerGui.HudGui.Setup.AddStat:FireServer("Strength")
        end
    end)
end

--Auto Pickup
spawn(function()
	while wait() do
		for i,v in pairs(workspace.Interactions.Drops:GetChildren()) do
			game.Players.LocalPlayer.Character.Interactions.Pickup:FireServer(v)
		end
	end
end)

--Player Check
spawn(function()
    while wait(1) do
        if #game.Players:GetPlayers() > 1 then
            game:GetService("TeleportService"):Teleport(2066381781, game:GetService("Players").LocalPlayer)
        end
    end
end)

--Auto Skill
spawn(function()
    while wait() do
        for i,v in pairs(getgenv().Skills) do
            if v and player.Character and player.Character:FindFirstChild("SkillHandlerTEMP") and player.Character.SkillHandlerTEMP:FindFirstChild("Skill") then
                print("Skill"..i)
                player.Character.SkillHandlerTEMP.Skill:FireServer(nil, tostring("Skill"..i), "Start")
            end
        end
    end
end)

--First Wave
noclip()
repeat
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name:lower(), "level") and check(v) and check(player.Character) then
			repeat
                if check(player.Character) and check(v) then
                    player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) + Vector3.new(0,10,0)
                end
                wait()
                player.Character.CombatV1.CombatRemote:FireServer(getgenv().Key)
            until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
            if getgenv().Loaded == false then
                getgenv().Loaded = true
            end
        end
    end
    wait()
until not workspace:FindFirstChild("StartWalls2")

--Boss Function
function bosswait()
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name:lower(), "golgius") and v.Name ~= "GolgiusPos1" then
            if v:FindFirstChildOfClass("Humanoid") and v.Humanoid.Health <= 0 then
                return false
            end
            return true
		end
    end
	return false
end

--Boss
repeat wait() until bosswait()

--Kill Boss
repeat
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name:lower(), "golgius") and check(v) and check(player.Character) then
            repeat
                if check(player.Character) and check(v) then
                    player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) + Vector3.new(0,10,0)
                end
                wait()
                player.Character.CombatV1.CombatRemote:FireServer(getgenv().Key)
            until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
        end
    end
	wait()
until not bosswait() or getgenv().Beaten

--Get Bang
repeat wait() until workspace.Interactions.Quests:FindFirstChild("Find and defeat Golgius")
repeat
    player.Character.HumanoidRootPart.CFrame = workspace.Interactions.Quests["Find and defeat Golgius"].CFrame
    wait(0.25)
    player.Character.Interactions.Dialogue:FireServer("Find and defeat Golgius")
until player.PlayerGui:FindFirstChild("Dialogue") and player.PlayerGui.Dialogue:FindFirstChild("Frame") and player.PlayerGui.Dialogue.Frame:FindFirstChild("ChatEvent")
player.PlayerGui.Dialogue.Frame.ChatEvent:FireServer("Yes", "Find and defeat Golgius")

--Boss
repeat wait() until bosswait()

--Kill Boss
repeat
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name:lower(), "golgius") and check(v) and check(player.Character) then
            repeat
                if check(player.Character) and check(v) then
                    player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) + Vector3.new(0,10,0)
                end
                wait()
                player.Character.CombatV1.CombatRemote:FireServer(getgenv().Key)
            until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
        end
    end
	wait()
until not bosswait()

--Get Note
repeat wait() until workspace.Interactions.Quests:FindFirstChild("Exit the Dungeon")
repeat
    player.Character.HumanoidRootPart.CFrame = workspace.Interactions.Quests["Exit the Dungeon"].CFrame
    wait(0.25)
    player.Character.Interactions.Dialogue:FireServer("Exit the Dungeon")
until player.PlayerGui:FindFirstChild("Dialogue") and player.PlayerGui.Dialogue:FindFirstChild("Frame") and player.PlayerGui.Dialogue.Frame:FindFirstChild("ChatEvent")
player.PlayerGui.Dialogue.Frame.ChatEvent:FireServer("Yes", "Exit the Dungeon")

--Leave
repeat wait() until workspace.Interactions.PlaceTeleports:FindFirstChild("Wilderness")
for i = 1, 3 do
    player.Character.HumanoidRootPart.CFrame = workspace.Interactions.PlaceTeleports.Wilderness.CFrame
    wait(0.25)
end
game:GetService("TeleportService"):Teleport(3382113885, game.Players.LocalPlayer)

--Disable NoClip
Stepped:Disconnect()