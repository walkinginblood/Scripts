--Clicky
function clicky(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		game.Players.LocalPlayer:Kick("Not using S^X or ProtoSmasher")
	end
end

--Yeet
while wait() do 
	for i, child in ipairs(workspace.PickUpMoney:GetChildren()) do 
		if child:FindFirstChild("ClickDetector") then 
			clicky(child.ClickDetector)
			wait()
		end
	end
end