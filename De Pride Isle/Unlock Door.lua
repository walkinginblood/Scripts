local stuff = workspace.DoorsSystem:GetChildren()
for i = 1, #stuff do local v = stuff[i]
	if v:FindFirstChild("Lock") and v.Lock:FindFirstChild("Crank") and game.Players.LocalPlayer:DistanceFromCharacter(v.Lock.Crank.Position) < 15 then
		game.ReplicatedStorage.Events.Doors:FireServer("ToggleLock", v, v.Lock.Crank)
	end
end