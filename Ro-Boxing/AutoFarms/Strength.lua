--Settings
_G.Enabled = true

--Variable
local plr = game:GetService("Players").LocalPlayer

--Find Rope
for i, child in ipairs(workspace:GetChildren()) do
    if child.Name == "Rope_Train1" then
        ROPE1 = child.Bottom
        ROPE2 = child.Top
    end
end

--Loop
while _G.Enabled do
	if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		ROPE1.CFrame = plr.Character.HumanoidRootPart.CFrame
		ROPE2.CFrame = plr.Character.HumanoidRootPart.CFrame
		plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0.001, 0)
	end
	wait()
end