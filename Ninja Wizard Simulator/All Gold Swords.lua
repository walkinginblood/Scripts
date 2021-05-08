--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")

--Get all
for i, child in ipairs(work:GetChildren()) do 
	if child:FindFirstChild("GoldSwordZone") then 
		player.Character.HumanoidRootPart.CFrame = child.GoldSwordZone.CFrame
		wait()
	end
end