--Settings
_G.Enabled = true --Turn on/off
_G.Timer = 8 --Timer before force switch
_G.Offset = 8 --How far down you want to teleport
_G.NPCs = { --Target list
    ["Frenzy Boar"] = true,
    ["Wolf"] = true,
}

game.StarterGui:SetCore("SendNotification", {
Title = "SAE - AutoFarm";
Text = "By Megumu#8008";
Icon = ""; 
Duration = 15;
})

--Clear Map
if workspace["Town of Starting"]:FindFirstChild("Exclude") then
    workspace["Town of Starting"].Exclude:Remove()
end

--Anti Report
if game.ReplicatedStorage:FindFirstChild("LexarUSBNetworkAdapter") then
    game.ReplicatedStorage.LexarUSBNetworkAdapter:Remove()
end

--GodMode
for i = 1, 300 do
    game.ReplicatedStorage.Resources.Assets.Events.ArmorEquip:FireServer(game.Players.LocalPlayer.Character, "Starter Clothes")
end
wait(1)

--Variables
local children = workspace:GetChildren()
local plr = game.Players.LocalPlayer
local hump = plr.Character.HumanoidRootPart

--Hit
function hit(thing)
    hump.Anchored = true
    local stff = {
        [1] = true, 
        [2] = thing, 
        [3] = "Heavy"
    }
    game.ReplicatedStorage.Functions.RemoteFunction:InvokeServer("DamageFunction", stff)
    game.ReplicatedStorage.Resources.Assets.Events.ArmorEquip:FireServer(game.Players.LocalPlayer.Character, "Starter Clothes")
end
    
--Move
hump.CFrame = CFrame.new(-1468, 561, -1958)
wait(1)

--Farm
function farm()
    --Unanchor
    hump.Anchored = false

    --Actual Farm
    for i, child in ipairs(children) do
        if _G.Enabled == true and child:IsA("Model") and _G.NPCs[child.Name] and child:FindFirstChild("HumanoidRootPart") and child.Values.Health.Value > 0 then
            local health = child.Values.Health.Value
            while health > 0 do
                hump.Anchored = false
                hump.CFrame = CFrame.new(child.HumanoidRootPart.Position.X, child.HumanoidRootPart.Position.Y - _G.Offset, child.HumanoidRootPart.Position.Z)
                wait()
                hit(child)
                health = child.Values.Health.Value
            end
        end
    end
    wait()
    farm()
end

--Start
farm()