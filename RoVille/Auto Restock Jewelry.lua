while wait() do
    for i,v in pairs(workspace.Properties[game.Players.LocalPlayer.Name].Builds:GetChildren()) do
        if v.Name == "Jewelry Display" then
            local amount = 0
            for i2,v2 in pairs(v:GetChildren()) do
                if v2:IsA("MeshPart") and string.find(v2.Name, "/") and v2.Transparency > 0 then
                    amount = amount+1
                end
            end
            if amount == 18 then
                game.ReplicatedStorage.ActionEvents["Restock - $11424"]:FireServer(v)
                wait(2)
            end
        end
    end
end
