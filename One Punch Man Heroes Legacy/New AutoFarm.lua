--[[
    Made by Megumu/Mommy Mango
    <3
]]

_G.Enabled = true; --Toggle On/Off
_G.Settings = { --Settings
    NPC = "Weak thug"; --NPC to farm
    Distance = -6; --TP Distance (Y axis)
    Rotation = 90; --TP Rotation
}

--Variable
local player = game.Players.LocalPlayer
local events = game.ReplicatedStorage.RemoteEvents

--AntiKick | Thanks Gopnik <3
local old;
old = hookfunction(getrawmetatable(game).__namecall,function(...)
local Method = getnamecallmethod();
if Method == "Kick" or Method == "BreakJoints" or Method == "kick" then
    return
end
return old(...)
end)

--NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then 
        player.Character.Humanoid:ChangeState(11)
    end
    if _G.Enabled == false then 
        Stepped:Disconnect()
    end
end)

--Check
function check(v)
    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
        return true
    else
        return false
    end
end

--Farm
while _G.Enabled do
    for i, v in pairs(workspace.Mobs:GetChildren()) do
        if _G.Enabled and string.find(v.Name:lower(), _G.Settings["NPC"]:lower()) and check(player.Character) and check(v) then
            repeat
                if check(v) and check(player.Character) and player:FindFirstChild("Backpack") then
                    player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(_G.Settings["Rotation"]), 0, 0) + Vector3.new(0,_G.Settings["Distance"],0)
                    wait()
                    events.P:FireServer("RightHand", player.Backpack:FindFirstChildOfClass("LocalScript").Knockback2)
                end
                wait()
            until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or _G.Enabled == false
        end
    end 
end