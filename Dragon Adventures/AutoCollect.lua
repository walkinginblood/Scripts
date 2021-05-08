-- Variable
local player = game.Players.LocalPlayer

-- Auto Sell
local function sell()
	for i, v in ipairs(player.Data.Resources:GetChildren()) do
        if v.Value >= 10000 then
            repeat
                player.Remote:FireServer("SellResource",{[1]=v.Name;[2]=1;})
                wait()
            until v.Value <= 9999
		end
	end
end

-- Platform
spawn(function()
    local plat = Instance.new("Part", workspace)
    plat.Size = Vector3.new(10, 1, 10)
    plat.Anchored = true
    while true do
        pcall(function()
            plat.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, -5.2, 0)
        end)
        wait()
    end
end)

-- Collect
while true do
    local v = nil;
    repeat
        local res = workspace.CollectionZones.Resources:GetChildren()
        v = res[math.random(1, #res)]
        wait()
    until v ~= nil
    sell()
    local tries = 20
    if v:IsA("Model") and v:FindFirstChildOfClass("MeshPart") then
        repeat
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("MeshPart").CFrame + Vector3.new(0, -15, 0)
            end)
            wait(0.1)
            player.Remote:FireServer("PickResourceObj", v)
            tries = tries - 1
        until v == nil or v.Parent == nil or tries <= 0
    elseif not v:IsA("Model") then
        repeat
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, -15, 0)
            end)
            wait(0.1)
            player.Remote:FireServer("PickResourceObj", v)
            tries = tries - 1
        until v == nil or v.Parent == nil or tries <= 0
    end
    wait(0.25)
end