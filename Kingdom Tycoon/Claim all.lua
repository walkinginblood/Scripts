local interactives = game:GetService("Workspace").Game.Base.Interactives:GetChildren()
for i = 1,#interactives do local v = interactives[i]
	game.ReplicatedStorage.RE.StartCapturing:FireServer(v, true)
end
