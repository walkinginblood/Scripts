_G.AutoSell = true;

--Wait for load
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("Backpack") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
wait()

--Variable
local player = game.Players.LocalPlayer

--Find Farm
local function find()
    for i, v in ipairs(workspace:GetChildren()) do
        if string.find(v.Name, player.UserId) then
            return v
        end
    end
end

--AutoSell
for i, v in ipairs(player.Backpack:GetChildren()) do
    if not string.find(v.Name:lower(), "seed") and not string.find(v.Name:lower(), "water") then
        game.ReplicatedStorage.Inventory.InventoryToggleSlotFunction:InvokeServer(v.Slot.Value)
        repeat wait() until player.Character:FindFirstChild(v.Name)
        repeat
            game.ReplicatedStorage.Items.SellItemRequest:InvokeServer((find().Bin))
            wait()
        until not player.Character:FindFirstChild(v.Name) or player.Character:FindFirstChild(v.Name).Slot.Value <= 0
    end
end

--Collect
for i = 1, 3 do
    for i, v in pairs(find().CropField["CropSquares-"..i]:GetChildren()) do
        if v:FindFirstChild("Crop") and v.Crop:FindFirstChild("Harvestable") and v.Crop.Harvestable.Value == true then
            player.Character.HumanoidRootPart.CFrame = v.CFrame
			wait()
			game.ReplicatedStorage.Crops.HarvestCropRequest:InvokeServer(v)
        end
    end
end

--Yeet away
game:GetService('TeleportService'):Teleport(game.PlaceId)