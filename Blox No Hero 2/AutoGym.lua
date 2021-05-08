-- Variable
local gym = game.Players.LocalPlayer.PlayerGui["NewUI Test"].Gym.Button.Key
local Keys = {
    W = "0x57";
    A = "0x41";
    S = "0x53";
    D = "0x44";
    E = "0x45";
    Q = "0x51";
}

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('generic anime game 2')
w:Section('Made by Megumu')
local t = w:Toggle('Enabled', {flag = "toggle1"})

-- Script
while true do
    if w.flags.toggle1 then
        if gym.Parent.Parent.Visible == false and w.flags.toggle1 then
            local timer = tick()
            spawn(function()
                game.ReplicatedStorage.Remotes.Functions.General.GymTrain:InvokeServer()
            end)
            repeat wait() until gym.Parent.Parent.Visible or tick() - timer >= 2 or not w.flags.toggle1
        end
        local old, timer = gym.Parent.Position, tick()
        repeat wait() until tick() - timer > 1.6 or old ~= gym.Parent.Position or not w.flags.toggle1
        keypress(tonumber(Keys[gym.Text]))
    end
    wait()
end