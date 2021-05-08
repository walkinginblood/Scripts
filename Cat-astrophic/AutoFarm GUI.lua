--Variable
local player = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local remote = rs.RemoteFunction

--Lists
local claws = require(rs.Claw)["List"]
local yarns = require(rs.Yarn)["List"]
local classes = require(rs.Classes)["List"]
local bossclaws = require(rs.BossClaw)["List"]

--Globals
_G.Capture = false

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Kitty')
local cred = library:CreateWindow('Credits')
local tp = library:CreateWindow('Teleports')

--Credits
cred:Label("UI: wally")
cred:Label("Dragging: Ririchi")
cred:Label("Scripts: Purity")
cred:Label("Discord: PXdNwN5")

--Main
w:Section('Auto Farm')
w:Toggle('Enabled',{flag = "enabled"})
w:Toggle('Daily Reward',{flag = "daily"})

--Auto Buy
w:Section('Auto Buy')
w:Toggle('Claw',{flag = "claw"})
w:Toggle('Yarn', {flag = "yarn"})
w:Toggle('Class', {flag = "class"})
w:Toggle('Boss', {flag = "bossclaw"})

--Auto Sell
w:Section('Auto Sell')
w:Toggle('Enabled',{flag = "sell"})
w:Toggle('Fill',{flag = "fill"})

--Teleports
tp:Toggle('Fish Coins',{flag = "fish"})
tp:Toggle('Flags',{flag = "flags"})
tp:Toggle('Hill',{flags = "hill"})
tp:Toggle('Laser',{flags = "laser"})

--Equip Function
function equip()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        if player.Character:FindFirstChildOfClass("Tool") then
            return true
        end
        local tool = player.Backpack:FindFirstChildOfClass("Tool")
        if player:FindFirstChild("Backpack") and tool then
            player.Character.Humanoid:EquipTool(tool)
            repeat wait() until player.Character:FindFirstChildOfClass("Tool")
            return true
        end
    end
    return false
end

--NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

--Auto Farm
spawn(function()
    while true do
        if w.flags.enabled then
            if equip() then
                player.Character:FindFirstChildOfClass("Tool"):Activate()
            end
        end
        wait(0.25)
    end
end)

--Laser
spawn(function()
    while true do
        if tp.flags.laser and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and workspace.Buildings.Lamps.Laser:FindFirstChild("Dot") and workspace.Buildings.Lamps.Laser.Dot:FindFirstChild("TouchInterest") then
            player.Character.HumanoidRootPart.CFrame = workspace.Buildings.Lamps.Laser:FindFirstChild("Dot").CFrame
        end
        wait(0.25)
    end
end)

--Flags
spawn(function()
    while true do
        if tp.flags.flag then
            for i,v in pairs(workspace.CapturePoints:GetChildren()) do
                if v.Name ~= "HillTower1" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if v.Configuration.Leader.Value ~= player then
                        _G.Capture = true
                        noclip()
                        repeat
                            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                player.Character.HumanoidRootPart.CFrame = v.Configuration.Top.CFrame
                            end
                            wait()
                        until v.Configuration.Leader.Value == player
                        _G.Capture = false
                        Stepped:Disconnect()
                    end
                end
            end
            wait()
        end
        wait(0.25)
    end
end)

--Hill
spawn(function()
    while true do
        if w.flags.hill and _G.Capture == false and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = workspace.CapturePoints.HillTower1.Base.CFrame + Vector3.new(0, -10, 0)
        end
        wait()
    end
end)

--Auto Buy
spawn(function()
    while true do
        if w.flags.claw then
            for i,v in pairs(claws) do
                remote:InvokeServer("BuyItem", i, "Claws")
                wait()
            end
        end
        if w.flags.yarn then
            for i,v in pairs(yarns) do
                remote:InvokeServer("BuyItem", i, "Yarn")
                wait()
            end
        end
        if w.flags.class then
            for i,v in pairs(classes) do
                remote:InvokeServer("BuyItem", i, "Class")
                wait()
            end
        end
        if w.flags.bossclaw then
            for i,v in pairs(bossclaws) do
                remote:InvokeServer("BuyItem", i, "Claws")
            end
        end
        wait(0.25)
    end
end)

--Auto Sell
spawn(function()
    while true do
        if w.flags.sell then
            remote:InvokeServer("SellAll")
        end
        wait(0.25)
    end
end)

--Fish Coins
spawn(function()
    while true do
        if w.flags.fish then
            for i,v in pairs(workspace:GetChildren()) do 
                if v.Name == "FishCoin" and v:FindFirstChild("TouchInterest") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
                    v.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end
        end
        wait(0.25)
    end
end)

--Daily
spawn(function()
    while true do
        if w.flags.daily then
            rs.RemoteEvent:FireServer("ClaimDaily")
        end
        wait(10)
    end
end)