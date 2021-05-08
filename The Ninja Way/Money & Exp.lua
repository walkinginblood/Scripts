while wait() do
	game:GetService("ReplicatedStorage").Events.Missions["Mission_Accepted"]:FireServer(15)
	game:GetService("ReplicatedStorage").Events.Missions["Update_MissionState_Request"]:FireServer(15, true)
	game:GetService("ReplicatedStorage").Events.Missions["Update_MissionState_Request"]:FireServer(15, "Finished", "Universal")
end