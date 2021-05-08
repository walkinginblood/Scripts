local player = game.Players.LocalPlayer
for i,v in pairs(workspace:GetChildren()) do
	if v.Name == "Water" and v.Color == Color3.new(128/255, 187/255, 219/255) then
		water = v.ClickDetector
	end
end
local function food()
    for i,v in pairs(workspace.Map:GetChildren()) do
        if v:FindFirstChild("ClickDetector") and v:FindFirstChild("Eat") then
            fireclickdetector(v.ClickDetector, 1)
        end
    end
end
fireclickdetector(water, 1)
food()