-- Settings
_G.enemy = "Green Slime" -- Enemy you want to fight
_G.sell = true -- Sell runes

-- Varible
local player = game.Players.LocalPlayer
local auto = Instance.new("Part", player)
auto.Name = "Auto"

-- Rune Check
spawn(function()
	while wait(.2) do
		if workspace.Misc:FindFirstChild(player.Name) then
			local models = {}
			for i,v in pairs(workspace.Misc[player.Name]:GetChildren()) do
				if v:IsA("Model") then
					table.insert(models, v)
				end
			end
			if #models == 4 and player.PlayerGui.Everything.Rune.Visible then
				if _G.sell then
					game.ReplicatedStorage.Sell:InvokeServer(#game.HttpService:JSONDecode(player.Equipment.Value))
					player.PlayerGui.Everything.Rune.Visible = false
				else
					player.PlayerGui.Everything.Rune.Visible = false
				end
			end
		end
	end
end)

-- Activate
getsenv(player.PlayerGui.Everything.LocalScript).toggleauto(true)

-- Collect
workspace.Misc.DescendantAdded:Connect(function(v)
	game:GetService("RunService").RenderStepped:wait()
	if v and v.Parent and (v.Name == "Coin" or v.Name == "Gem") and v.Parent.Name == player.Name then
		game.ReplicatedStorage.CollectCoin:FireServer(v)
	end
end)

-- Start
getsenv(player.PlayerGui.Everything.LocalScript).RequestBattle(_G.enemy)

-- Re-Start
workspace.Misc.ChildRemoved:Connect(function(v)
	if v.Name == player.Name then
		getsenv(player.PlayerGui.Everything.LocalScript).RequestBattle(_G.enemy)
	end
end)