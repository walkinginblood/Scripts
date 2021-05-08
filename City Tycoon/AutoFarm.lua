-- Settings
_G.Enabled = true; -- Toggle On/Off
_G.building = "Bank" -- Shop to build

-- Variable
local player = game.Players.LocalPlayer
local mony = player.leaderstats["\240\159\146\181"]
local mod = require(game.ReplicatedStorage.Modules.Buildings).Businesses

-- Reduce lag
if workspace:FindFirstChild("Buildings") then
	workspace.Buildings:Destroy()
	workspace.ChildAdded:Connect(function(v)
		wait()
		if v.Name == "BuildingVisual" then
			v:Destroy()
		end
	end)
end

-- Script
if mod[_G.building] then
	while true do
		if _G.Enabled and mony.Value >= mod[_G.building].Cost then
			repeat
				game.ReplicatedStorage.Remotes.InsertBuilding:FireServer(_G.building, player.Character.HumanoidRootPart.Position, 0)
				wait()
			until mony.Value < mod[_G.building].Cost
		end
		wait()
		repeat
			wait(0.1)
		until mony.Value >= mod[_G.building].Cost
	end
else
	print("Invalid Building")
end