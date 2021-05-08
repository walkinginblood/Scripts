-- Variable
local player = game.Players.LocalPlayer

-- Table
local coins = {}

-- Get Coins
local stuff = workspace:GetDescendants()
for i = 1, #stuff do local v = stuff[i]
	if v.Name == "CoinSpawn" then
		table.insert(coins, v)
	end
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('lumberrr')
w:Section('made by megumu')
w:Toggle('auto chop', {flag = "autofarm"})
w:Toggle('collect coins', {flag = "coins"})
w:Section('auto sell')
w:Toggle('enabled', {flag = "autosell"})
w:Toggle('fill', {flag = "fill"})

-- Axe Function
local function axe()
    if player.Character:FindFirstChildOfClass("Tool") then
        return player.Character:FindFirstChildOfClass("Tool")
    elseif player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() > 0 then
        player.Backpack:GetChildren()[1].Parent = player.Character
        wait()
        return player.Character:FindFirstChildOfClass("Tool")
    end
    return false
end

-- Grab Coins
spawn(function()
    while true do
        if w.flags.coins then
            for i = 1, #coins do local v = coins[i]
                v.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,math.random(1,2),0)
            end
        end
        wait(.25)
    end
end)

-- Auto Chop
spawn(function()
    while true do
        if w.flags.autofarm then
            local stuff = workspace.Village.VIP.Trees:GetChildren()
            for i = 1, #stuff do local v = stuff[i]
                if axe() and pcall(function() return v.Model.Transparency, v.PrimaryPart.CFrame, v.BaseCollision.CanCollide, v.Sakura_Particle end) then
                    v.Model.Transparency = 0
                    v.BaseCollision.CanCollide = false
                    v.Sakura_Particle:Destroy()
                    wait()
                    repeat
                        v.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4, -5)
                        axe():Activate()
                        wait()
                    until not w.flags.autofarm or not pcall(function() return v.ChoppableTreeHealthBar.Bar.HealthLabel.Text end) or tonumber(v.ChoppableTreeHealthBar.Bar.HealthLabel.Text) <= 0
                end
            end
        end
        wait(.4)
    end
end)

-- Auto Sell
spawn(function()
    while true do
        if w.flags.autosell then
            if w.flags.fill then

            else
                spawn(function()
                    game.ReplicatedStorage.TeleportToLastSellHoop:InvokeServer(v)
                end)
                wait(1)
            end
        end
        wait(1)
    end
end)