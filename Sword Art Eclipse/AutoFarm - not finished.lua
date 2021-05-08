_G.Enabled = true --Turn on/off
_G.Timer = 8 --Timer before force switch
_G.NPCs = { --Target list
    ["Frenzy Boar"] = true,
    ["Wolf"] = true,
}

local children = workspace:GetChildren()
local plr = game.Players.LocalPlayer

while _G.Enabled == true do
    for i, child in ipairs(children) do
        if _G.Enabled == true and child:IsA("Model") and _G.NPCs[child.Name] and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") then
            local health = child.Values.Health.Value
            while health > 0 do
                local stff = {
                    [1] = true, 
                    [2] = child, 
                    [3] = "Heavy"
                }
                game.ReplicatedStorage.Functions.RemoteFunction:InvokeServer("DamageFunction", stff)
                wait()
                health = child.Values.Health.Value
            end
        end
    end
    wait()
end