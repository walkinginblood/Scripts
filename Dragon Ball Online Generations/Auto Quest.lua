--Service
local rs = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")

--Variable
local player = players.LocalPlayer
local questbin = rs.DataStorage[player.Name].Data.Slot1.QuestBin

--Get Quests
while wait() do
	pcall(function()
		rs.Events.StartQuest:InvokeServer("Earth", "Caring For a Friend")
		repeat wait() until player:FindFirstChild("Quest") and player.Quest:FindFirstChild("Requirements")
		for i2,v2 in pairs(player.Quest.Requirements:GetChildren()) do
			rs.Events.StartQuest:InvokeServer("Earth", "Requirement Given", v2)
		end
	end)
end