-- Variable
local player = game.Players.LocalPlayer
local old = player.Character.HumanoidRootPart.CFrame

-- Retarded Anti-Cheat
pcall(function()
	game.Players.LocalPlayer.Character.AntiExploitCharacter:Remove()
end)

-- NoClip
local shit = game:GetService("RunService").RenderStepped:Connect(function()
	player.Character.Humanoid:ChangeState(11)
end)

-- Teleport
for i,v in pairs(workspace.Map.DlTrinket:GetChildren()) do
    repeat
        if player.Character.Humanoid.Health <= 0 then
            shit:Disconnect()
			player.Character.HumanoidRootPart.CFrame = old
            return
        end
        wait()
        pcall(function()
            player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, -10, 0)
            wait()
            game.ReplicatedStorage.Remotes.TakeTrinket:FireServer(v)
        end)
    until not pcall(function() return v.ClickDetector end)
end

-- Disable NoClip
player.Character.HumanoidRootPart.CFrame = old
shit:Disconnect()