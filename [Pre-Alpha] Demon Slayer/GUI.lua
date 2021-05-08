--Variable
local player = game.Players.LocalPlayer

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Thot Slayer')
local cred = library:CreateWindow('Credits')

--Credits
cred:Label('UI: wally')
cred:Label('Dragging: Ririchi')
cred:Label('Scripts: Purity')
cred:Button("Discord Server",function()
    setclipboard("https://discordapp.com/invite/PXdNwN5")
end)

--Stuff
w:Section('Main')
w:Toggle('Fast Hit',{flag = "enabled"})
w:Toggle("Quests", {flag = "quest"})
w:Toggle("Auto Walk", {flag = "walk"})
w:Button("GodMode", function()
    if player.Character then
        local hitbox = player.Character:FindFirstChild("Hitbox")
        local block = player.Character:FindFirstChild("Block")
        if block then
            block:Destroy()
        end
        if hitbox then
            hitbox:Destroy()
        end
    end
end)
w:Button("Hide Name", function()
    if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("OverHead") then
        player.Character.Head.OverHead:Destroy()
    end
end)

--Fire Click
local function fireButton1(button)
	for i,signal in next, getconnections(button.MouseButton1Click) do 
		signal:Fire()
	end
	for i,signal in next, getconnections(button.MouseButton1Down) do 
		signal:Fire()
	end
	for i,signal in next, getconnections(button.Activated) do 
		signal:Fire()
	end
end

--Quest
spawn(function()
    while true do
        if w.flags.quest then
            local quest = player.PlayerGui.Quest
            fireclickdetector(workspace.NPCS["BrutalQuest"].Part.ClickDetector)
            wait(0.5)
            repeat
                wait()
            until quest:FindFirstChild("BrutalQuest") and quest.BrutalQuest:FindFirstChild("Accept") and quest.BrutalQuest.Accept:FindFirstChildOfClass("LocalScript")
            wait()
            fireButton1(quest.BrutalQuest.Accept)
        end
        wait()
    end
end)

--Auto Hit
spawn(function()
    while true do
        if w.flags.enabled then
            if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Combat_Main") and player.Backpack.Combat_Main:FindFirstChild("CombatEvent") then
                player.Backpack["Combat_Main"].CombatEvent:FireServer(2, 0)
            end
        end
        wait()
    end
end)

--Auto Walk
spawn(function()
    while true do
        if w.flags.walk then
            player.Character.Humanoid.WalkSpeed = 100
            player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(1748, 845, 826))
            wait(1.5)
            player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(1791, 845, 761))
            wait(1.5)
            player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(1887, 847, 810))
            wait(1.5)
            player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(1836, 845, 883))
            wait(1.5)
            player.Character:FindFirstChildOfClass("Humanoid"):MoveTo(Vector3.new(1809, 845, 818))
            wait(1.5)
        end
        wait()
    end
end)