-- Variable
local player = game.Players.LocalPlayer

-- Enemy Check
if #workspace.Enemy:GetChildren() > 0 then
    repeat
        for i,v in pairs(workspace.Enemy:GetChildren()) do
            if v ~= nil and v.Parent ~= nil and v:FindFirstChild("Health") and v.Health.Value > 0 and v:FindFirstChild(v.Name) and v[v.Name]:FindFirstChild("HumanoidRootPart") then
                repeat
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = v[v.Name].HumanoidRootPart.CFrame
                    end)
                    wait()
                    print(v)
                    player.Backpack.Input:FireServer("m1")
                until v == nil or v.Parent == nil or not v:FindFirstChild("Health") or v.Health.Value <= 0
            end
        end
        wait(.25)
    until #workspace.Enemy:GetChildren() == 0
end

-- Destructable Check
repeat
    local amount = 0
    for i,v in pairs(workspace.Dungeon.Destructable:GetChildren()) do
        if v:FindFirstChild("Center") and not string.find(v.Name:lower(), "crack") and not string.find(v.Name:lower(), "torch") and not string.find(v.Name:lower(), "puddle") and not string.find(v.Name:lower(), "rocks") then
            local timer = 25
            amount = amount + 1
            repeat
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = v.Center.CFrame
                end)
                wait(.1)
                player.Backpack.Input:FireServer("m1")
                timer = timer - 1
                print(v)
            until v == nil or v.Parent == nil or timer <= 0
        end
    end
    wait(.25)
until amount == 0

-- Chest Check
if #workspace.Chest:GetChildren() > 0 then
    for i,v in pairs(workspace.Chest:GetChildren()) do
        if v:FindFirstChild("Touch") and not v.Touch:FindFirstChild("Error") then
            repeat
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = v.Touch.CFrame
                end)
                wait()
            until v == nil or v.Parent == nil
        end
    end
end

-- Item Check
if #workspace.Items:GetChildren() > 0 then
    for i,v in pairs(workspace.Items:GetChildren()) do
        if not v:FindFirstChild("Cost") and v:FindFirstChild("CanUse") and v.CanUse.Value == player.Character then
            repeat
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = v.CFrame
                end)
                wait()
                player.Backpack.Input:FireServer("f")
            until v == nil or v.Parent == nil
        end
    end
end

-- Coin Check
if #workspace.Touch:GetChildren() > 0 then
    repeat
        for i,v in pairs(workspace.Touch:GetChildren()) do
            if v.Name ~= "Coin" then
                v:Destroy()
            end
            pcall(function()
                workspace.Touch:GetChildren()[1].CFrame = player.Character.HumanoidRootPart.CFrame
            end)
        end
        wait()
    until #workspace.Touch:GetChildren() == 0
end

--[[Leave
if #workspace.Enemy:GetChildren() == 0 and #workspace.Touch:GetChildren() == 0 then
    player.Character.HumanoidRootPart.CFrame = workspace.Dungeon.Stairs.Touch.CFrame
    repeat wait() until #workspace.Enemy:GetChildren() > 0
end
]]