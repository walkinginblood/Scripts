--Variable
local player = game.Players.LocalPlayer
local name = "WinterWoof"

--Tables
local items = {}
local npcs = {}

--Get Items & NPCs
for i,v in pairs(workspace.Items:GetChildren()) do
    if v:FindFirstChildOfClass("Part") then
        table.insert(items, v.Name)
    end
end
for i,v in pairs(workspace.NPCS:GetChildren()) do
    if v:FindFirstChild("ChatInfo") then
        table.insert(npcs, v.Name)
    end
end

--Globals
getgenv().Speed = 200
getgenv().Distance = -5

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Private Farm')

--AutoFarm
w:Section('Auto Farm')
w:Toggle('Farm', {flag = "toggle1"})
local box = w:Box('Distance', {
    flag = "ws";
    type = 'number';
}, function(new, old, enter)
    getgenv().Distance = tonumber(new)
end)
local box = w:Box('Speed', {
    flag = "ws";
    type = 'number';
}, function(new, old, enter)
    getgenv().Speed = tonumber(new)
end)

--Teleports
w:Section('Teleports')
w:Dropdown("Items", {
    location = _G;
    flag = "memes";
    list = items
}, function(new)
    tp(workspace.Items[tostring(new)]:FindFirstChildOfClass("Part"))
end)
w:Dropdown("locations", {
    location = _G;
    flag = "memes2";
    list = npcs
}, function(new)
    tp(workspace.NPCS[tostring(new)])
end)

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = 1000
	for _,v in pairs(workspace.NPCS:GetChildren()) do
		if not v:FindFirstChild("ChatInfo") and v:FindFirstChild("Status") and v.Name == name and v.Status:FindFirstChild("Dead") and v.Status.Dead.Value == false and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v.Status:FindFirstChild("Health") and v.Status.Health.Value > 0 and v.Status.Health.Value ~= math.huge then 
			local newDistance = (v.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v
				Distance = newDistance
			end
		end
	end
	return Closest
end

--NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

--TP
function tp(target)
    noclip()
    game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(target.Position)/getgenv().Speed, Enum.EasingStyle.Linear), {CFrame = target.CFrame + Vector3.new(0, Distance, 0)}):Play()
    wait(player:DistanceFromCharacter(target.Position)/getgenv().Speed)
    Stepped:Disconnect()
end

--Auto Attack
spawn(function()
    while true do
        if w.flags.toggle1 and getgenv().Attacking then
            game.ReplicatedStorage.Events.Event1:InvokeServer("Special")
            wait()
            game.ReplicatedStorage.Events.Event1:InvokeServer("R")
        end
        wait()
    end
end)

--Auto Farm
spawn(function()
    while true do
        if w.flags.toggle1 then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local enemy = nil
				repeat
					enemy = nearest(player.Character.HumanoidRootPart.Position)
					wait(0.25)
				until enemy ~= nil
                tp(enemy)
                getgenv().Attacking = true
                repeat
                    if player:DistanceFromCharacter(enemy.Position) < 12 then
                        player.Character.HumanoidRootPart.CFrame = enemy.CFrame * CFrame.new(Vector3.new(0, 0, getgenv().Distance))
                    else
                        tp(enemy)
                    end
                    wait()
                until w.flags.toggle1 == false or enemy == nil or enemy.Parent == nil or player:DistanceFromCharacter(enemy.Position) > 100 or not enemy:FindFirstChild("Status") or not enemy.Status:FindFirstChild("Health") or enemy.Status.Health.Value <= 0
                getgenv().Attacking = false
                if player.Character.Humanoid.Health < 25 then
                    tp(workspace.NPCS.Zyanna)
                    player.PlayerGui.CoreGUI.Events.DialogEffect:InvokeServer(workspace.NPCS.Zyanna, workspace.NPCS.Zyanna.ChatInfo.Chats.Sleep)
                end
            end
        end
        wait(0.25)
    end
end)