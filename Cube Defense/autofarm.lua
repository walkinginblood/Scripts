if PROTOSMASHER_LOADED and getwally then
    repeat wait() until game:IsLoaded()
    loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()
    if game.PlaceId == 2286901071 then
        repeat wait() until pcall(function() return game.ReplicatedStorage.Events.CreateCustomMatchEvent, game.ReplicatedStorage.Events.LaunchMatchRoomEvent end)
        local events = game.ReplicatedStorage.Events
        local lobby = events.CreateCustomMatchEvent:InvokeServer(false, "0", "0", 1, "Classic Co-op")
        repeat wait() until lobby ~= nil
        events.LaunchMatchRoomEvent:InvokeServer(game.Players.LocalPlayer.Name)
    else
        repeat wait() until pcall(function() return game.ReplicatedStorage.Events["Place Structure"] end)
        wait(38)
        if not workspace:FindFirstChild("Map") then
            game:GetService("TeleportService"):Teleport(2286901071)
            return
        end
        wait(1)
        for i,v in pairs(workspace.Map.Misc:GetChildren()) do
            if v.Name == "Chest" then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        local foot = game.Players.LocalPlayer.Character.LeftFoot.Position
        for i = -50, 50 do
            for e = -50, 50 do
                game.ReplicatedStorage.Events["Place Structure"]:FireServer("Light Turret", Vector3.new(math.floor(foot.x) + e, math.floor(foot.y) + 2, math.floor(foot.z) + i), 0, workspace.Map.Regions:GetChildren()[1], false)
                wait()
                if #workspace.Map.Towers:GetChildren() > 0 then
                    return
                end
            end
            wait(.25)
        end
    end
else
    IB_CRASH()
end