-- Variable
local player = game.Players.LocalPlayer

-- Get Shit
local npcs = {}
local weapons = {}
for i,v in pairs(workspace.NPCS:GetChildren()) do
    if v:FindFirstChild("CD") then
        table.insert(npcs, v.Name)
    end
end
for i,v in pairs(workspace.NPCS.WeaponShop:GetChildren()) do
    if v:FindFirstChild("Speak") then
        table.insert(weapons, v.Name)
    end
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('Discord: PXdNwN5')
w:Section('Made by Megumu')
w:Dropdown("NPCs", {
    location = _G;
    flag = "memes";
    list = npcs
}, function(new)
    if fireclickdetector then
        fireclickdetector(workspace.NPCS[new].CD:FindFirstChildOfClass("ClickDetector"), 1)
    else
        pcall(function()
            game.ReplicatedStorage.Remotes.StartFinalSelection:FireServer()
            repeat wait() until player:DistanceFromCharacter(Vector3.new(4495, 575, -437)) < 10
            player.Character.HumanoidRootPart.CFrame = workspace.NPCS[new].CD.CFrame + Vector3.new(0, 3, 0)
        end)
    end
end)
w:Dropdown("Weapons", {
    location = _G;
    flag = "memes";
    list = weapons
}, function(new)
    if fireclickdetector then
        fireclickdetector(workspace.NPCS.WeaponShop[new].Speak:FindFirstChildOfClass("ClickDetector"), 1)
    else
        pcall(function()
            game.ReplicatedStorage.Remotes.StartFinalSelection:FireServer()
            repeat wait() until player:DistanceFromCharacter(Vector3.new(4495, 575, -437)) < 10
            player.Character.HumanoidRootPart.CFrame = workspace.NPCS.WeaponShop[new].Speak.CFrame + Vector3.new(0, 3, 0)
        end)
    end
end)