--Variable
local player = game:GetService("Players").LocalPlayer
local coffee = nil
local fish = nil

--ProtoSmasher Support
if PROTOSMASHER_LOADED then
    getgenv().fireclickdetector = click_detector
    getgenv().getconnections = get_signal_connections
end

--Tables
local sinks = {}
local sushis = {}

--Global
getgenv().Coffee = false
getgenv().Washing = false
getgenv().Cooking = false

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Auto Farm')
local q = library:CreateWindow('Auto Buy')
local c = library:CreateWindow('Credits')
local news = library:CreateWindow("What's new?")

--News
news:Section("2019-11-06")
news:Label("+ Disabled Auto Buy")
news:Label("until they fix getconnections")
news:Label("+ Unpatched")

--Credits
c:Label('UI: wally')
c:Label('Dragging: Ririchi')
c:Label('Scripts: Purity')

--Section
w:Section('Discord: PXdNwN5')

--Check
local function check()
    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

--Fire Click
local function fireButton1(button)
	for i,signal in next, getconnections(button.MouseButton1Click) do 
		signal:Fire()
	end
	for i,signal in next, getconnections(button.MouseButton1Down) do 
		signal:Fire()
	end
	for i,signal in next, getconnections(button.Activated) do 
		signal:Fire()
	end
end

--Get Stuff
local function refresh()
    for i = 1, #sinks do
        sinks[i] = nil
    end
    for i = 1, #sushis do
        sushis[i] = nil
    end
    wait()
    for i,v in pairs(workspace.Game:GetChildren()) do 
        if v:FindFirstChildOfClass("ClickDetector") and v:FindFirstChildOfClass("ClickDetector").Name ~= "ClickDetector" and v:FindFirstChild("StandHere") then
            if v:FindFirstChild("Dirty") then
                table.insert(sinks, v)
            else
                table.insert(sushis, v)
            end
        elseif v:FindFirstChild("ClickDetector") and v:FindFirstChild("Imp") and v.Imp.SurfaceGui:FindFirstChild("Coffee") then
            coffee = v
        end
    end
    for i,v in pairs(workspace.Game:GetChildren()) do
        if string.find(v.Name:lower(), "seat") then
            v:Destroy()
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "CounterFish" and v.Imp.SurfaceGui:FindFirstChild("Fish") then
            fish = v
        end
    end
end

--Start
refresh()

--Auto Farm
w:Toggle("Sushi",{flag = "sushi"})
w:Toggle("Plates",{flag = "plate"})
w:Toggle("Energy",{flag = "energy"})
w:Toggle("Tip Jar",{flag = "tip"})

--Auto Buy
q:Toggle("Coffee",{flag = "coffee"})
q:Toggle("Rice",{flag = "rice"})
q:Toggle("Vegi",{flag = "vegi"})
q:Toggle("Fish",{flag = "fish"})

--Energy Check
spawn(function()
    while true do
        if player.attributes.Energy.Value <= 20 and w.flags.energy then
            refresh()
            local split = string.split(coffee.Imp.SurfaceGui.Coffee.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) > 0 then
                getgenv().Coffee = true
                repeat
                    if check() then
                        player.Character.HumanoidRootPart.CFrame = coffee.Imp.CFrame
                    end
                    wait()
                    fireclickdetector(coffee.ClickDetector, 1)
                until player.attributes.Energy.Value > 20
                getgenv().Coffee = false
            end
        end
        wait()
    end
end)

--Counter
spawn(function()
    while true do
        if w.flags.sushi then
            local split = string.split(workspace.Counter.SurfaceGui.TextLabel.Text, " ")
            if tonumber(split[1]) > 0 then
                refresh()
                for i,v in pairs(sushis) do
                    if not getgenv().Coffee and not getgenv().Washing and player.attributes.Lv.Value >= v.Level.Value then
                        getgenv().Cooking = true
                        repeat
                            if check() then
                                player.Character.HumanoidRootPart.CFrame = v.StandHere.CFrame
                            end
                            wait()
                            fireclickdetector(v:FindFirstChildOfClass("ClickDetector"), 1)
                        until player.PlayerGui:FindFirstChild("XpGui")
                        player.PlayerGui.XpGui:Destroy()
                        getgenv().Cooking = false
                    end
                end
            end
        end
        wait()
    end
end)

--Tip jar
spawn(function()
    while wait() do
        if w.flags.tip then
            if not getgenv().Coffee and workspace.Game.TipJar.Tips.Value > 0 then
                if check() then
                    player.Character.HumanoidRootPart.CFrame = workspace.Game.TipJar.Head.CFrame
                end
                wait()
                fireclickdetector(workspace.Game.TipJar.ClickDetector)
            end
        end
    end
end)

--Plate Check
spawn(function()
    while true do
        if not getgenv().Coffee and w.flags.plate then
            local split = string.split(workspace.CounterPlatesDirty.Imp.SurfaceGui.PlatesDirty.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) ~= 0 then
                refresh()
                for i,v in pairs(sinks) do
                    if not getgenv().Coffee and not getgenv().Cooking and v.Water.Transparency == 1 then
                        getgenv().Washing = true
                        local timer = 40
                        repeat
                            if check() then
                                player.Character.HumanoidRootPart.CFrame = v.StandHere.CFrame
                            end
                            wait(0.1)
                            fireclickdetector(v:FindFirstChildOfClass("ClickDetector"), 1)
                            timer = timer - 1
                        until player.PlayerGui:FindFirstChild("XpGui") or timer <= 0
                        if player.PlayerGui:FindFirstChild("XpGui") then
                            player.PlayerGui.XpGui:Destroy()
                        end
                        getgenv().Washing = false
                    end
                end
            end
        end
        wait()
    end
end)

--Auto Buy
--[[
spawn(function()
    while true do
        --Rice
        if q.flags.rice then
            local split = string.split(workspace.CounterRice.Imp.SurfaceGui.Rice.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) <= 10 then
                if math.random(1,2) == 1 then
                    fireButton1(player.PlayerGui.BuyStock.Rice.PayP)
                else
                    fireButton1(player.PlayerGui.BuyStock.Rice.PayB)
                end
                fireButton1(player.PlayerGui.BuyStock.Rice.Buy)
                wait(0.5)
            end
        end
        wait()
        --Fish
        if q.flags.fish then
            local split = string.split(fish.Imp.SurfaceGui.Fish.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) <= 10 then
                if math.random(1,2) == 1 then
                    fireButton1(player.PlayerGui.BuyStock.Fish.PayP)
                else
                    fireButton1(player.PlayerGui.BuyStock.Fish.PayB)
                end
                fireButton1(player.PlayerGui.BuyStock.Fish.Buy)
                wait(0.5)
            end
        end
        wait()
        --Vegi
        if q.flags.vegi then
            local split = string.split(workspace.CounterVegi.Imp.SurfaceGui.Vegetable.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) <= 10 then
                if math.random(1,2) == 1 then
                    fireButton1(player.PlayerGui.BuyStock.Vege.PayP)
                else
                    fireButton1(player.PlayerGui.BuyStock.Vege.PayB)
                end
                fireButton1(player.PlayerGui.BuyStock.Vege.Buy)
                wait(0.5)
            end
        end
        wait() 
        if q.flags.coffee then
            local split = string.split(coffee.Imp.SurfaceGui.Coffee.Text, " ")
            local split2 = string.split(split[2], "/")
            if tonumber(split2[1]) == 0 then
                if math.random(1,2) == 1 then
                    fireButton1(player.PlayerGui.BuyStock.Coff.PayP)
                else
                    fireButton1(player.PlayerGui.BuyStock.Coff.PayB)
                end
                fireButton1(player.PlayerGui.BuyStock.Coff.Buy)
                wait(0.5)
            end
        end
        wait()       
    end
end)
]]

--Sit Check
spawn(function()
    while wait() do
        if check() and player.Character.Humanoid.Sit == true then
            player.Character.Humanoid.Sit = false
        end
    end
end)