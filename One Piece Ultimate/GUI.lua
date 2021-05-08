--Variables
local player = game:GetService("Players").LocalPlayer

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('One Piece Trash')
local cred = library:CreateWindow('Credits')

--Credits
cred:Label("UI: wally")
cred:Label("Dragging: Ririchi")
cred:Label("Scripts: Purity")

--Main
w:Section('Main')
w:Toggle('Spam Hit', {flag = "hit"})
w:Button('God Mode', function()
    if player.Character and player.Character:FindFirstChild("CharacterValues") and player.Character.CharacterValues:FindFirstChild("Blocking") then
        player.Character.CharacterValues.Blocking:Destroy()
    end
end)

--Hit
spawn(function()
    while true do
        if w.flags.hit then
            game.ReplicatedStorage.RemoteEvents.PunchRemote:FireServer(false, nil, nil)
        end
        wait()
    end
end)