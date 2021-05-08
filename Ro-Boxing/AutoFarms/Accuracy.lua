--Settings
_G.Enabled = true

--Variable
local RS = game:GetService("ReplicatedStorage")
local work = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer

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

--Find Dummy
function dummy(bool)
	if bool == true then
		for i = 1, 4 do 
			if work["Dummy_Punch"..i].Player.Value == player.Name then
				return work["Dummy_Punch"..i]
			end
		end
	else
		for i = 1, 4 do 
			if work["Dummy_Punch"..i]["In_Use"].Value == false then
				return work["Dummy_Punch"..i]
			end
		end
	end		
end

--Punch
function accuracy()
	for i, child in ipairs(dummy(true).Buttons:GetChildren()) do 
		if child.BrickColor == BrickColor.new("Lime green") and child:FindFirstChildOfClass("ClickDetector") then 
			click(child:FindFirstChildOfClass("ClickDetector"))
		end
	end
end

--Loop
while _G.Enabled do
	if dummy(true) then
		accuracy()
		wait()
	else
		repeat
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				player.Character.HumanoidRootPart.CFrame = dummy(false).Touch.CFrame
				wait(1)
				RS["Strength_Exercises"][tostring(dummy(false))]:FireServer()
				wait()
			end
			wait()
		until dummy(true) or _G.Enabled == false
	end
	wait()
end