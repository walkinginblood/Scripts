local player = game.Players.LocalPlayer
local rod = player.Character:FindFirstChildOfClass("Tool")

while true do
    rod:Activate()
    repeat wait() until rod:FindFirstChild("SplashPart")
    rod:Activate()
    wait(6)
end

for i,v in pairs(player.Inventory:GetChildren()) do
    game.ReplicatedStorage.Events.SellShop:FireServer(v.Value, workspace.Shop.Sellers, 1)
end