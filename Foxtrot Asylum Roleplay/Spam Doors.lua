_G.Delay = 1

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
		repeat until nil
	end
end

tab = {}

for i,v in pairs(game:GetDescendants()) do
	if v:IsA("ClickDetector") and v.Parent.Name == "Door" then
		table.insert(tab, v)
	end
end

while wait(_G.Delay) do
	for i, v in pairs(tab) do
		click(v)
	end
end