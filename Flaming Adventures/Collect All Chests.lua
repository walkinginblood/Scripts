for i = 1, 10 do 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.chests["id"..i].CFrame
	wait(0.15)
	game.ReplicatedStorage["game_events"].rf:InvokeServer("chest", "id"..i)
end