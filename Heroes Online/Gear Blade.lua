--Click
local function click(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then 
		click_detector(part, 1)
	else
		game:GetService("Players").LocalPlayer:Kick("S^X & Proto ONLY")
		wait()
		while true do end
	end
end

--Find
for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
	if v.Name == "Gear" and v:FindFirstChild("ClickDetector") then 
		click(v.ClickDetector)
	end
end