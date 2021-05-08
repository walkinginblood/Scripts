_G.Delay = 1

if _G.Executed == nil then
	_G.Executed = true
	-- Variable
	local player = game.Players.LocalPlayer

	-- Get Player
	function plr()
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= player and v.Team ~= player.Team and pcall(function() a=v.Character.Head;b=v.Character.Humanoid;c=player.Character:FindFirstChildOfClass("Tool");d=v.Character.HumanoidRootPart;e=player.Character.HumanoidRootPart end) and v.Character.Humanoid.Health > 0 and not v.Character:FindFirstChild("ForceField") then
				return v.Character
			end
		end
		return 123
	end

	-- Ammo
	function ammo()
		if pcall(function() a=player.PlayerGui.GunGUI.AmmoFrame.Current;b=player.PlayerGui.GunGUI.AmmoFrame.Max; end) then
			local max = string.gsub(player.PlayerGui.GunGUI.AmmoFrame.Max.Text, "/ ", "")
			return {player.PlayerGui.GunGUI.AmmoFrame.Current.Text;max}
		end
		return 123
	end

	-- Kill
	while true do
		if typeof(ammo()) == "table" and typeof(plr()) == "Instance" then
			local enemy = plr()
			local am = ammo()
			game.ReplicatedStorage.Remote["Attempt_Fire"]:FireServer(player.Character:FindFirstChildOfClass("Tool"), enemy.Head, enemy.Humanoid, enemy.HumanoidRootPart, player.Character.HumanoidRootPart.Position, nil, 0, tonumber(am[1]), tonumber(am[2]))
			wait(_G.Delay)
		end
		wait()
	end
end