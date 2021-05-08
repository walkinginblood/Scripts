Stepped = game:GetService('RunService').Stepped:Connect(function()
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end)
end)
while wait() do
	for i,v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("maxHealth") and v:FindFirstChild("MoveHere") and v:FindFirstChild("Health") then
			repeat
				pcall(function()
					game.ReplicatedStorage.JobRemotes.Mining:FireServer(v.MoveHere)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.MoveHere.CFrame + Vector3.new(0, -8, 0)
				end)
				wait()
			until v == nil or v.Parent == nil or not v:FindFirstChild("Health") or v.Health.Value <= 0
		end
	end
end
