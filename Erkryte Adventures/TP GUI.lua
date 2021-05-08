-- ProtoSmasher Support
if PROTOSMASHER_LOADED then
    getgenv().fireclickdetector = click_detector
end

-- Variable
local player = game.Players.LocalPlayer

-- Tables
stff = {
    Weapons = {};
    Humans = {};
    Clothing = {};
}

-- Function
function stuff(name, tab)
    for i,v in pairs(workspace.Main.Map.NPCs[name]:GetChildren()) do
        if v:FindFirstChild("ClickPart") then
            table.insert(tab, v.Name)
        end
    end
end

-- Fill Tables
stuff("Clothing", stff.Clothing)
stuff("Humans", stff.Humans)
stuff("Weapons", stff.Weapons)

-- Main
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('bad rl copy')
w:Section('Made by Megumu')
local b = w:Button("Get Trinkets", function()
    old = player.Character.PrimaryPart.CFrame
    for i,v in pairs(workspace.Main.Items:GetChildren()) do
        pcall(function()
            player.Character.PrimaryPart.CFrame = v.CFrame
            wait(0.5)
            fireclickdetector(v.ClickDetector, 1)
        end)
    end
    player.Character.PrimaryPart.CFrame = old
end)
for i,v in pairs(stff) do
    w:Dropdown(tostring(i), {
        location = _G;
        flag = "memes";
        list = v
    }, function(new)
        pcall(function()
            player.Character.PrimaryPart.CFrame = workspace.Main.Map.NPCs[tostring(i)][tostring(new)].ClickPart.CFrame
        end)
    end)
end