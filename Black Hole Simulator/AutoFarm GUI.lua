--Variable
local player = game.Players.LocalPlayer
local remotes = game.ReplicatedStorage.Remotes

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Auto Farm')

--Section
w:Section('Discord: PXdNwN5')

--Toggle
w:Toggle('Bricks', {flag = "enabled"})

--Auto Buy
w:Section("Auto Buy")
w:Toggle('Black Hole',{flag = "black"})
w:Toggle('Energy',{flag = "energy"})
w:Toggle('Legend',{flag = "legend"})

--Auto Sell
w:Section("Auto Sell")
w:Toggle("Enabled",{flag = "sell"})
w:Toggle("Fill",{flag = "fill"})

--Remove Light
workspace.Essentials.Interact.Sell["1"].PointLight:Destroy()

--Check
local function check()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
        return true
    else
        return false
    end
end

--Delete
local function delete()
    if check() and player.Character:FindFirstChildOfClass("Model") then
        player.Character:FindFirstChildOfClass("Model"):Destroy()
    end
end

--NoClip
spawn(function()
    while wait(0.25) do
        if w.flags.enabled and tostring(Stepped) ~= "Connection" then
            Stepped = game:GetService('RunService').Stepped:Connect(function()
                if check() then 
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end)
        elseif not w.flags.enabled and Stepped then
            Stepped:Disconnect()
            Stepped = nil
        end
    end
end)

--Auto Farm
spawn(function()
    while true do
        if w.flags.enabled then
            for i,v in pairs(workspace.Essentials.Objects[1]:GetDescendants()) do
                if w.flags.enabled and v.Name == "Hitbox" and v:IsA("Part") and v.Parent and v.Parent:IsA("Model") and not game.Players:FindFirstChild(v.Parent.Name) then
                    repeat
                        delete()
                        if check() then
                            player.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 3)
                        end
                        wait()
                    until v == nil or v.Parent == nil
                end
            end
        end
        wait()
    end
end)

--Auto Buy
spawn(function()
    while true do
        if w.flags.black then
            for i,v in pairs(game.ReplicatedStorage.BlackHoleModels:GetChildren()) do
                remotes.ShopPurchase.Power:InvokeServer(v.Name)
            end
        end
        wait(0.1)
        if w.flags.energy then
            for i,v in pairs(game.ReplicatedStorage.EnergyModels:GetChildren()) do
                remotes.ShopPurchase.Size:InvokeServer(v.Name)
            end
        end
        wait(0.1)
        if w.flags.legend then
            for i,v in pairs(game.ReplicatedStorage.LegendModels:GetChildren()) do
                remotes.ShopPurchase.Legend:InvokeServer(v.Name)
            end
        end
        wait(0.1)
    end
end)

--Auto Sell
spawn(function()
    while true do
        if w.flags.sell then
            if w.flags.fill then
                if player.hiddenstats.Bricks.Value >= player.hiddenstats.MaxBricks.Value then
                    local old = workspace.Essentials.Interact.Sell["1"].CFrame
                    workspace.Essentials.Interact.Sell["1"].CFrame = player.Character.HumanoidRootPart.CFrame
                    wait()
                    workspace.Essentials.Interact.Sell["1"].CFrame = old
                end
            else
                local old = workspace.Essentials.Interact.Sell["1"].CFrame
                if check() then
                    workspace.Essentials.Interact.Sell["1"].CFrame = player.Character.HumanoidRootPart.CFrame
                end
                wait(0.1)
                workspace.Essentials.Interact.Sell["1"].CFrame = old
            end
        end
        wait(0.25)
    end
end)