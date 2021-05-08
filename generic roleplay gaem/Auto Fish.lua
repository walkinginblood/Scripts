-- Variable
local player = game.Players.LocalPlayer

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        player.Character.Humanoid:ChangeState(11)
    end)
end)

-- Epic
near = workspace.Water
pos = Vector3.new(700, 19.1, 700)
spd = 45
spawn(function()
    while true do
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(near.Position + pos)/spd, Enum.EasingStyle.Linear), {CFrame = near.CFrame + pos}):Play()
        wait(player.DistanceFromCharacter(near.Position + pos)/spd)
    end
end)

-- Auto Fish
while game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") do
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
    wait()
end