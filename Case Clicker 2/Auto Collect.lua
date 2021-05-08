-- Variable
local player = game.Players.LocalPlayer
local ts = game:GetService("TweenService")

-- ProtoSmasher Check
if not PROTOSMASHER_LOADED then
    player:Kick("Use ProtoSmasher")
    wait(1)
    game:Shutdown()
end

-- Network
loadstring(game:HttpGetAsync("https://pastebin.com/raw/pcUnrSHM"))()

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('clickr hero 2!!')
w:Section('Made by Megumu')
w:Toggle('Auto Collect', {flag = "collect"})
w:Section('Settings')
w:Dropdown("locations", {
    location = _G;
    flag = "motion";
    list = {
        "Walk";
        "Tween";
    }
}, function()
    print(_G.motion)
end)
w:Toggle('Gems',{flag="Gems"})
w:Toggle('Bux',{flag="Bux"})
w:Toggle('Supply Drop',{flag="SupplyDrop"})
w:Button("Remove Obstacles", function()
    local shit = workspace.Map:GetChildren()
    for i = 1, #shit do local v = shit[i]
        if not v:FindFirstChildOfClass("Texture") then
            v:Destroy()
        end
    end
    local shit = workspace:GetDescendants()
    for i = 1, #shit do local v = shit[i]
        if v:IsA("Seat") then
            v:Destroy()
        end
    end
end)

-- Get Nearest
function nearest()
    local Closest
    local Distance = math.huge
    local shit = workspace.Currency:GetChildren()
    for i = 1, #shit do local v = shit[i]
        if w.flags[v.Name] and pcall(function() return v.Clicks,v.Needed,v.Creator end) and v.Clicks.Value<v.Needed.Value and (v.Creator.Value==player or not v.Creator.Value) then
            local newDistance = player:DistanceFromCharacter(v.Position)
            if newDistance < Distance then
                Closest = v
                Distance = newDistance
            end
        end
    end
    return Closest
end

-- Yeet
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.motion == "Tween" then
        player.Character.Humanoid:ChangeState(11)
    end
end)

-- Get Shit
while true do
    if w.flags.collect then
        repeat
            local thing = nearest()
            if thing then
                thing.CanCollide = false
                if _G.motion == "Walk" then
                    player.Character.Humanoid:MoveTo(thing.Position)
                    if player:DistanceFromCharacter(thing.Position) < 45 then
                        network:send("ClickCurrency",thing)
                    end
                else
                    ts:Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(thing.Position)/100, Enum.EasingStyle.Linear), {CFrame = thing.CFrame}):Play()
                    wait(player:DistanceFromCharacter(thing.Position)/100)
                    if player:DistanceFromCharacter(thing.Position) < 45 then
                        network:send("ClickCurrency",thing)
                    end
                end
            end
            wait(.1)
        until not w.flags.collect
    end
    wait(.25)
end