-- Variable
local buttons = {}
local stuff = workspace.MapModels["The Lobby"]["Lobby Graphic"]:GetDescendants()
local dest = workspace.MapModels["The Lobby"]["Lobby Graphic"].ObbyTeleport.Destination
local player = game.Players.LocalPlayer

-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('Example')
w:Section('Made by Megumu')
w:Toggle('Auto Obby', {flag = "toggle1"})
w:Section('Teleports')

-- Teleports
w:Button("Rebirth Island", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(10327, 7046, 7438))
end)
w:Button("Sacred Forbidden Woods", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-6733, 3083, -1922))
end)
w:Button("Alien Jungle", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(8258, 360, -1074))
end)
w:Button("Alien Paradise", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-25499, 12, -406))
end)
w:Button("Alien Swamp", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(101, -28, 9885))
end)
w:Button("The Altar", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-18124, 10, 5893))
end)
w:Button("Artifact Room", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(17712, 1817, 71))
end)
w:Button("Asteroid Crater", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-25062, 111, -10656))
end)
w:Button("Desert", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-501, 148, -9774))
end)
w:Button("Ship", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-9, 24, 133))
 end)
w:Button("New Ship", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-9928, 1123, 6398))
end)
w:Button("Ocean", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(9137, 1989, 5040))
end)
w:Button("Mushroom Planet", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(21511, 38, -11882))
end)
w:Button("Snow Planet", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-40413, 12, -10223))
end)
w:Button("Mysterious Snow Planet", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-11832, 13617, -11876))
end)
w:Button("Lava Planet", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-12870, 5, -393))
end)
w:Button("Inactive Volcano", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-344, -394, 219983))
end)
w:Button("Temple Ruins", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-2070, 410, 4698))
end)
w:Button("Void", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1172, 47, 7247))
end)
w:Button("Abyss", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(5544, 6774, 7375))
end)
w:Button("Deep Abyss", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(6294, 71, 7785))
end)

-- Auto Obby
for i = 1, #stuff do local v = stuff[i]
	if v.Name == "TouchReward" then
		v.Parent.CanCollide = false
		v.Parent.Transparency = 1
		table.insert(buttons, v.Parent)
	end
end

-- Loop
while true do
    if w.flags.toggle1 then
        pcall(function()
            for i,v in pairs(buttons) do
                v.CFrame = player.Character.PrimaryPart.CFrame
            end
            if player:DistanceFromCharacter(dest.Position) > 30 then
                oldpos = player.Character.PrimaryPart.CFrame
            else
                player.Character.PrimaryPart.CFrame = oldpos
            end
        end)
    end
    wait()
end