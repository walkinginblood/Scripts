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

--Get Tix
while wait(0.25) do 
	for i, child in ipairs(workspace.ArcadeJobSpawns:GetChildren()) do 
		if child:IsA("Part") and child.Spawned.Value == true then 
			click(child.TixBag.ClickDetector)
			wait()
			click(workspace["Bring me Tix! i'll make it worth your while..."]["Head"].Click)
		end
	end
end