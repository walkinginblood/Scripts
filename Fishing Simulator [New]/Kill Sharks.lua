local sharks = workspace:GetChildren()
for i = 1, #sharks do local v = sharks[i]
	if v:FindFirstChild("Health") then
		game.ReplicatedStorage.CloudClientResources.Communication.Events.DamageSeaMonster:FireServer(v, v.Health, true)
	end
end