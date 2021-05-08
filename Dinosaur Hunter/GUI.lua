--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Dino Hunter')

--Credits
w:Section('Made by Megumu')

--Button
local b = w:Button("Kill Others", function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character then
            game.ReplicatedStorage.GameEvents.DoDamage:FireServer(v.Character, math.huge)
        end
    end
end)

--Spawn Weapon
w:Section("Weapon Spawner")
w:SearchBox("Name", {
    location = shared;
    flag = "memes";
    list = {
        "Rocket Launcher";
        "DB Shotgun";
        "Old Shotgun";
        "Jungle AK";
        "Thompson";
        "M3";
        "Lewis Gun";
        "FG-42";
        "B.A.R";
        "Bren";
        "M1 Carbine";
        "M1 Garand";
        "M1 Garand (Scope)";
        "SKS";
        "SKS (Scope)";
        "M16 Carbine";
        "Old Hunting Rifle";
        "Hunting Rifle";
        "Gewehr 98";
        "Karabiner 98k";
        "CZ-75";
        "M1911";
        "Revolver";
    }
}, function(new)
    game.ReplicatedStorage.GameEvents.DropWeapon:FireServer(new)
end)