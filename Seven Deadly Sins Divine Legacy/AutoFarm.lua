--[[
	Made by Megumu/Mommy Mango
	<3
	NOTE: You need Synapse X or ProtoSmasher for AutoQuest
]]

--Settings
_G.Enabled = true --Toggle On/Off
_G.AutoStrength = true --Automatically spend points in Strength
_G.ModCheck = true --Automatically kicks you if staff joins your game
_G.AutoQuest = "Gilthunder" --Set to "Disabled" to turn off
_G.NPC = "Boar" --Target NPC
_G.Speed = 200 --TP Speed
_G.Distance = -10 --TP Distance
_G.Tries = 160 --How many times it will try to attack before switching to another target (to prevent getting stuck)

--Variable
local work = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local mods = {
	["Froredion"] = true,
	["Celigord"] = true,
	["RamirDev"] = true,
	["Sir_Cyndaquil"] = true,
	["CelestalDev"] = true,
	["Kantras"] = true,
	["i_Psychoz"] = true,
	["TheLegendPC"] = true,
	["Trust_issue"] = true,
	["Alternative_Chi"] = true,
	["SinfulDelicacy"] = true,
	["svinsaas"] = true,
	["sclawensky"] = true,
	["Narziil"] = true,
	["Endless_Destruction"] = true,
	["iSleepyNora"] = true,
	["ExcellentKgamingXX"] = true,
	["Budster2002"] = true,
	["ninjabulletstorm"] = true,
	["NamelessOverseer"] = true,
}

--Click
function click(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then
		--ProtoSmasher
		click_detector(part, 1)
	else
		player:Kick("S^X & Proto ONLY")
		wait()
		while true do end
	end
end

--Check
function check(child)
	if child and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") then
		return true
	else
		return false
	end
end

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and check(player.Character) then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
		if _G.Enabled == false and Stepped then 
			Stepped:Disconnect()
		end
	end)
end

--Find Nearest
function nearest(Pose)
	local Closest
	local Distance = math.huge
	for _,v in pairs(work:GetChildren()) do
		if string.find(v.Name, _G.NPC) and check(v) and player.Character and check(player.Character) then 
			local newDistance = (v.HumanoidRootPart.Position - Pose).magnitude
			if newDistance < Distance then
				Closest = v.HumanoidRootPart
				Distance = newDistance
			end
		end
	end
	return Closest
end

function modcheck()
	for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
		if mods[v.Name] then 
			player:Kick("Mod joined your game")
		end
	end
end

--Equip
function equip()
    if player.Character:FindFirstChildOfClass("Tool") then
        return
    elseif player.Backpack:FindFirstChildOfClass("Tool") then
        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
        repeat wait() until player.Character:FindFirstChildOfClass("Tool")
    end
end

--Quest
function quest()
	if player.Quests.Mobs.Value == "None" and _G.AutoQuest ~= "Disabled" then 
		for i, v in ipairs(work:GetChildren()) do
			if string.find(v.Name, _G.AutoQuest) and v:FindFirstChild("ClickDetector") then 
				if v:FindFirstChildOfClass("MeshPart") then
					asdf = v:FindFirstChildOfClass("MeshPart")
				elseif v:FindFirstChildOfClass("Part") then
					asdf = v:FindFirstChildOfClass("Part")
				else
					return
				end
				game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(asdf.Position or asdf.Position)/_G.Speed, Enum.EasingStyle.Linear), {CFrame = asdf.CFrame + Vector3.new(0, _G.Distance, 0)}):Play()
        		wait(player:DistanceFromCharacter(asdf.Position)/_G.Speed)
				repeat click(v:FindFirstChildOfClass("ClickDetector")) wait(0.2) until player.PlayerGui:FindFirstChild("QuestUi") or _G.Enabled == false
				RS.Quests.getQuest:InvokeServer(_G.AutoQuest)
				wait()
				if player.PlayerGui:FindFirstChild("QuestUi") then 
					player.PlayerGui.QuestUi:Destroy()
				end
			end
		end
	end
end

--TP
function farm()
    if player.Character and check(player.Character) then
        local nearest = nearest(player.Character.HumanoidRootPart.Position)
        if nearest == nil then 
            return
        end
		quest()
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(nearest.Position)/_G.Speed, Enum.EasingStyle.Linear), {CFrame = nearest.CFrame + Vector3.new(0, _G.Distance, 0)}):Play()
        wait(player:DistanceFromCharacter(nearest.Position)/_G.Speed)
        local amount = 0
        repeat
            if player.Character and check(player.Character) and nearest.Parent ~= nil then
                player.Character.HumanoidRootPart.CFrame = nearest.CFrame + Vector3.new(0, _G.Distance, 0)
                equip()
                wait()
                RS.dmg:FireServer(nearest.Parent.Humanoid, nearest)
                amount = amount + 1
            end
            if _G.AutoStrength then
                RS.GUIRemote.StatsPlus:FireServer("Strength", 1)
                wait()
            end
			if _G.ModCheck then 
				modcheck()
			end
            wait()
        until nearest == nil or nearest.Parent == nil or nearest.Parent.Humanoid.Health <= 0 or _G.Enabled == false or amount >= _G.Tries
    end
end

--Start NoClip
noclip()

--Loop
while _G.Enabled do 
	farm()
	wait()
end