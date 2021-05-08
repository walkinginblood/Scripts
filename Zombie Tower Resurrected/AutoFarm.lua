-- Variable
local player = game.Players.LocalPlayer

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
    player.Character.Humanoid:ChangeState(11)
end)

-- Loop
while wait() do
    -- Wait for boss
    repeat wait() until pcall(function() return workspace.spawns.Spawners["Floor 29"] end)
    for i = 1, 29 do
        if workspace.spawns.Spawners:FindFirstChild("Floor "..i) then
            local floor = workspace.spawns.Spawners["Floor "..i]:GetDescendants()
            for i = 1, #floor do local v = floor[i]
                if v:IsA("TouchTransmitter") then
                    v.Parent.CFrame = player.Character.HumanoidRootPart.CFrame
                    wait()
                    v:Destroy()
                end
            end
        end
    end
    wait(1)

    -- Kill Boss
    repeat
        local shit = workspace.spawns.Spawners:GetDescendants()
        for i = 1, #shit do local v = shit[i]
            if v:FindFirstChild("Head") and v:FindFirstChild("Zombie") and v.Name ~= "Bombie" and v.Name ~= "Radioactive" and v.Name ~= "Hazmat" then
                print(v:GetFullName())
                local tcc = tick()
                repeat
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = v.Head.CFrame + Vector3.new(0,5,0)
                        player.Character.ServerMain.Melee:FireServer("Knife", v.Head, 0.35)
                    end)
                    wait()
                until not pcall(function() return v.Head,v.Zombie end) or v.Zombie.Health <= 0 or tick() - tcc >= 10 or #workspace.spawns:GetChildren() == 0
            end
        end
        wait(.25)
    until #workspace.spawns:GetChildren() == 0
end