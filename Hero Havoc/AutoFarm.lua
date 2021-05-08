_G.enemy = "Combatree"

while true do
	local mm = workspace.EnemyModels
	for i,v in pairs(mm:GetChildren()) do if v.Name == "Face" then v:Destroy() end end
	if #mm:GetChildren()<=1 then
		spawn(function()
			game.ReplicatedStorage.RemoteEvents.BattleEvents.BattleInitiate:InvokeServer("Combatree")
		end)
		mm.ChildAdded:wait()
	end
	wait(2)
	repeat
		for i,v in pairs(mm:GetChildren()) do
			if string.find(v.Name, "Enemy") then
				spawn(function()
					game.ReplicatedStorage.RemoteEvents.BattleEvents.BattleClick:InvokeServer(game.ReplicatedStorage.PlayerFolder[game.Players.LocalPlayer.Name].CurrentBattle[v.Name])
				end)
				wait()
			end
		end
		wait(.1)
		if mm:FindFirstChild("Drops") and #mm.Drops:GetChildren()>0 then
			game.ReplicatedStorage.RemoteEvents.BattleEvents.BattlePickup:FireServer(mm.Drops:GetChildren()[1].Name)
			mm.Drops:GetChildren()[1]:Destroy()
		end
	until #mm:GetChildren()<=1
	wait()
end