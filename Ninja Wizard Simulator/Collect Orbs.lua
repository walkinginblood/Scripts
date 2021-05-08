--Variable
local player = game:GetService("Players").LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local work = game:GetService("Workspace")

--Quest
RS.Storage.Events.QuestDialogTriggered:FireServer(work:FindFirstChild("Questgiver_Orb"))

--Get All Orbs
for i, child in ipairs(work:GetChildren()) do 
	if child.Name == "XpOrb" then
		RS.Storage.Events.QuestDialogTriggered:FireServer(work:FindFirstChild("Questgiver_Orb")) 
		child.Part.CFrame = player.Character.HumanoidRootPart.CFrame
	end
end

--Get All Orbs
work.ChildAdded:Connect(function(child)
	if child.Name == "XpOrb" then
		RS.Storage.Events.QuestDialogTriggered:FireServer(work:FindFirstChild("Questgiver_Orb")) 
		repeat wait() until child:FindFirstChild("Part")
		child.Part.CFrame = player.Character.HumanoidRootPart.CFrame
	end
end)