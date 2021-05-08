-- Variable
local player = game.Players.LocalPlayer

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('rage stuff')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "toggle1"})
w:Dropdown("Training", {
    location = _G;
    flag = "training";
    list = {
        "KiBlast";
        "Defense";
        "Combat";
    }
})

--Bonk
while true do
    if w.flags.toggle1 then
        if _G.training == "Defense" then
            repeat
                if #game.Players:GetPlayers() >= 2 then
                    for i,v in pairs(game.Players:GetPlayers()) do
                        if v ~= player then
                            pcall(function()
                                game.ReplicatedStorage.Remotes.Training.Defense:InvokeServer(v.Stats, v.Status, v.Character.Humanoid, v.Character.Head)
                            end)
                        end
                    end
                else
                    local v = player
                    pcall(function()
                        game.ReplicatedStorage.Remotes.Training.Defense:InvokeServer(v.Stats, v.Status, v.Character.Humanoid, v.Character.Head)
                    end)
                end
                wait()
            until player.Status.Energy.Value <= 6 or not w.flags.toggle1 or _G.training ~= "Defense"
        elseif _G.training == "Combat" then
            repeat
                spawn(function()
                    game.ReplicatedStorage.Remotes.Training.Combat:InvokeServer()
                end)
                wait()
            until not w.flags.toggle1 or _G.training ~= "Combat"
        elseif _G.training == "KiBlast" then
            repeat
                spawn(function()
                    game.ReplicatedStorage.Remote.KiBlast:InvokeServer()
                end)
                wait()
            until player.Status.Energy.Value <= 9 or not w.flags.toggle1 or _G.training ~= "KiBlast"
        end
        if _G.charge == "Reset" and w.flags.toggle1 then
            pcall(function()
                player.Character.Head:Destroy()
            end)
            repeat wait() until player.Status.Energy.Value == player.Status.MaxEnergy.Value or not w.flags.toggle1
        end
    end
    wait()
end