local player = game.Players.LocalPlayer

while wait() do
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name:lower(), "lv.") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("Head") then
            repeat
                pcall(function()
                    player.Character.Combat.Damage:FireServer(player.PlrStats.Stats.Money, v.Head, Vector3.new())
                end)
                wait()
            until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") and v.Humanoid.Health < 0
        end
    end
end