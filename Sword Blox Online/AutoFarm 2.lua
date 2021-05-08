--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Auto Farm')

--Section
w:Section('Discord: PXdNwN5')

--Toggle
local t = w:Toggle('Enabled', {flag = "toggle"})
local s = w:Slider("Distance", {
    min = -15;
    max = 15;
    flag = 'fov'
}, function(v)
    getgenv().Distance = tonumber(v);
end)

--Settings
getgenv().Distance = -15

--Variable
local player = game.Players.LocalPlayer

--NoClip Bypass
local statetype = Enum.HumanoidStateType
local rnd = Random.new():NextInteger(150, 100000)
local mt = getrawmetatable(statetype)
local mt_index = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(t, k)
    if not checkcaller() and t == statetype and k == "StrafingNoPhysics" then
        return rnd
    end

    return mt_index(t, k)
end)

setreadonly(mt, true)

--NoClip
local function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            player.Character.Humanoid:ChangeState(11)
        end
    end)
end

--Farm
while true do
    if w.flags.toggle then
        for i,v in pairs(workspace.Mobs:GetChildren()) do
            if w.flags.toggle and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                noclip()
                repeat
                    if w.flags.toggle and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, getgenv().Distance, 0)
                    end
                    wait(1)
                    if w.flags.toggle and v:FindFirstChild("Humanoid") then
                        game.ReplicatedStorage.DamageMob:FireServer(v.Humanoid, false)
                    end
                until w.flags.toggle == false or v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                Stepped:Disconnect()
            end
        end
    end
    wait(0.25)
end