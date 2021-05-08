--[[
    Made by Megumu/Mommy Mango
    <3
]]

--Variable
local player = game.Players.LocalPlayer

--Wait for map
repeat wait(0.1) until workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Items") and workspace.Values.MoneyInMap.Value ~= 0
    
--Wait for character
repeat wait(0.1) until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

--GodMode
if player.Character:FindFirstChild("Health") then
    player.Character.Health:Destroy()
end
    
--Camera Check
for i = 1,2 do
    if workspace.Values["Camera"..i].Cameraman.Value == player then
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
    end
end

--Collect & Sell Items
if workspace.Values.Thieves:FindFirstChild(player.Name) then
    for i,v in pairs(workspace.Map.Items:GetChildren()) do
        if v:FindFirstChild("Part") or v:FindFirstChild("Union") then
            local part = v:FindFirstChild("Part") or v:FindFirstChild("Union")
            local drop = workspace.Map.DropOff:FindFirstChildOfClass("Part")
            local timer = 45
            repeat
                player.Character.HumanoidRootPart.CFrame = part.CFrame
                wait()
                game.ReplicatedStorage.Thieves.PickUp:FireServer(part, part.Position)
                game.ReplicatedStorage.Thieves.PickUp:FireServer(part, 0, 0, true, player.Character.RightHand)
                timer = timer - 1
                print(timer)
            until v == nil or v.Parent == nil or timer <= 0 
            repeat
                player.Character.HumanoidRootPart.CFrame = drop.CFrame
                wait()
                game.ReplicatedStorage.Thieves.DropOff:FireServer(drop)
            until player.Character.Weight.Value <= 0
        end
    end
end