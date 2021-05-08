--Quests
for i, v in ipairs(game.ReplicatedStorage[game.Players.LocalPlayer.Name].QuestCooldowns:GetChildren()) do 
	game.ReplicatedStorage.zabzab:FireServer(v.Name)
end