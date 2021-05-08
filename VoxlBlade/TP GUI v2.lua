--Variable
local player = game.Players.LocalPlayer

--Globals
getgenv().Speed = 200
getgenv().Distance = 5

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Teleports')
w:Button("Zyanna", function()
    tp(workspace.NPCS.Zyanna)
end)
w:Button("Ozibian", function()
    tp(workspace.NPCS.Ozibian)
end)

--Get Items
local items = {}
for i,v in pairs(workspace.Items:GetChildren()) do
    if v:FindFirstChildOfClass("Part") then
        table.insert(items, v.Name)
    end
end

--Get NPCs
local npcs = {}
for i,v in pairs(workspace.NPCS:GetChildren()) do
    if v:FindFirstChild("ChatInfo") then
        table.insert(npcs, v.Name)
    end
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