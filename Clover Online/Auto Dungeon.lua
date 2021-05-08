--[[
	Made by Megumu#8008
	<3

	1 = Easy
	2 = Normal
	3 = Hard
	4 = Expert
	5 = Demon

	Weapon name is case sensitive
	If you don't have a sword, keep it at "Punch"
]]

_G.Diff = 5
_G.Weapon = "Wooden Scythe"

-- Check for game
if game.PlaceId == 1227840523 then 
	
    -- Loading
    local load
    repeat
        load = pcall(function()
            a = game.Players.LocalPlayer.Name;
            b = game.ReplicatedStorage[game.Players.LocalPlayer.Name].QuestCooldowns;
            c = game.ReplicatedStorage.zabzab;
            d = game.ReplicatedStorage.DungeonRemote;
        end)
        wait(0.25)
    until load

	--Quests
	for i, v in ipairs(game:GetService("ReplicatedStorage")[game:GetService("Players").LocalPlayer.Name].QuestCooldowns:GetChildren()) do 
		game.ReplicatedStorage.zabzab:FireServer(v.Name)
	end

	--Join Dungeon
	game.ReplicatedStorage.DungeonRemote:InvokeServer(_G.Diff)

	--Credits
	loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()
else
	    -- Loading
        local load
        repeat
            load = pcall(function()
                a = game.Players.LocalPlayer.Character.HumanoidRootPart;
                b = workspace.StartWavesPart;
                c = game.ReplicatedStorage[game.Players.LocalPlayer.Name].Character.Weapon.Value
            end)
            wait(0.25)
        until load

	--Credits
	loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

	--Variable
	local player = game:GetService("Players").LocalPlayer

	--Start Waves
	repeat
		player.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("StartWavesPart").CFrame
		wait(0.25)
	until not workspace:FindFirstChild("StartWavesPart")

	--Safezone
    local plat = Instance.new("Part", workspace)
    plat.Size = Vector3.new(300, 2, 300)
    plat.CFrame = CFrame.new(1, 1, 1)
    plat.Anchored = true
    wait()
    player.Character.HumanoidRootPart.CFrame = plat.CFrame + Vector3.new(0, 15, 0)

	--Clear Waves
	while wait() do 
		if workspace:FindFirstChild("Mobs") then 
			for i, v in ipairs(workspace.Mobs:GetChildren()) do
				if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
					repeat 
						game.ReplicatedStorage.Core:FireServer("TouchDamage", game.ReplicatedStorage[game.Players.LocalPlayer.Name].Character.Weapon.Value, v.Name, Color3.new(), Vector3.new(), Vector3.new())
						wait(0.3)
					until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
				end
			end
		end
	end
end