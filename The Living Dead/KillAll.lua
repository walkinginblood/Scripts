for i,v in pairs(workspace.commonInfected:GetChildren()) do
	pcall(function()
		workspace.resources.events.humTakeDamage:FireServer(v.Humanoid, 1000, v.Head)
	end)
end