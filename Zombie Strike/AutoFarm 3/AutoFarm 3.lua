--[[
    Zombie Strike AutoFarm | Version 3.0
    Rewritten again because the previous one is spaghetti
]]

-- ProtoSmasher Compatible
if PROTOSMASHER_LOADED then
    getgenv().getnamecallmethod = get_namecall_method
    getgenv().newcclosure = protect_function
end

-- Wait for stuff to load
local load
repeat
    load = pcall(function()
        local a = game.Players.LocalPlayer.Character.HumanoidRootPart
        local b = game.Players.LocalPlayer.Character.Gun.Ammo
        local c = game.Players.LocalPlayer.Character.Humanoid
        local d = game.ReplicatedStorage.Remotes
        local e = game.ReplicatedStorage.RuddevRemotes
        local f = game.Players.LocalPlayer.Character.Gun.WeaponData.Type
    end)
    wait()
until load

--Place holder
getgenv().Settings = {
	Map = 1;
	Level = 1;
    Bullets = 1;
    UID = false;
    Common = false;
    Uncommon = false;
    Rare = false;
    Epic = false;
}
--Auto sell place holder
_G.common = false
_G.uncommon = false
_G.rare = false
_G.epic = false
--Gui place holder
_G.one = true
_G.two = true
_G.three = true

-- Variables
local player = game.Players.LocalPlayer
local rs = game.ReplicatedStorage
local remotes = rs.RuddevRemotes

--Auto Rejoin | MADE BY PEPSI <3
local tps = game:GetService("TeleportService")
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and tps:Teleport(3759927663, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
	assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and tps:Teleport(3759927663, game:GetService("Players").LocalPlayer))
end)

-- Check for settings
loadstring(game:HttpGetAsync("https://pastebin.com/raw/3JWkXY6q"))()

-- Lobby Check
if game.PlaceId == 3759927663 then
    -- Wait for stuff to load
    local load
    repeat
        load = pcall(function()
            local a = game.ReplicatedStorage.Remotes.CreateLobby
            local b = game.ReplicatedStorage.Remotes.PlayLobby
            local c = game.ReplicatedStorage.Lobbies
            local d = game.Players.LocalPlayer.PlayerGui.MainGui.Main.RoactTree.Inventory.Contents
        end)
        wait()
    until load
    --Sell
    pcall(function()
        for i,v in pairs(player.PlayerGui.MainGui.Main.RoactTree.Inventory.Contents:GetChildren()) do
            if string.find(v.Name, "Item") and v:IsA("ImageButton") then
                if getgenv().Settings["Common"] and v.BackgroundColor3 == Color3.new(219/255, 219/255, 219/255) then
                    warn("sold a common item")
                    wait()
                    rs.Remotes.Sell:FireServer(string.split(v.Name, "Item")[2])
                end
                if getgenv().Settings["Uncommon"] and v.BackgroundColor3 == Color3.new(0, 189/255, 50/255) then
                    warn("sold an uncommon item")
                    wait()
                    rs.Remotes.Sell:FireServer(string.split(v.Name, "Item")[2])
                end
                if getgenv().Settings["Rare"] and v.BackgroundColor3 == Color3.new(3/255, 52/255, 143/255) then
                    warn("sold a rare item")
                    wait()
                    rs.Remotes.Sell:FireServer(string.split(v.Name, "Item")[2])
                end
                if getgenv().Settings["Epic"] and v.BackgroundColor3 == Color3.new(162/255, 155/255, 254/255) then
                    warn("sold an epic item")
                    wait()
                    rs.Remotes.Sell:FireServer(string.split(v.Name, "Item")[2])
                end
            end
        end
    end)
    -- Play
    local lobbySet
    if getgenv().Settings["Gamemode"] == "Mission" then
        lobbySet = {
            ["Difficulty"] = getgenv().Settings["Level"];
            ["Gamemode"] = getgenv().Settings["Gamemode"];
            ["Hardcore"] = true;
            ["Public"] = false;
            ["Campaign"] = getgenv().Settings["Map"]
        }
    else
        lobbySet = {
            ["Public"] = false;
            ["Level"] = getgenv().Settings["Level"];
            ["Campaign"] = getgenv().Settings["Map"];
            ["Gamemode"] = getgenv().Settings["Gamemode"];
        }
    end
    local lobby = rs.Remotes.CreateLobby:InvokeServer(lobbySet)
    repeat wait() until lobby ~= nil
    rs.Remotes.PlayLobby:FireServer()
    return
end

--Credits
pcall(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()
end)

-- Boss Stuff
local boss
if getgenv().Settings["Map"] == 1 then
	boss = "Giga Zombie"
elseif getgenv().Settings["Map"] == 2 then
	boss = "The Evil Dr. Zombie"
elseif getgenv().Settings["Map"] == 3 then
	boss = "Fire Elemental Zombie"
elseif getgenv().Settings["Map"] == 4 then
	boss = "Yeti Zombie"
end

-- Delete Boss Damage
for i,v in pairs(rs.Remotes:GetChildren()) do
	if string.find(v.Name:lower(), "boss") then
		v:Destroy()
	end
end

-- Heal Automatically
spawn(function()
    while wait(0.5) do
        if player.Character.Humanoid.Health < player.Character.Humanoid.MaxHealth then
            pcall(function()
                rs.Remotes.UseHealthPack:InvokeServer()
            end)
        end
    end
end)

-- Reload
function ammo()
    if player.Character.Gun.Ammo.Value <= 0 then
        remotes.Reload:FireServer()
        player.Character.PrimaryPart.CFrame = CFrame.new(0, 150, 0)
        player.Character.Gun.Ammo.Changed:wait()
        return true
    else
        return true
    end
end

-- Shoot
function shoot(v)
    local tab = {}
    local pos = {}
    for i = 1, getgenv().Settings["Bullets"] do
        table.insert(tab, {[1] = v;[2] = i})
        table.insert(pos, Vector3.new(-0.495199651, 0.0343385711, -0.868100286))
    end
    rs.RuddevRemotes.Shoot:FireServer(player.Character.PrimaryPart.Position, pos, tab)
end

-- Grenade
function grenade(v)
    local nade = game.ReplicatedStorage.Remotes.UseGrenade:InvokeServer()
    if nade ~= nil then
        repeat
            pcall(function()
                nade.CFrame = v.CFrame
            end)
            wait()
        until nade == nil or nade.Parent == nil
    end
end

-- NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
	player.Character.Humanoid:ChangeState(11)
end)

-- Load some stuff
repeat
    load = pcall(function()
        local a = player.PlayerGui.MainGui.Main.YouWin.Word2
        local b = workspace.Zombies
    end)
    wait()
until load

-- Get Zombies
function zombies()
    local z = workspace.Zombies:GetChildren()
    table.sort(z, function(a,b)
        return a.Name < b.Name
    end)
    return z
end

-- Leave 
player.PlayerGui.MainGui.Main.YouWin.Word2.Changed:Connect(function(v)
    print("LEAVE")
    wait(7)
    game:GetService("TeleportService"):Teleport(3759927663)
end)

-- Grab Powerups
workspace.ChildAdded:Connect(function(v)
    if v.Name == "Rage" or v.Name == "Bulletstorm" or v.Name == "Tank" then
        repeat
            pcall(function()
                v.CFrame = player.Character.PrimaryPart.CFrame
            end)
            wait()
        until v == nil or v.Parent == nil
    end
end)

-- Destroy nasty shit
workspace.ChildAdded:Connect(function(v)
    wait()
    if v:FindFirstChild("BodyGyro") or v:FindFirstChild("BodyForce") then
        pcall(function()
            v:Destroy()
        end)
    end
end)

-- AutoFarm
while wait() do
    -- Kill Zombies
    local z = zombies()
    if #z > 0 then
        for i,v in pairs(z) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("Head") then
                repeat
                    player.Character.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 25, 0)
                    wait()
                    if ammo() and v:FindFirstChild("Head") then
                        shoot(v.Head)
                    end
                    wait()
                    spawn(function()
                        grenade(v.PrimaryPart)
                    end)
                until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("Head") or v.Humanoid.Health <= 0
                pcall(function()
                    v:Destroy()
                end)
            end
        end
    end
    -- Kill Boss
    if workspace:FindFirstChild(boss) then
        repeat 
            local v = workspace:FindFirstChild(boss)
            pcall(function()
                player.Character.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 25, 0)
                wait()
                if ammo() then
                    shoot(v.PrimaryPart)
                end
                spawn(function()
                    grenade(v.PrimaryPart)
                end)
            end)
            wait()
        until v == nil or v.Parent == nil or #zombies() > 0
    end
end