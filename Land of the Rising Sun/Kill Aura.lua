-- Variable
local player = game.Players.LocalPlayer
local Owner = false

-- Globals
_G.Range = 1
_G.Players = false
_G.NPCs = false

-- Owner Check
if player.Name == "KeIIiKing" then
    Owner = true
end

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('Kill Aura')
w:Section('Made by Megumu')
w:Toggle('Inf Range',{flag = "inf"})
w:Toggle('Firework',{flag = "firework"})
w:Dropdown("Target", {
    location = _G;
    flag = "memes";
    list = {
        "Players";
        "NPCs";
        'Both';
    }
}, function(new)
    if new == "Players" then
        _G.Players = true
        _G.NPCs = false
    elseif new == "NPCs" then
        _G.Players = false
        _G.NPCs = true
    elseif new == "Both" then
        _G.Players = true
        _G.NPCs = true
    end
end)
w:Slider("Range", {
    min = 10;
    max = 65;
    flag = 'fov'
}, function(v)
    _G.Range = tonumber(v);
end)
w:Bind("Toggle", {
    flag = "toggle";
    kbonly = true;
    default = Enum.KeyCode.RightAlt;
}, function()
    _G.Enabled = not _G.Enabled
    if _G.Enabled then
        pcall(function()
            game:GetService("Chat"):Chat(player.Character.Head, "Enabled", "Green")
        end)
    else
        pcall(function()
            game:GetService("Chat"):Chat(player.Character.Head, "Disabled", "Red")
        end)
    end
end)

-- Kill Aura
spawn(function()
    while true do
        -- Players
        if _G.Players then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v.Character and v.Character.PrimaryPart and _G.Enabled and (Owner == false and v.Name ~= "KeIIiKing" or Owner == true) then
                    if w.flags.inf then
                        spawn(function()
                            workspace.Remotes.Tools.WeaponHitV3Function:InvokeServer("Soshu Katana", "Center", v.Character, v.Character.PrimaryPart, w.flags.firework)
                        end)
                    elseif player:DistanceFromCharacter(v.Character.PrimaryPart.Position) < _G.Range then
                        spawn(function()
                            workspace.Remotes.Tools.WeaponHitV3Function:InvokeServer("Soshu Katana", "Center", v.Character, v.Character.PrimaryPart, w.flags.firework)
                        end)
                    end
                end
            end
        end
        -- Mobs
        if _G.NPCs then
            for i,v in pairs(workspace.Mobs:GetChildren()) do
                if v.PrimaryPart and player.Character and player.Character.PrimaryPart and _G.Enabled then
                    if w.flags.inf then
                        spawn(function()
                            workspace.Remotes.Tools.HitMobFunction:InvokeServer("Soshu Katana", "Center", v, v.PrimaryPart, true)
                        end)
                    elseif player:DistanceFromCharacter(v.PrimaryPart.Position) < _G.Range then
                        spawn(function()
                            workspace.Remotes.Tools.HitMobFunction:InvokeServer("Soshu Katana", "Center", v, v.PrimaryPart, true)
                        end)
                    end
                end
            end
        end
        wait()
    end
end)