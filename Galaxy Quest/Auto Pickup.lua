--Get Loot
local player = game.Players.LocalPlayer

while wait(0.25) do 
	for i, child in ipairs(workspace.Entities.Drops:GetChildren()) do 
		if child:FindFirstChild("holder") and player.Character then 
			child.holder.CFrame = player.Character.HumanoidRootPart.CFrame
		end
	end
end