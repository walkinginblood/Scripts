--Clicky
local function click(part)
	if fireclickdetector then 
		fireclickdetector(part)
	elseif click_detector then 
		click_detector(part, 1)
	else
		game.Players.LocalPlayer:Kick("Get Synapse X or ProtoSmasher")
	end
end

--Farm
for i, child in ipairs(workspace:GetChildren()) do 
	if child.Name == "Brain" and child:FindFirstChild("ClickDetector") then 
		click(child.ClickDetector)
		wait()
	end
end