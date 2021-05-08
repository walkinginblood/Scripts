if getgenv().Exe == nil then
    getgenv().Exe = true;
    --Variable
    local player = game.Players.LocalPlayer
    local events = game.ReplicatedStorage.Events

    --Library
    local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

    --Main
    local w = library:CreateWindow('DBS3 Beta')

    --Credit Tab
    local cred = library:CreateWindow('Credits')

    --Credits
    cred:Section('Scripts: Megumu')
    cred:Section('UI Library: wally')

    --Top
    w:Section('Made by Megumu')

    --Toogles
    local t = w:Toggle('GodMode', {flag = "god"})
    local t = w:Toggle('Player AutoFarm', {flag = "farm"})

    --Buttons
    local b = w:Button("Kill Others", function()
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                Arguments = {
                    {
                        [1] = v.Character,
                        [2] = 0.1,
                        [3] = 2356012642,
                        [4] = 0.5,
                        [5] = 0.1,
                        [6] = false,
                        [7] = "Backwards",
                        [8] = false,
                        [9] = false,
                        [10] = "SmallHits",
                        [11] = math.huge,
                        [12] = "E"
                    };
                };
                game.ReplicatedStorage.Events.DamageEvent:FireServer(unpack(Arguments))
            end
        end
    end)

    egg = {}
    for i,v in pairs(workspace.World.NPC:GetChildren()) do
        table.insert(egg, v.Name)
    end

    w:Dropdown("NPCs", {
        location = _G;
        flag = "memes";
        list = egg
        }, function(new)
        player.Character.HumanoidRootPart.CFrame = workspace.World.NPC[new].HumanoidRootPart.CFrame
        print(_G.memes)
    end)

    --Variable
    local player = game.Players.LocalPlayer
    local events = game.ReplicatedStorage.Events

    --Player Farm
    spawn(function()
        while wait() do
            if w.flags.farm then
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Character then
                        game.ReplicatedStorage.Events.DamageEvent:FireServer({[1] = v.Character,[2] = 0.1,[3] = 2356012642,[4] = 0.5,[5] = 0.1,[6] = false,[7] = "Backwards",[8] = false,[9] = false,[10] = "SmallHits",[11] = math.huge,[12] = "E"})
                    end
                end
            end
        end
    end)

    --Auto
    while wait(1) do
        --GodMode
        if w.flags.god then
            if player.Character and player.Character:FindFirstChild("ValueFolder") then
                if player.Character.ValueFolder:FindFirstChild("MaxHealth") then
                    if player.Character.ValueFolder.MaxHealth.Value ~= "" then
                        player.Character.ValueFolder.MaxHealth:Destroy()
                        local e = Instance.new("NumberValue", player.Character.ValueFolder)
                        e.Name = "MaxHealth"
                    end
                end
                if player.Character.ValueFolder:FindFirstChild("Health") and tostring(player.Character.ValueFolder.Health.Value) ~= "inf" then
                    Arguments = {
                        {
                            [1] = game.Players.LocalPlayer.Character,
                            [2] = 0.1,
                            [3] = 2356012642,
                            [4] = 0.5,
                            [5] = 0.1,
                            [6] = false,
                            [7] = "Backwards",
                            [8] = false,
                            [9] = false,
                            [10] = "SmallHits",
                            [11] = -math.huge,
                            [12] = "E"
                        };
                    };
                    game.ReplicatedStorage.Events.DamageEvent:FireServer(unpack(Arguments))
                end
            end
        end
    end
else
	print("Already executed!")
end