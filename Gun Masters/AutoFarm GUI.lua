-- Variable
local player = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local items = require(game.ReplicatedStorage.ItemValues).items
_G.Delay = 1

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('pew simulator')
w:Section('Made by Megumu')
w:Toggle('Auto Shoot', {flag = "shoot"})
w:Toggle('Platform', {flag = "plat"})
w:Slider("Delay", {
    min = 1;
    max = 10;
    flag = 'fov'
}, function(v)
    _G.Delay = tonumber(v/10);
end)
w:Section('Auto Sell')
w:Toggle('Enabled', {flag = "sell"})
w:Toggle('Fill', {flag = "fill"})
w:Section('Auto Upgrade')
w:Toggle('Precision', {flag = "prec"})

-- Create Platform
local platform = Instance.new("Part")
platform.Parent = workspace
platform.Anchored = true
platform.Size = Vector3.new(10, 1, 10)
platform.Position = Vector3.new(math.random(999, 9999), 10000, math.random(999, 9999))

-- Equip Gun
local function gun()
    if player.Character:FindFirstChildOfClass("Tool") then
        return player.Character:FindFirstChildOfClass("Tool")
    elseif player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() > 0 then
        player.Backpack:GetChildren()[1].Parent = player.Character
        return player.Character:FindFirstChildOfClass("Tool")
    end
    return false
end

-- Shoot
spawn(function()
    while true do
        if w.flags.shoot and typeof(gun()) == "Instance" then
            local old = player.leaderstats.Precision.Value
            if player:FindFirstChild("Safezone") and w.flags.plat then
                if w.flags.fill and player.leaderstats.Precision.Value == player.Stats.MaxPrecision.Value then else
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0, 7, 0)
                        wait(.1)
                    end)
                end
            end
            pcall(function()
                game.ReplicatedStorage.PistolRemote:FireServer(player.Character.Head.Position, gun())
            end)
            wait(_G.Delay)
        end
        rs.RenderStepped:wait()
    end
end)

-- Sell
spawn(function()
    while true do
        if w.flags.sell then
            if w.flags.fill and player.leaderstats.Precision.Value == player.Stats.MaxPrecision.Value then
                repeat
                    game.ReplicatedStorage.TeleportRemote:FireServer()
                    wait(.1)
                until player.leaderstats.Precision.Value <= 2
                wait(2.5)
            elseif not w.flags.fill and player.leaderstats.Precision.Value >= 1 then
                repeat
                    game.ReplicatedStorage.TeleportRemote:FireServer()
                    wait(.1)
                until player.leaderstats.Precision.Value <= 2
                wait(2.5)
            end
        end
        wait(.25)
    end
end)

-- Get Precision
local function getPrec()
    for i,v in pairs(items) do
        if string.find(i:lower(), "precisionupgrade") and v.Max == player.Stats.MaxPrecision.Value then
			return tonumber(string.gsub(i, "PrecisionUpgrade", "")+1)
		end
    end
end

-- Auto Upgrade
spawn(function()
    while true do
        if w.flags.prec and player.Stats.Money.Value >= items["PrecisionUpgrade"..getPrec()].Cost then
            game.ReplicatedStorage.PurchasePrecisionRemote:FireServer("PrecisionUpgrade"..getPrec())
        end
        wait(.25)
    end
end)