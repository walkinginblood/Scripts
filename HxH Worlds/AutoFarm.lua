_G.Timer = 6 --Timer before force teleport (if you get stuck)
_G.Distance = 12.5 --How far down you want to teleport
_G.Enabled = false --Toggle on/off
_G.Beasts = { --Target List
	["Wolf"] = true,
	["Brown Bear"] = true,
	["Rabid Wolf"] = true,
	["Belfos"] = true,
	["Demon Belfos"] = true,
}

--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")

--Check
local function check(thing)
	if thing:FindFirstChild("Humanoid") and thing:FindFirstChild("HumanoidRootPart") and thing.Humanoid.Health > 0 then 
		return true
	else
		return false
	end
end

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    if check(player.Character) then 
        player.Character.Humanoid:ChangeState(10)
    end
	if _G.Enabled == false then 
		Stepped:Disconnect()
	end
end)

--Attack
local function Attack(thing)
	local oldxp = player.Persistance.Data.Stats.Exp.Value
	local oldlevel = player.Persistance.Data.Stats.Level.Value
	local tim = _G.Timer*22
	repeat
		if check(thing) and check(player.Character) then 
			player.Character.HumanoidRootPart.Anchored = true
			player.Character.HumanoidRootPart.CFrame = thing.HumanoidRootPart.CFrame + Vector3.new(0, tonumber("-".._G.Distance), 0)
			wait()
			if player.Character:FindFirstChild("Remotes") then 
				player.Character.HumanoidRootPart.Anchored = false
				wait()
				player.Character.Remotes.CombatEvent:FireServer(thing:FindFirstChild("Body"), true, "Right Kick")
			end
			tim = tim - 1
		end
		wait()
	until tim < 0 or _G.Enabled == false or oldxp < player.Persistance.Data.Stats.Exp.Value or oldlevel < player.Persistance.Data.Stats.Level.Value
	wait()
end

--Farm
while _G.Enabled do
	for i, child in ipairs(work.NPCs.Enemies.Beasts:GetChildren()) do 
		if _G.Enabled and _G.Beasts[child.Name] and child.Stats.Health.Value > 0 and check(child) and check(player.Character) then 
			Attack(child)
		end
	end
	wait()
end