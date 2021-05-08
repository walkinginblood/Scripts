--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Stat Farm')

--Section
w:Section('Discord: PXdNwN5')

--Toggle
w:Toggle('Enabled', {flag = "enabled"})
w:Section('Moves')
w:Toggle('Move 1', {flag = "one"})
w:Toggle('Move 2', {flag = "two"})
w:Toggle('Move 3', {flag = "three"})
w:Toggle('Move 4', {flag = "four"})

if _G.Executed == nil then
    --Variable
    local player = game.Players.LocalPlayer
    local user = game.ReplicatedStorage[player.UserId.."Client"]
    _G.Executed = true

    --Delete Cooldown
    function delet()
        for i,v in pairs(player.Character:GetChildren()) do
            if string.find(v.Name:lower(), "cooldown") then
                v:Destroy()
            end
        end
    end

    --Use Move
    while true do
        if w.flags.enabled then
            if w.flags.one then
                user.StartMove:FireServer("Move1", Vector3.new())
                user.EndMove:FireServer("Move1", Vector3.new())
                delet()
            end
            if w.flags.two then
                user.StartMove:FireServer("Move2", Vector3.new())
                user.EndMove:FireServer("Move2", Vector3.new())
                delet()
            end
            if w.flags.three then
                user.StartMove:FireServer("Move3", Vector3.new())
                user.EndMove:FireServer("Move3", Vector3.new())
                delet()
            end
            if w.flags.four then
                user.StartMove:FireServer("Move4", Vector3.new())
                user.EndMove:FireServer("Move4", Vector3.new())
                delet()
            end
            delet()
        end
        wait(0.25)
    end
end