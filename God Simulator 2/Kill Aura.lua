function event()
	for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
		if v:IsA("RemoteEvent") then
			return v
		end
	end
end
while wait() do
	for i,v in pairs(workspace.DestructableObjects:GetChildren()) do
		if v:FindFirstChild("BoundingBox") and v:FindFirstChild("Alive") and v.Alive.Value == true and game.Players.LocalPlayer:DistanceFromCharacter(v.BoundingBox.Position) < 30 then
			event():FireServer("UseAbility", "Ares", "Spear Throw", v.BoundingBox.CFrame, v.BoundingBox)
		end
	end
end