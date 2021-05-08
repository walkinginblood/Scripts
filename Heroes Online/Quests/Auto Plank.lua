--Click
local function click(part)
	if fireclickdetector then 
		fireclickdetector(part)
	elseif click_detector then 
		click_detector(part, 1)
	else
		game.Players.LocalPlayer:Kick("Get Synapse X or ProtoSmasher")
		wait(5)
		while true do end
	end
end

--Thing
for i, child in ipairs(workspace:GetChildren()) do 
	if string.find(child.Name, "Planks") and child:FindFirstChild("ClickDetector") then 
		click(child.ClickDetector)
		wait()
	end
end