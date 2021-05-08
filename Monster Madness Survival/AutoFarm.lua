_G.Settings = {
    Distance = 3; -- Distance 
}

if _G.Executed ~= true then
    _G.Executed = true
    _G.skill = true

    -- Wait for shit to load
    repeat
        load = pcall(function()
            a = game.Players.LocalPlayer.Character.PrimaryPart;
            b = workspace.GameEvents.Interact;
            c = workspace.CharStorage.DefenderStorage;
            d = workspace.CharStorage.MonsterStorage;
        end)
        wait()
    until load

    -- Variable
    local player = game.Players.LocalPlayer
    local event = workspace.GameEvents.Interact

    -- GodMode function
    function del()
        pcall(function()
            local cl = player.Character.Humanoid.Stats.BaseArmor:Clone()
            player.Character.Humanoid.Stats.BaseArmor:Destroy()
            cl.Parent = player.Character.Humanoid.Stats
        end)
    end

    -- NoClip function
    function noclip()
        Stepped = game:GetService('RunService').Stepped:Connect(function()
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end)
        end)
    end

    -- Enemy function
    function getEn()
        for i,v in pairs(workspace.CharStorage.MonsterStorage:GetChildren()) do
            if pcall(function() a=v.Humanoid;b=v.HumanoidRootPart;c=workspace.CharStorage.DefenderStorage[player.Name];d=v.Humanoid.Stats.IsBoss end) and v.Humanoid.Health > 0 and v.Humanoid.Stats.IsBoss.Value == true then
                return v
            end
        end
        for i,v in pairs(workspace.CharStorage.MonsterStorage:GetChildren()) do
            if v.Name ~= "Cute Robo" and v.Name ~= "Cube Robo" and v.Name ~= "Poultrygeist" and v.Name ~= "Chicken" and v.Name ~= "Carrottortoise" and pcall(function() a=v.Humanoid;b=v.HumanoidRootPart;c=workspace.CharStorage.DefenderStorage[player.Name];d=v.Humanoid.Stats.IsBoss end) and v.Humanoid.Health > 0 then
                return v
            end
        end
        for i,v in pairs(workspace.CharStorage.MonsterStorage:GetChildren()) do
            if pcall(function() a=v.Humanoid;b=v.HumanoidRootPart;c=workspace.CharStorage.DefenderStorage[player.Name];d=v.Humanoid.Stats.IsBoss end) and v.Humanoid.Health > 0 then
                return v
            end
        end
        return false
    end

    -- Move function
    function useMov(v)
        _G.skill = false
        for i = 1, 3 do
            if pcall(function() a=player.PlayerGui.MainMenu.Background["Move_Frame"]["Move1Button"] end) then
                local button = player.PlayerGui.MainMenu.Background["Move_Frame"]["Move"..i.."Button"]
                if button.BackgroundColor3 ~= Color3.new(50/255, 50/255, 50/255) then
                    local timer = 20
                    repeat
                        workspace.GameEvents.ChangeMove:FireServer(i)
                        wait()
                        timer = timer - 1
                    until button == nil or button.Parent == nil or button.BorderSizePixel == 5 or timer <= 0
                    local timer = 20
                    repeat
                        pcall(function()
                            event:FireServer(v.HumanoidRootPart.Position, workspace, Enum.NormalId.Top)
                            player.Character.Humanoid.Stats.updateMouseP:FireServer(v.HumanoidRootPart.Position.x, v.HumanoidRootPart.Position.y, v.HumanoidRootPart.Position.z)
                        end)
                        wait()
                        timer = timer - 1
                    until button.BackgroundColor3 ~= Color3.new(85/255, 170/255, 255/255) or timer <= 0 or v == nil or v.Parent == nil or not v:FindFirstChild("HumanoidRootPart")
                end
            end
        end
        _G.skill = true
    end

    -- Loop
    while true do
        if workspace.CharStorage.DefenderStorage:FindFirstChild(player.Name) then
            repeat
                del()
                local v = false
                repeat
                    v = getEn()
                    wait(0.25)
                until v
                noclip()
                repeat
                    pcall(function()
                        player.Character.PrimaryPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, _G.Settings["Distance"])
                    end)
                    wait()
                    if _G.skill and v:FindFirstChild("HumanoidRootPart") then
                        spawn(function()
                            useMov(v)
                            wait()
                        end)
                    end
                    wait()
                until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or workspace:FindFirstChild(player.Name)
                Stepped:Disconnect()
                wait()
            until workspace:FindFirstChild(player.Name)
        end
        wait(0.25)
        if workspace:FindFirstChild(player.Name) then
            repeat
                pcall(function()
                    if workspace.Lobby.Portal.Transparency ~= 1 then
                        player.Character.PrimaryPart.CFrame = workspace.Lobby.Portal.CFrame
                        wait(1)
                    end
                end)
                wait()
            until workspace.CharStorage.DefenderStorage:FindFirstChild(player.Name)
        end
        wait(0.25)
    end
end