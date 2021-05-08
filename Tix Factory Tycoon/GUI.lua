--Variable
local player = game.Players.LocalPlayer
local tycoon

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Example')

--Section
w:Section('Test')
w:Toggle('Dropper', {flag = "dropper"})
w:Toggle('Collect Gold', {flag = "gold"})
w:Toggle('Auto Deliver', {flag = "packet"})

--Check Tycoon
for i,v in pairs(workspace["Fros Studio's Tycoon Kit"].Factories:GetChildren()) do
    if v.Owner.Value == player then
        tycoon = v
    end
end

--Click
spawn(function()
    while true do
        if w.flags.dropper then
            for i,v in pairs(tycoon.PurchasedObjects:GetChildren()) do
                if string.find(v.Name, "Click") and v:FindFirstChild("Button") then
                    fireclickdetector(v.Button.ClickDetector)
                    wait()
                end
            end
        end
        wait(0.25)
    end
end)

--Gold Mine
spawn(function()
    while true do
        if w.flags.gold then
            if workspace.Game.Ores:FindFirstChild("Gold_Piece") then
                for i,v in pairs(workspace.Game.Ores["Gold_Piece"]:GetChildren()) do
                    if v:FindFirstChild("TouchInterest") then
                        firetouchinterest(v, game.Players.LocalPlayer.Character.Torso, 0)
                        wait()
                        firetouchinterest(v, game.Players.LocalPlayer.Character.Torso, 1)
                        wait(0.25)
                    end
                end
            end
            for i = 1, 3 do
                if workspace.Game.Ores:FindFirstChild("Gold_Piece_"..i) then
                    for i,v in pairs(workspace.Game.Ores["Gold_Piece_"..i]:GetChildren()) do
                        if v:FindFirstChild("TouchInterest") then
                            firetouchinterest(v, game.Players.LocalPlayer.Character.Torso, 0)
                            wait()
                            firetouchinterest(v, game.Players.LocalPlayer.Character.Torso, 1)
                            wait(0.25)
                        end
                    end
                end
            end
        end
        wait(0.25)
    end
end)

--[[ Packet Teleport ]]--
local function fail(msg)
    game:GetService"StarterGui":SetCore('SendNotification', {
        Title = "Error";
        Text = msg;
        Duration = 5;
    })
end

--Check Tycoon
for i,v in pairs(workspace["Fros Studio's Tycoon Kit"].Factories:GetChildren()) do
    if v.Owner.Value == player then
        tycoon = v
    end
end

spawn(function()
    while true do
        if w.flags.packet then
            --Check Warehouse
            local warehouse = nil
            for i,v in pairs(workspace["Fros Studio's Tycoon Kit"].Warehouses:GetChildren()) do
                if v.Owner.Value == player then
                    warehouse = v
                end
            end

            --Check Stuff
            local create
            local drop
            if tycoon.PurchasedObjects:FindFirstChild("ScannerPacketo") then
                create = tycoon.PurchasedObjects.ScannerPacketo:FindFirstChild("PacketCreate1")
                if warehouse then
                    if warehouse.PurchasedObjects:FindFirstChild("GAD01") then
                        if warehouse.PurchasedObjects.GAD01:FindFirstChild("Poort") then
                            drop = warehouse.PurchasedObjects:FindFirstChild("GAD01").Poort
                        else
                            fail("Couldn't find: Port")
                        end
                    else
                        fail("Couldn't find: Warehouse Gate")
                    end
                else
                    fail("Couldn't find: Warehouse")
                end
            else
                fail("Couldn't find: Packet Scanner")
            end

            --TP
            if (create and drop) ~= nil then
                if player.Character:FindFirstChild("BackPacks") then
                    backpack = player.Character.BackPacks:FindFirstChildOfClass("Model")
                    if backpack then
                        if backpack:FindFirstChild("Packets") and backpack.Packets:FindFirstChild("Packet") then
                            if backpack.Packets.Packet.Transparency == 1 then
                                firetouchinterest(create, game.Players.LocalPlayer.Character.Torso, 0)
                                wait()
                                firetouchinterest(create, game.Players.LocalPlayer.Character.Torso, 1)
                            else
                                firetouchinterest(drop, game.Players.LocalPlayer.Character.Torso, 0)
                                wait()
                                firetouchinterest(drop, game.Players.LocalPlayer.Character.Torso, 1)
                            end
                        else
                            fail("Couldn't find: Packets")
                        end
                    else
                        fail("Couldn't find: Backpack")
                    end
                end
            end
        end
        wait(0.25)
    end
end)