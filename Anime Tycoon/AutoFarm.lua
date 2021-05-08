-- Settings
_G.Settings = {
    Rejoin = true; -- Rejoin when tycoon is complete
    Rebirth = true; -- Rebirth at max level
    Distance = -7; -- TP distance from NPC
}

-- Wait for load
repeat
    load = pcall(function()
        a = workspace.tycoons.Naruto.Owner;
        b = workspace.tycoons["Dragon Ball Z"].Entrance.Entrance.Door;
        c = workspace.npcs["1"];
        d = workspace.tycoons["My Hero Academia"].PurchasedObjects;
        e = workspace.tycoons["Death Note"].Buttons;
        f = game.ReplicatedStorage.RemoteFunction;
        g = game.ReplicatedStorage.RemoteEvent;
        h = workspace.tycoons["Death Note"].Essentials.cashToCollect.collect.button;
        i = game.Players.LocalPlayer.Character.HumanoidRootPart;
    end)
    wait()
until load

-- Variable
local player = game.Players.LocalPlayer
local load

-- ProtoSmasher
if PROTOSMASHER_LOADED then
    getgenv().fireclickdetector = click_detector
end

--Auto Rejoin | MADE BY PEPSI <3
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId))
end)

-- Get Tycoon
function tycoon()
    for i,v in pairs(workspace.tycoons:GetChildren()) do 
        if v.Owner.Value == player then 
            return v
        end
    end
    for i,v in pairs(workspace.tycoons:GetChildren()) do 
        if v.Owner.Value == nil then 
            repeat
                pcall(function()
                    player.Character.PrimaryPart.CFrame = v.Entrance.Entrance.Door.CFrame
                end)
                wait()
            until v.Owner.Value ~= nil
            return v
        end
    end
end

-- Load Tycoon
repeat
    wait()
until tycoon() ~= nil

-- NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            player.Character.Humanoid:ChangeState(11)
        end)
    end)
end

-- Get NPC
function npc()
    local npcs = {}
    for i,v in pairs(workspace.npcs:GetChildren()) do
        if tonumber(v.Name) < player.leaderstats.Level.Value+1 then
            table.insert(npcs, v)
        end
    end
    table.sort(npcs, function(a, b)
        return tonumber(a.Name) > tonumber(b.Name)
    end)
    for i,v in pairs(npcs) do
        if pcall(function() a=player.Character.HumanoidRootPart;b=v.HumanoidRootPart;c=v.Humanoid; end) and v.Humanoid.Health > 0 and not v:FindFirstChild("ForceField") then
            if player.leaderstats.Rebirths.Value == 0 and v.PrimaryPart.Position.y > 8 then
                return v
            elseif player.leaderstats.Rebirths.Value >= 1 then
                return v
            end
        end
    end
end

-- Click
spawn(function()
    while wait(0.25) do
        for i,v in pairs(tycoon().PurchasedObjects:GetChildren()) do 
            if v:FindFirstChild("button") and v.button:FindFirstChild("ClickDetector") then 
                fireclickdetector(v.button.ClickDetector, 1)
            end
        end
    end
end)

-- Get Buttons
spawn(function()
    repeat
        wait(1)
    until #tycoon().Buttons:GetChildren() >= 1
    while wait(0.25) do
        local buttons = 0
        for i,v in pairs(tycoon().Buttons:GetChildren()) do
            if v:FindFirstChild("button") and v.button.Transparency ~= 1 and not v:FindFirstChild("Gamepass") then
                buttons = buttons + 1
                pcall(function()
                    v.button.CFrame = player.Character.PrimaryPart.CFrame
                    v.button.CanCollide = false
                end)
            end
        end
        pcall(function()
            tycoon().Essentials.cashToCollect.collect.button.CFrame = player.Character.PrimaryPart.CFrame
        end)
        if buttons == 0 and _G.Settings["Rejoin"] then
            return game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
    end
end)

-- Farm
while true do
    local v = npc()
    if v ~= nil then
        noclip()
        repeat
            game.ReplicatedStorage.RemoteEvent:FireServer("punchHumanoid", v)
            wait()
            pcall(function()
                player.Character.PrimaryPart.CFrame = CFrame.new(v.PrimaryPart.Position) + Vector3.new(0, _G.Settings["Distance"], 0)
            end)
        until _G.Enabled == false or v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or tonumber(v.Name) > player.leaderstats.Level.Value or v:FindFirstChild("ForceField")
        Stepped:Disconnect()
        for i,v in pairs(workspace:GetChildren()) do 
            if v.Name == "moneyStack" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("player") and v.player.Value == player then
                pcall(function()
                    v.CFrame = player.Character.PrimaryPart.CFrame
                end)
            end
        end
        spawn(function()
            game.ReplicatedStorage.RemoteFunction:InvokeServer("skillPointAdd", "attack")
            wait()
            if _G.Settings["Rebirth"] then
                game.ReplicatedStorage.RemoteFunction:InvokeServer("REBIRTH")
            end
        end)
    end
    wait(0.25)
end