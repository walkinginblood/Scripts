_G.Enabled = true; --Toggle On/Off

--Variable
local remotes = game.ReplicatedStorage.Remotes
local player = game.Players.LocalPlayer

--Farm
while _G.Enabled do
	for i,v in pairs(workspace.gameParts.npcFolder:GetChildren()) do
		if _G.Enabled and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			remotes.dealDamageHelper:FireServer("Green Impale", "2-63-7073-7")
			repeat 
				remotes.dealDamage:FireServer(v.Humanoid, "Green Impale", os.time(), 1)
				wait()
			until _G.Enabled == false or v.Humanoid.Health <= 0
		end
	end
	wait()
end