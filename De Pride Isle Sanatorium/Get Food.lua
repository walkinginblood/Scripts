for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("ClickDetector") and v.Parent.Parent.Name == "Fruit" then
		fireclickdetector(v)
	end
end