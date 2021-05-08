--Settings
_G.Distance = 7

--Variable
local player = game:GetService("Players").LocalPlayer

--NoClip
local function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

--TP
noclip()
game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(player.Character.HumanoidRootPart.Position)/2, Enum.EasingStyle.Linear), {CFrame = player.Character.HumanoidRootPart.CFrame + player.Character.HumanoidRootPart.CFrame.lookVector * _G.Distance}):Play()
wait(player.Character.HumanoidRootPart.CFrame + player.Character.HumanoidRootPart.CFrame.lookVector * _G.Distance/2)
Stepped:Disconnect()