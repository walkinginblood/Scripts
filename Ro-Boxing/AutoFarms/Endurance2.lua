--Player 1
--Variable
local player = game.Players.LocalPlayer
local player2 = "ScriptK1tty"

--Farm
local function farm(mode)
    if mode == "Combat" then
        wait(2)
        if player.Character:FindFirstChild("Head") then
            player.Character.Head:Destroy()
            repeat wait(0.25) until player.Character and player.Character:FindFirstChild("Head")
        end
    elseif mode == "Search" then
        for i, v in pairs(workspace:GetChildren()) do
            if string.find(v.Name:lower(), "spar_ring") and v:FindFirstChild("P2_Name") and v.P2_Name.Value == player2 then
                return v
            end
        end
    end
end

--Combat Check
while wait() do
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Defense") then
        farm("Combat")
    elseif player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        repeat
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = farm("Search").Player1_Button.CFrame
                wait(0.5)
            end
            wait()
        until farm("Search").Ring_Empty.Value == false
    end
end



--YEET



--Player 2
--Variable
local player = game.Players.LocalPlayer

--Farm
local function farm(mode)
    if mode == "Combat" and player.Character:FindFirstChild("Head") then
        player.Character.Head:Destroy()
        wait()
    elseif mode == "Search" then
        for i = 1, 5 do
            if workspace["Spar_Ring"..i].Ring_Empty.Value == true then
                return workspace["Spar_Ring"..i]
            end
        end
    end
end

--Combat Check
while wait() do
    if player.Character and player.Character:FindFirstChild("Defense") then
        farm("Combat")
    elseif player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local ring = farm("Search")
        repeat
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = ring.Player2_Button.CFrame
                wait(0.5)
            end
            wait()
        until ring.Ring_Empty.Value == false
    end
end