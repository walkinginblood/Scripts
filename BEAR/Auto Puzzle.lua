--Variable
local player = game.Players.LocalPlayer

--Credits
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Discord: 8JRAyM9";
    Text = "Made by Megumu#8008";
    Duration = 25;
})

--Click Function
function click(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif Input and Input.KeyDown then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		player:Kick("Get S^X or Proto")
		wait(5)
		while true do end
	end
end

--Color Puzzle
function colors(pzl)

	--Variables
	local clue = pzl.Interactive.Clue.Note

	--Lul!
	for i = 1, 4 do 
		local fakecolor = clue["T"..i].TextColor3
		local color = Color3.new(fakecolor.r, fakecolor.g, fakecolor.b)
		repeat
			click(pzl.Interactive["Panel"..i].Click)
			wait(0.05)
		until tostring(pzl.Interactive["Panel"..i].Color) == tostring(color)
	end
end

--Beam Puzzle
function beams(pzl)
	for i, child in ipairs(pzl.Interactive:GetChildren()) do
		if child:FindFirstChild("ClickDetector") then 
			repeat
				click(child.ClickDetector)
				wait()
			until not child:FindFirstChild("ClickDetector")
			wait()
		end
	end
end

--Do Puzzles
for i, child in ipairs(workspace.PuzzleBin:GetChildren()) do
	if child.Name == "Puzzle | Beams" then 
		beams(child)
	end
	if child.Name == "Puzzle | Color" then
		colors(child)
	end
end