-- Settings
_G.Settings = {
    Speed = 16;
	Distance = Vector3.new(0, 0, 0);
	MinExp = 0;
	Type = "";
	Quest = ""
}

-- Get NPCs
local npcList = {}
for i,v in pairs(workspace.NPCs:GetChildren()) do
	if v.Name ~= "Doctor" and v.Name ~= "Clown" and v.Name ~= "Bald Man" then
		table.insert(npcList, v.Name)
	end
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('school on fire')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "enabled"})
w:Slider("Distance", {
	min = -40;
	max = 40;
	flag = 'distance'
 }, function(v)
	_G.Settings["Distance"] = Vector3.new(0, tonumber(v), 0)
end)
w:Box('Minimum Exp', {
	flag = "exp";
	type = 'number';
}, function(new)
	_G.Settings["MinExp"] = tonumber(new)
end)
w:Box('Speed', {
	flag = "speed";
	type = 'number';
}, function(new)
	_G.Settings["Speed"] = tonumber(new)
end)
w:Dropdown("Target", {
	location = _G;
	flag = "memes";
	list = {
		"Hero";
		"Villain";
	}
}, function(new)
	_G.Settings["Type"] = tostring(new)
end)
w:Dropdown("Quest", {
	location = _G;
	flag = "memes";
	list = npcList
}, function(new)
	_G.Settings["Quest"] = tostring(new)
end)

-- Execute check
if _G.Exe ~= true then
	_G.Exe = true
	-- Variable
	local player = game.Players.LocalPlayer

	-- NoClip
	game:GetService("RunService").RenderStepped:Connect(function()
		if w.flags.enabled then
			pcall(function()
				player.Character.Humanoid:ChangeState(11)
			end)
		end
	end)

	-- Quest
	function getQuest()
		local v = workspace.NPCs:FindFirstChild(_G.Settings["Quest"])
		if v and #player.Data.ActiveQuest:GetChildren() == 0 then
			game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame}):Play()
			wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position)/_G.Settings["Speed"])
			if player:DistanceFromCharacter(v.HumanoidRootPart.Position) < 15 then
				game.ReplicatedStorage.Remotes.Quest:InvokeServer(player.Name, v, v.Quests.Quest.Value)
			end
		end
    end
    
    -- Weapon
    local function getWep()
        if pcall(function() return player.Character.Weapon end) and #player.Character.Weapon:GetChildren() > 0 then
            return player.Character.Weapon:GetChildren()[1].Name
        end
        return "Combat"
    end

	-- Closest
	function closest()
		mobs = workspace.Mobs:GetChildren()
		distances = {}
		for i = 1, #mobs do local v = mobs[i]
			if w.flags.enabled and pcall(function() a=v.HumanoidRootPart;b=v.Humanoid;c=v.Mob.Stats.Reputation;d=v.Mob.Drops.XP;end) and v.Humanoid.Health > 0 and v.Mob.Stats.Reputation.Value == _G.Settings["Type"] and v.Mob.Drops.XP.Value >= _G.Settings["MinExp"] then
				local dist = game.Players.LocalPlayer:DistanceFromCharacter(v.HumanoidRootPart.Position)
				table.insert(distances, {npc=v;pos=dist;})
			end
		end
		table.sort(distances, function(a,b) return a["pos"] > b["pos"] end)
		if #distances > 0 then
			return distances[#distances]["npc"]
		else
			return false
		end
	end

	-- AutoFarm
	while true do
		if w.flags.enabled then
			v = nil
			getQuest()
			wait(.25)
			repeat
				v = closest()
				wait()
			until typeof(v) == "Instance" or w.flags.enabled ~= true
			game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v.HumanoidRootPart.Position+_G.Settings["Distance"])/_G.Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v.HumanoidRootPart.CFrame+_G.Settings["Distance"]}):Play()
			wait(player:DistanceFromCharacter(v.HumanoidRootPart.Position+_G.Settings["Distance"])/_G.Settings["Speed"])
			repeat
				pcall(function()
					player.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) + _G.Settings["Distance"]
				end)
				wait()
				pcall(function()
					game.ReplicatedStorage.Remotes.Combat:FireServer(player, player.Character, v.HumanoidRootPart, 0, getWep())
				end)
				pcall(function()
					player.Character.Head.Billboard:Destroy()
				end)
			until w.flags.enabled ~= true or v == nil or v.Parent == nil or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
		end
		wait()
	end
end