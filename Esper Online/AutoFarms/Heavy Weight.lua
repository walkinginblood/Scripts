_G.Enabled = true; --Toggle On/Off

--Variable
local player = game.Players.LocalPlayer

--Auto Weight
player.Character.ChildRemoved:Connect(function(thing)
	if _G.Enabled and thing.Name == "HEAVY WEIGHT" then 
		game.ReplicatedStorage.Remotes.Client.PurchaseHandler:FireServer("HEAVY WEIGHT")
		repeat
			wait()
		until player.Backpack:FindFirstChild("HEAVY WEIGHT")
		player.Character.Humanoid:EquipTool(player.Backpack["HEAVY WEIGHT"])
		while player.Character:FindFirstChild("HEAVY WEIGHT") do
			game.Players.LocalPlayer.Character["HEAVY WEIGHT"].Remote:FireServer()
			wait()
		end
	end
end)

--Startup
if _G.Enabled then
	game.ReplicatedStorage.Remotes.Client.PurchaseHandler:FireServer("HEAVY WEIGHT")
	repeat
		wait()
	until player.Backpack:FindFirstChild("HEAVY WEIGHT") or _G.Enabled == false
	player.Character.Humanoid:EquipTool(player.Backpack["HEAVY WEIGHT"])
	while player.Character:FindFirstChild("HEAVY WEIGHT") do
		player.Character["HEAVY WEIGHT"].Remote:FireServer()
		wait()
	end
end