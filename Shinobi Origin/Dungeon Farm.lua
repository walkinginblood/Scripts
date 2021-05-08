getgenv().Rank = "D"

repeat wait() until game.Players.LocalPlayer
local player = game.Players.LocalPlayer
if game.PlaceId == 3130251992 then
	repeat wait() until player:FindFirstChild("choosevill") and player:FindFirstChild("village")
	if player.village.Value == "" then
		player.choosevill:FireServer("join","Iwagakure")
	else
		player.choosevill:FireServer(player.village.Value)
	end
	repeat wait() until player.Character and player.Character:FindFirstChild("combat") and player.Character.combat:FindFirstChild("update")
	while wait(5) do
		player.Character.combat.update:FireServer("TPmission", getgenv().Rank)
	end
elseif game.PlaceId == 3906545704 then
	repeat wait() until player.Character and player.Character:FindFirstChild("combat") and player.Character.combat:FindFirstChild("update")
	while wait(1) do
		player.Character.combat.update:FireServer("mmo")
	end
else
	repeat wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	repeat wait() until workspace:FindFirstChild("map") and workspace.map:FindFirstChild("Model") and workspace.map.Model:FindFirstChild("leave")
	spawn(function()
		while wait() do
			for i,v in pairs(workspace:GetChildren()) do
				if v.Name == "scroll" then
					v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					wait()
				end
			end
		end
	end)
	while wait() do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.map.Model.leave.CFrame
		for i,v in pairs(workspace.npc:GetChildren()) do
			if v:FindFirstChild("Humanoid") then
				v.Humanoid.Health = 0
			end
		end
	end
end