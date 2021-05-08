local ore = "Bronze"
local plr = game.Players.LocalPlayer
local children = workspace.Minerals:GetChildren()

if plr.Backpack:FindFirstChild("Pickup") then
    plr.Character.Humanoid:EquipTool(plr.Backpack.Pickup)
end
wait(1)
for i, child in ipairs(children) do
    if child:FindFirstChild("Type") and child.Type.Value == ore then
        plr.Character.HumanoidRootPart.CFrame = child.CFrame
        wait(0.5)
        plr.Character.Pickup.PickupRemote:FireServer(child)
        wait(0.1)
        plr.Character.HumanoidRootPart.CFrame = workspace.map.Refinery.Areas.StagingArea.Staging.CFrame
        wait(1.5)
        plr.Character.Pickup.PickupRemote:FireServer()
        wait(0.4)
    end
end