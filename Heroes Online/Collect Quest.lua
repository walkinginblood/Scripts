local function click(part)
	if fireclickdetector then 
		--Synapse X
		fireclickdetector(part)
	elseif click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		game:GetService("Players").LocalPlayer:Kick("S^X & Proto ONLY")
		wait(0.25)
		while true do end
	end
end

for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do 
	if v:FindFirstChild("ClickDetector") then 
		click(v.ClickDetector)
	end
end