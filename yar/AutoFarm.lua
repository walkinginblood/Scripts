--[[
    Made by Megumu
    <3
]]

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('yar yar')
w:Section('Made by Megumu')

-- Variable
local player = game.Players.LocalPlayer
local old = player.Character.HumanoidRootPart.CFrame

--Toggle
w:Toggle('Enabled', {flag = "enable"})
w:Dropdown("Option", {
    location = _G;
    flag = "memes";
    list = {
        "Space World";
        "Earth";
    }
 }, function(new)
    if new == "Space World" then
        _G.memes = CFrame.new(-15090, -621, 2851)
    else
        _G.memes = CFrame.new(-15330, -172, -15)
    end
end)

-- Get that good shit
while true do
    if w.flags.enable then
        stat = game.Players.LocalPlayer.leaderstats.Gems.Value
        stat2 = game.Players.LocalPlayer.leaderstats.Coins.Value
        repeat
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = _G.memes
            end)
            wait()
        until game.Players.LocalPlayer.leaderstats.Gems.Value ~= stat or game.Players.LocalPlayer.leaderstats.Coins.Value ~= stat2 or not w.flags.enable
        if w.flags.enable then
            player.Character.HumanoidRootPart.CFrame = old
            wait(120)
        end
    end
    wait()
end