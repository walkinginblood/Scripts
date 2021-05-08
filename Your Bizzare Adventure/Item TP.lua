-- Proto Compatible
if PROTOSMASHER_LOADED then
    getgenv().fireclickdetector = click_detector
end

-- Variable
local player = game.Players.LocalPlayer
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

-- LOL FETUS DELETUS
function delet()
    pcall(function()
        player.Character.Location:Destroy()
    end)
end

-- NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        player.Character.Humanoid:ChangeState(11)
    end)
end

--Main
local w = library:CreateWindow('jojo is epic')
w:Section('Made by Megumu')
w:Button('TP Bypass', function()
    delet()
end)
--Toggle
w:Section('Item TP')
w:Toggle('Enabled', {flag = "enabled"})
w:Toggle('AutoSell', {flag = "sell"})

-- Loop
delet()
spawn(function()
    while true do
        if w.flags.enabled then
            local old = player.Character.PrimaryPart.CFrame
            for i,v in pairs(workspace["Item_Spawns"].Items:GetChildren()) do
                if w.flags.enabled and v:FindFirstChild("ClickDetector") and v:FindFirstChildOfClass("MeshPart") then
                    delet()
                    wait(0.25)
                    noclip()
                    repeat
                        pcall(function()
                            player.Character.PrimaryPart.CFrame = v:FindFirstChildOfClass("MeshPart").CFrame + Vector3.new(0, -10, 0)
                            wait()
                            fireclickdetector(v.ClickDetector, 1)
                        end)
                        wait()
                    until not w.flags.enabled or v == nil or v.Parent == nil or not v:FindFirstChild("ClickDetector") or not v:FindFirstChildOfClass("MeshPart")
                    Stepped:Disconnect()
                end
            end
            pcall(function()
                player.Character.PrimaryPart.CFrame = old
            end)
        end
        wait()
    end
end)
spawn(function()
    while true do
        if w.flags.sell then
            if player:FindFirstChild("Backpack") and player.Character then
                for i,v in pairs(player.Backpack:GetChildren()) do
                    if v.Name == "Gold Coin" or v.Name == "Rokakaka" or v.Name == "Mysterious Arrow" or v.Name == "Diamond" then
                        v.Parent = player.Character
                        wait()
                        fireclickdetector(workspace.Dialogues["SaintTale, The Travelling Merchant"].TalkBox.ClickDetector, 1)
                        pcall(function()
                            player.Character.RemoteEvent:FireServer("EndDialogue", {["NPC"]="Merchant";["Option"]="Option1";["Dialogue"]="Dialogue2"})
                        end)
                    end
                end
            end
        end
        wait()
    end
end)