local player = game.Players.LocalPlayer
while wait() do
    local sharks = workspace:GetChildren()
    for i = 1, #sharks do local v = sharks[i]
        if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
        pcall(function()
            player.Character.PrimaryPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 25, 0)
        end)
        wait()
            if player.Character:FindFirstChildOfClass("Tool") then
                game.ReplicatedStorage.CloudClientResources.Communication.Events.DamageSeaMonster:FireServer(v, v.Health, true)
            elseif player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() >= 1 then
                for _,k in pairs(player.Backpack:GetChildren()) do
                    if k:FindFirstChild("Damage") then
                        k.Parent = player.Character
                    end
                end
            end
        end
    end
    if player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() >= 2 then
        for i,v in pairs(player.Backpack:GetChildren()) do
            if not v:FindFirstChild("Damage") then
                game:GetService("ReplicatedStorage").CloudClientResources.Communication.Functions.SellItem:InvokeServer(v.Name, 1)
            end
        end
    end
end