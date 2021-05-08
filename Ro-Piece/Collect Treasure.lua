--Function
function click(part)
	if fireclickdetector then 
		--Synapse X
		fireclickdetector(part)
	elseif click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		game.Players.LocalPlayer:Kick("S^X & Proto ONLY")
		wait(0.25)
		while true do end
	end
end

--Get Current Treasure
for i,v in pairs(workspace.treasure:GetChildren()) do 
	if v:FindFirstChild("ClickDetector") then 
		click(v.ClickDetector)
	end
end

--Get New Treasure
workspace.treasure.ChildAdded:Connect(function(v)
	repeat wait() until v:FindFirstChild("ClickDetector")
	click(v.ClickDetector)
	return
end)