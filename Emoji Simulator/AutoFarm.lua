_G.Settings = {
	Auto = true;
}

--Get Current
for i, v in pairs(workspace.ActiveHearts:GetChildren()) do
	game.ReplicatedStorage.Remotes.UseHeart:FireServer(v, "Spawn")
end

--Get Future
if _G.Settings["Auto"] then 
	workspace.ActiveHearts.ChildAdded:Connect(function(v)
		if _G.Settings["Auto"] then 
			wait()
			game.ReplicatedStorage.Remotes.UseHeart:FireServer(v, "Spawn")
		end
	end)
end