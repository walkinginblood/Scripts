--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")

--Capture
for i, child in ipairs(work.bases:GetChildren()) do
	if child.Owner.Value ~= player.Name then
		repeat
			player.Character.HumanoidRootPart.CFrame = child.baseCaptureSpot.CFrame
			wait() 
			RS.ThisGame.Calls.baseEvents:FireServer("onCaptureSpot", child)
		until child.Owner.Value == player.Name
	end
end