_G.Settings = { --Settings
    Orbs = true; --Automatically collect orbs
}

--Variable
local player = game.Players.LocalPlayer

--Get Orbs
if _G.Settings["Orbs"] then
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name, "Orbs") then
            for _,e in pairs(v:GetChildren()) do
                if e:IsA("Part") and e:FindFirstChild("TouchInterest") then
                    e.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end

--Get Future Orbs
if _G.Settings["Orbs"] then
    for i,v in pairs(workspace:GetChildren()) do
        v.ChildAdded:Connect(function(orb)
            if _G.Settings["Orbs"] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and orb:IsA("Part") then
                repeat wait() until orb:FindFirstChild("TouchInterest")
                orb.CFrame = player.Character.HumanoidRootPart.CFrame
            end
        end)
    end
end