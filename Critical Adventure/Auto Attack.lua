local player = game.Players.LocalPlayer
while wait() do
	if workspace:FindFirstChild("CombatFolder") and workspace.CombatFolder:FindFirstChild(player.Name) then
		for i,v in pairs(workspace.CombatFolder[player.Name]:GetChildren()) do
			pcall(function()
				player.Character.HumanoidRootPart.CFrame = v.Part.CFrame + Vector3.new(0, 15, 0)
			end)
			wait(1)
            player.Character.ItemActivate:FireServer(player.Character.ActiveItems["Ignite Scroll"])
		end
	else
		player.Character.HumanoidRootPart.CFrame = workspace.Enemies.Highland.Enemy.EnemyLocation.CFrame + Vector3.new(2, 2, 2)
	end
    game.ReplicatedStorage.Remotes.StatsChange:FireServer("Damage")
end