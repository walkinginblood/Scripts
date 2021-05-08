-- Main
local w = Window.new("Auto-Fisher")
local cred = w:AddElement("Label");cred.Text="Made by Megumu";cred.AlignToFramePadding=false;

-- Toggles
local fish = w:AddElement("Checkbox");fish.Label = "Enabled"
local sell = w:AddElement("Checkbox");sell.Label = "Auto Sell"

-- Variable
local player = game.Players.LocalPlayer

-- Change Detect
while true do
    if fish.State and pcall(function() return player.Character:FindFirstChildOfClass("Tool").Bobbers.Bobber.Fish end) and player.Character:FindFirstChildOfClass("Tool").Bobbers.Bobber.Fish.Value ~= nil then
        game.ReplicatedStorage.CloudClientResources.Communication.Events.FishCaught:FireServer()
    end
    if sell.State then
        for i,v in pairs(player.Backpack:GetChildren()) do
            if v:FindFirstChild("IsFishObject") and v.IsFishObject.Value == true then
                game.ReplicatedStorage.CloudClientResources.Communication.Functions.SellItem:InvokeServer(v.Name, 1)
            end
        end
    end
    wait(.2)
end