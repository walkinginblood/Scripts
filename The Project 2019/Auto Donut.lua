--Credits
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Discord: 8JRAyM9";
    Text = "Made by Megumu#8008";
	Duration = 25;
})

--Clicky
function click(part)
	if click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	elseif fireclickdetector then
		--Synapse 
		fireclickdetector(part)
	end
end

--Get donuts
while wait(0.25) do 
	for i, child in ipairs(workspace.DonutJobSpawns:GetChildren()) do 
		if child:IsA("Part") and child.Spawned.Value == true then 
			click(child.Donuts.ClickDetector)
			wait()
			click(workspace["We are running low on donuts! Be sure to bring any leftovers you find and i'll pay."]["Right Arm"].Click)
		end
	end
end