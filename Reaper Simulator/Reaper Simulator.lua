--Variable
local player = game.Players.LocalPlayer

--Tables
local scythes = {}
local souls = {}

--Get Scythes
for i,v in pairs(require(game.ReplicatedStorage.Scythes)) do
	table.insert(scythes, i)
end

--Get Souls
for i,v in pairs(require(game.ReplicatedStorage.Souls)) do
    if not string.find(tostring(i):lower(), "infinity") then
        table.insert(souls, i)
    end
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Grim Reaper')
local cred = library:CreateWindow('Credits')

--Labels
cred:Label('Dragging: Ririchi')
cred:Label('UI: wally')
cred:Label('Scripts: Megumu')

--Section
w:Section('Auto Farm')

--Toggle
w:Toggle('Auto Farm', {flag = "farm"})
w:Toggle('Coins', {flag = "coins"})

--Section
w:Section('Auto Upgrade')

--Toggle
w:Toggle('Scythe', {flag = "scythe"})
w:Toggle('Soul', {flag = "soul"})

--Section
w:Section('Auto Sell')

--Toggles
w:Toggle('Auto Sell', {flag = "sell"})
w:Toggle('Fill', {flag = "fill"})

--Section
w:Section('Other')

--Check
local function check()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
        return true
    else
        return false
    end
end

--Button
local b = w:Button("Platform", function()
    if check() then
        local plat = Instance.new("Part", game:GetService("Workspace"))
        plat.Size = Vector3.new(10, 2, 10)
        plat.Anchored = true
        plat.CanCollide = true
        plat.Position = Vector3.new(math.random(-3000, 3000), 500, math.random(-3000, 3000))
        wait(0.5)
        player.Character.HumanoidRootPart.CFrame = plat.CFrame + Vector3.new(0, 15, 0)
        wait(0.5)
    end
end)

--Equip
local function equip()
    if check() then
        if player.Character:FindFirstChildOfClass("Tool") then
            return player.Character:FindFirstChildOfClass("Tool")
        elseif player:FindFirstChild("Backpack") and player.Backpack:FindFirstChildOfClass("Tool") then
            player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
            repeat wait() until player.Character:FindFirstChildOfClass("Tool")
            return player.Character:FindFirstChildOfClass("Tool")
        end
    end
    return false
end

--Auto Buy
spawn(function()
    while true do
        if w.flags.scythe then
            for i,v in pairs(scythes) do
                game.ReplicatedStorage.Remotes.Purchase:FireServer(v, "Scythe", false)
            end
        end 
        wait(0.25)
        if w.flags.soul then
            for i,v in pairs(souls) do
                game.ReplicatedStorage.Remotes.Purchase:FireServer(v, "Soul", false)
            end
        end
        wait(0.25)
    end
end)

--Coins
spawn(function()
    while true do
        if w.flags.coins then
            for i,v in pairs(workspace.Coins:GetChildren()) do
                if v:FindFirstChild("TouchPart") and check() then
                    v.TouchPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    wait()
                end
            end
        end
        wait()
    end
end)

--Farm & Sell
spawn(function()
    while true do
        if w.flags.farm then
            if equip() then
                equip():Activate()
            end
        end
        wait()
        if w.flags.sell and check() then
            if w.flags.fill then
                if player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Main") and player.PlayerGui.Main:FindFirstChild("LeftHolder") and player.PlayerGui.Main.LeftHolder:FindFirstChild("SkullsAmount") and player.PlayerGui.Main.LeftHolder.SkullsAmount:FindFirstChild("Amount") then
                    local split = string.split(player.PlayerGui.Main.LeftHolder.SkullsAmount.Amount.Text, "/")
                    if split[1] == split[2] then
                        local oldpos = workspace.SellingPart.CFrame 
                        workspace.SellingPart.CFrame = player.Character.HumanoidRootPart.CFrame
                        wait()
                        workspace.SellingPart.CFrame = oldpos
                    end
                end
            else
                local oldpos = workspace.SellingPart.CFrame
                workspace.SellingPart.CFrame = player.Character.HumanoidRootPart.CFrame
                wait()
                workspace.SellingPart.CFrame = oldpos
            end
        end
    end
end)