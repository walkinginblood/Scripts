while wait(0.1) do
    local children = workspace.Chests:GetChildren()
    for i, child in ipairs(children) do
        game.ReplicatedStorage.Events.RemoteEvent:FireServer("GiftItems", child.Name)
    end
end