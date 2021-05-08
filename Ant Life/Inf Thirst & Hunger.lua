local player = game.Players.LocalPlayer

while wait() do 
    if player.Character and player.Character:FindFirstChild("Stats") then
        if player.Character.Stats.Hunger.Value <= 99 then
            game.ReplicatedStorage.Remotes.Handler:FireServer("Eat", workspace.LeafTear)
        end
        if player.Character.Stats.Thirst.Value <= 99 then
            game.ReplicatedStorage.Remotes.Handler:FireServer("Drink", workspace.Water)
        end
    end
end