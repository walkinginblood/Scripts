_G.item = "Metal"

local player = game.Players.LocalPlayer

for i, v in pairs(workspace:GetDescendants()) do
	local old = player.Character.HumanoidRootPart.CFrame
	if string.find(v.Name:lower(), _G.item:lower()) and v:FindFirstChild("Handle") then
		player.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
		repeat
			game.ReplicatedStorage.InventoryEvent:FireServer("Pickup", v)
			wait(0.1)
			player.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
		until v.Parent.Name == "Inventory"
		player.Character.HumanoidRootPart.CFrame = old
		return
	end
end