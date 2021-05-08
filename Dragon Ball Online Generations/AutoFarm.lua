-- Exploit Check
if not pcall(function() return getreg,getfenv,debug.getupvalues end) then
    game.ReplicatedStorage.Events.Damage:FireServer("get banned retard")
    game:Shutdown()
end

--UI Library
local library = loadstring(game:HttpGetAsync("https://pastebin.com/raw/HYcfs6KC"))()
local w = library:CreateWindow('dragon nuts online')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag="enabled"})

-- Get NPCs
Targets = {}
for i,v in pairs(workspace.NPC:GetChildren()) do
    if not Targets[v.Name] then
        Targets[v.Name] = v.Name
    end
end
w:SearchBox("Target", {
    location = _G;
    flag = "memes";
    list = Targets
}, function()
    print(_G.memes)
end)
w:Box('Player', {
    flag = "memes";
    type = 'string';
}, function(new)
    for i,v in pairs(game.Players:GetPlayers()) do
        if string.find(v.Name:lower(), new:lower()) and v ~= game.Players.LocalPlayer then
            _G.memes = v.Name
            return
        end
    end
end)

-- Variable
local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.DataStorage[player.Name].Data
local scr

-- Get Script
local shit = getnilinstances()
for i = 1, #shit do local v = shit[i]
    if v:IsA("LocalScript") and v.Name == "CameraScript" then
        scr = v
    end
end

-- Get Codec
function codec()
	local stuff = getreg()
	for i = 1, #stuff do local v = stuff[i]
		if typeof(v) == "function" and getfenv(v).script == scr and typeof(debug.getupvalues(v)[5]) == "Instance" then
			return debug.getupvalues(v)[5]
		end
	end
end
local Codec = codec()

-- Woosh
game:GetService("RunService").RenderStepped:Connect(function()
    if w.flags.enabled then
        pcall(function()
            player.Character.Humanoid:ChangeState(10)
        end)
    end
end)

-- Script
while true do
    if w.flags.enabled then
        if game.Players:FindFirstChild(_G.memes) then
            local v = workspace:FindFirstChild(_G.memes)
            if w.flags.enabled and v and pcall(function() return v.Humanoid,v.HumanoidRootPart end) and v.Humanoid.Health > 0 then
                repeat
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)
                        game.ReplicatedStorage.Events.Damage:FireServer("CombatDamage", v.HumanoidRootPart, player.Character, Codec, "ShockwavePunchEffect", "Strong", true, false, "Client", "Foward", nil, data, false)
                    end)
                    wait()
                until not w.flags.enabled or not pcall(function() return v.HumanoidRootPart,v.Humanoid,v.Parent end) or v.Humanoid.Health <= 0
            end
        else
            local shit = workspace.NPC:GetChildren()
            for i = 1, #shit do local v = shit[i]
                if w.flags.enabled and v.Name == _G.memes and pcall(function() return v.Humanoid,v.HumanoidRootPart end) and v.Humanoid.Health > 0 then
                    repeat
                        pcall(function()
                            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,10)
                            game.ReplicatedStorage.Events.Damage:FireServer("CombatDamage", v.HumanoidRootPart, player.Character, Codec, "ShockwavePunchEffect", "Strong", true, false, "Client", "Foward", nil, data, false)
                        end)
                        wait()
                    until not w.flags.enabled or not pcall(function() return v.HumanoidRootPart,v.Humanoid,v.Parent end) or v.Humanoid.Health <= 0
                end
            end
        end
    end
    wait(.25)
end