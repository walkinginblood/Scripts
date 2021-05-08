_G.Enabled = true; --Toggle On/Off
_G.Settings = { --Settings
	NPC = "Deadman"; --Target NPC
	Sword = "SOUL"; --Weapon
	Speed = 200; --TP Speed
}

--Wait for loading
repeat wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game.ReplicatedStorage:FindFirstChild("Remotes") and game.ReplicatedStorage.Remotes:FindFirstChild("PrivateServerRemote")

--Variable
local player = game.Players.LocalPlayer
local remotes = game.ReplicatedStorage.Remotes
local PRIVATE = true;

--Auto Rejoin | LOVE YOU PEPSI
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
end)

--Check Server
if #game.Players:GetPlayers() > 1 then
    PRIVATE = false; --Dont start the script
    print("not private")
    --Wait for load
    repeat wait() until player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Display") and player.PlayerGui.Display:FindFirstChild("VIP") and player.PlayerGui.Display.VIP:FindFirstChild("PlayerCode")
    --Check Code
    repeat
        remotes.PrivateServerRemote:FireServer("Create")
        wait(3)
    until player.PlayerGui.Display.VIP.PlayerCode.Text ~= "NO SERVER CODE"
	print("found code")
    --Join
    remotes.PrivateServerRemote:FireServer("Join", string.split(game.Players.LocalPlayer.PlayerGui.Display.VIP.PlayerCode.Text, ": ")[2])
else
    print("private")
    repeat wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart") and remotes:FindFirstChild("Client") and remotes.Client:FindFirstChild("Load")
    remotes.Client.Load:FireServer()
end

if PRIVATE then
    --Find Board 
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "BoardSnow" and player:DistanceFromCharacter(v.Paper.Position) < 100 then 
            Board = v
        end
    end

    --Find Paper
    for i,v in pairs(Board:GetChildren()) do
        if v.Name == "Paper" and string.find(v.SurfaceGui.Frame.Inventory.Body.Text:lower(), "deadman") then
            PAPER = v
        end
    end

    --Click Function
    function click(part)
        if fireclickdetector then
            --Synapse X
            fireclickdetector(part)
        elseif click_detector then
            --ProtoSmasher
            click_detector(part, 1)
        end
    end

    --Equip Weapon
    function equip()
        if player.Character then
            if player.Character:FindFirstChildOfClass("Tool") then
                return true
            elseif player.Character:FindFirstChild("Humanoid") and player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild(_G.Settings["Sword"]) then
                player.Character.Humanoid:EquipTool(player.Backpack[_G.Settings["Sword"]])
                repeat wait() until player.Character:FindFirstChild(_G.Settings["Sword"])
                return true
            else
                return false
            end
        else
            return false
        end
    end

    --Quest Check
    function quest()
        if player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Gameplay") and player.PlayerGui.Gameplay:FindFirstChild("Main") and player.PlayerGui.Gameplay.Main.Quest.Text == "No Quest" then
            game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(PAPER.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = PAPER.CFrame}):Play()
            wait(player:DistanceFromCharacter(PAPER.Position)/_G.Settings["Speed"])
            repeat wait(0.1) until player:DistanceFromCharacter(PAPER.Position) < 30
            repeat
                click(PAPER.ClickDetector)
                wait(0.25)
                remotes.Client.QuestGiver:FireServer("Deadmans")
                wait(0.25)
            until player.PlayerGui.Gameplay.Main.Quest.Text ~= "No Quest"
        end
    end

    --Find Nearest
    function nearest(Pose)
        local Closest
        local Distance = math.huge
        for _,v in pairs(workspace:GetChildren()) do
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

    --Loop
    while _G.Enabled do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and equip() then
            quest()
            wait()
            repeat
                v = nearest(player.Character.HumanoidRootPart.Position)
                wait()
            until v ~= nil
            game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame}):Play()
            wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"])
            player.Character[_G.Settings["Sword"]].WeaponHandle.RemoteEvent:FireServer("SwordClick", 1)
        end
        wait()
    end
end