-- Variable
local player = game.Players.LocalPlayer

-- ProtoSmasher
if PROTOSMASHER_LOADED then
	getgenv().fireclickdetector = click_detector
end

-- Get Tycoon
for i,v in pairs(workspace.tycoons:GetChildren()) do 
	if v.Owner.Value == player then 
		Tycoon = v
	end
end

-- Click
while wait() do
	for i,v in pairs(Tycoon.PurchasedObjects:GetChildren()) do 
		if v:FindFirstChild("button") and v.button:FindFirstChild("ClickDetector") then 
			fireclickdetector(v.button.ClickDetector, 1)
		end
	end
end