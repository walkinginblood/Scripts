_G.Enabled = true --Turn on/off
_G.Offset = 10

local plr = game.Players.LocalPlayer

while _G.Enabled == true do
    local children = workspace.Mobs:GetChildren()
    for i, child in ipairs(children) do
        if child:FindFirstChildOfClass("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
            local health = child:FindFirstChildOfClass("Humanoid").Health
            while health > 0 and _G.Enabled == true do
                if plr.Character:FindFirstChildOfClass("Tool") == nil and plr.Backpack:FindFirstChildOfClass("Tool") then
                    plr.Character:FindFirstChildOfClass("Humanoid"):EquipTool(plr.Backpack:FindFirstChildOfClass("Tool"))
                    wait()
                end
                plr.Character:FindFirstChild("HumanoidRootPart").CFrame = child:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(Vector3.new(0, 0, _G.Offset))
                wait()
                game.ReplicatedStorage.NETWORK.Combat:FireServer("NPC", child.Human, child.HumanoidRootPart)
                if child:FindFirstChildOfClass("Humanoid") then
                    health = child:FindFirstChildOfClass("Humanoid").Health
                end
            end
        end
    end
    wait()
end