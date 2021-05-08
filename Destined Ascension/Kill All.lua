local player = game.Players.LocalPlayer
for i,v in pairs(workspace.MobFolder:GetChildren()) do
    local hum = v:FindFirstChildOfClass("Humanoid")
    local tool = player.Character:FindFirstChildOfClass("Tool")
    if hum and tool then
        tool.SwingSend:FireServer("Hit", hum, hum.Health, false, 0)
    end
end