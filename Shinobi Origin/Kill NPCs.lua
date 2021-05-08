for i,v in pairs(workspace.npc:GetChildren()) do
	if v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 then
		v.Humanoid.Health = 0
	end
end