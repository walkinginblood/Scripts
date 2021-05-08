--you should probs change this idk
local Plot = "Plot1"
local Seed = "Hay"

--variables
local plr = game.Players.LocalPlayer
local children = workspace:GetChildren()
local event = game.ReplicatedStorage.ManipulateCrop

--gay code dont look pls
for i, child in ipairs(children) do
	if child:IsA("Model") and child:FindFirstChild("Owner") and child.Owner.Value == plr then
		Farm = child
	end
end
local children = Farm.Plot1:GetChildren()
for i, child in ipairs(children) do
    if child:FindFirstChild("CropStage") then
        event:FireServer(Farm.Plot1[child.Name], "Harvest")
    end
end
wait(0.3)
local nogger = plr.PlayerGui.Game.Harvest.Contents:GetChildren()
for i, child in ipairs(nogger) do
	if child:FindFirstChild("Type") and child.Type.Text == Seed then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(52, 5, -456)
        wait(0.3)
        game.ReplicatedStorage.UseMarket:FireServer("SellCrop", Seed, tonumber(child.Quantity.Text), false)
    end
end
wait(0.3)
local children = Farm.Plot1:GetChildren()
for i, child in ipairs(children) do
    if child:FindFirstChild("WaterContent") and child.WaterContent.Value == 0 then
        event:FireServer(Farm.Plot1[child.Name], "Water")
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(Farm.Well.AnimalBlock.Position)
        game.ReplicatedStorage.UseItem:FireServer(Farm.Well)
    end
end
wait(1)
local children = Farm.Plot1:GetChildren()
for i, child in ipairs(children) do
    if child:FindFirstChild("CropType") then
        event:FireServer(Farm.Plot1[child.Name], "PlantSeed", Seed)
    end
end
wait(36)