_G.Loop = false -- Loop grab eggs

-- Variable
local player = game.Players.LocalPlayer
local old = player.Character.HumanoidRootPart.CFrame

-- Grab Egg & Teleport back
function grab()
	for i,v in pairs(workspace.CollectionZones.Eggs:GetChildren()) do
		if v:FindFirstChild("Egg") then
			repeat
				player.Character.HumanoidRootPart.CFrame = v.Egg.CFrame
				wait()
				player.Remote:FireServer("PickEggObj", v)
			until not v:FindFirstChild("Egg")
			player.Character.HumanoidRootPart.CFrame = old
			return
		end
	end
end

-- Bad loop
repeat
	grab()
	wait()
until not _G.Loop