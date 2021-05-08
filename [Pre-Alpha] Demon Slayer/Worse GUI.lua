--Variable
local player = game.Players.LocalPlayer

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Thot Slayer')
local cred = library:CreateWindow('Credits')

--Credits
cred:Label('UI: wally')
cred:Label('Dragging: Ririchi')
cred:Label('Scripts: Purity')

--Stuff
w:Section('Main')
w:Toggle('Fast Hit',{flag = "enabled"})
w:Button("GodMode", function()
    if player.Character then
        local hitbox = player.Character:FindFirstChild("Hitbox")
        local block = player.Character:FindFirstChild("Block")
        if block then
            block:Destroy()
        end
        if hitbox then
            hitbox:Destroy()
        end
    end
end)

--Auto Hit
spawn(function()
    while true do
        if w.flags.enabled then
            if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Combat_Main") and player.Backpack.Combat_Main:FindFirstChild("CombatEvent") then
                player.Backpack["Combat_Main"].CombatEvent:FireServer(2, 0)
            end
        end
        wait()
    end
end)