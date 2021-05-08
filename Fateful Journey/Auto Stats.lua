-- Stamina
local player = game.Players.LocalPlayer
if player.Data.Stamina.Value < 100 and fireclickdetector then
    repeat
        if not player.PlayerGui:FindFirstChild("NpcChatGui") then
            fireclickdetector(workspace.Llibrary.ReadPart.ClickDetector, 1)
            repeat wait(.1) until player.PlayerGui:FindFirstChild("NpcChatGui")
        end
        player.Backpack.StatEvents.TrainingEventRemote:FireServer("Start", "Stamina")
        repeat wait() until pcall(function() return player.PlayerGui.LetGui.LText end)
        local Stamina = player.Data.Stamina.Value
        repeat
            pcall(function()
                player.Backpack.StatEvents.TrainingEventRemote:FireServer(player.PlayerGui.LetGui.LText.Text:upper())
            end)
            wait()
        until Stamina ~= player.Data.Stamina.Value
        wait()
    until player.Data.Stamina.Value >= 100
end

-- Mana
local player = game.Players.LocalPlayer
if player.Data.Mana.Value < 100 and fireclickdetector then
    repeat
        if not player.PlayerGui:FindFirstChild("NpcChatGui") then
            fireclickdetector(workspace.Llibrary.ReadPart.ClickDetector, 1)
            repeat wait(.1) until player.PlayerGui:FindFirstChild("NpcChatGui")
        end
        player.Backpack.StatEvents.TrainingEventRemote:FireServer("Start", "Mana")
        repeat wait() until pcall(function() return player.PlayerGui.LetGui.LText end)
        local mana = player.Data.Mana.Value
        repeat
            pcall(function()
                player.Backpack.StatEvents.TrainingEventRemote:FireServer(player.PlayerGui.LetGui.LText.Text:upper())
            end)
            wait()
        until mana ~= player.Data.Mana.Value
        wait()
    until player.Data.Mana.Value >= 100
end

-- Strength
local player = game.Players.LocalPlayer
if player.Data.Strength.Value < 100 and fireclickdetector then
    workspace.Houses:Destroy()
    repeat
        function nearest()
            local Closest
            local Distance = math.huge
            for _,v in pairs(workspace.Boulders:GetChildren()) do
                if v.BeingUsed.Value == false and v:FindFirstChild("FullBoulder") then
                    local newDistance = (v.FullBoulder.Position - player.Character.HumanoidRootPart.Position).magnitude
                    if newDistance < Distance then
                        Closest = v.FullBoulder
                        Distance = newDistance
                    end
                end
            end
            return Closest
        end
        if nearest() then
            repeat
                pcall(function()
                    player.Character.Humanoid:MoveTo(nearest().Position)
                end)
                wait(.2)
            until nearest() and player:DistanceFromCharacter(nearest().Position) < 8
            repeat wait() fireclickdetector(nearest().ClickDetector, 1) until player.PlayerGui:FindFirstChild("TrainingGui")
            repeat
                for i,v in pairs(player.PlayerGui.TrainingGui.Frame:GetChildren()) do
                    if v.Name == "Target" then
                        player.Backpack.StatEvents.TrainingEventRemote:FireServer("Hit")
                        v:Destroy()
                        wait(.15)
                    end
                end
                wait()
            until not player.PlayerGui:FindFirstChild("TrainingGui")
            wait(.5)
        end
        wait()
    until player.Data.Strength.Value >= 100
end