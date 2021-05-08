for i,v in pairs(workspace.DoorsSystem:GetDescendants()) do
	if v:IsA("ClickDetector") and v.Parent.Parent.Name == "Lock" and v.Parent:IsA("UnionOperation") and game.Players.LocalPlayer:DistanceFromCharacter(v.Parent.Position) < 20 then
		fireclickdetector(v)
	end
end