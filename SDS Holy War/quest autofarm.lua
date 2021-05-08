local player = game.Players.LocalPlayer
workspace["_Finds"].ChildAdded:Connect(function(v)
	game.ReplicatedStorage.Remotes.Functions["Quests_"..player.Name]:InvokeServer("FoundItem", string.split(v.Name, "_")[1])
end)
while true do
    game.ReplicatedStorage.Remotes.Events["Quests_"..player.Name]:FireServer("GetQuest", "Meliodas - 1")
	wait()
end