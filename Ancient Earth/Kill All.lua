-- Variable
local player = game.Players.LocalPlayer
local events = game.ReplicatedStorage.Events

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		player.Character.Humanoid:ChangeState(11)
	end)	
end)

-- Respawn
player.CharacterRemoving:Connect(function()
    game.ReplicatedStorage.Events.Morphing:FireServer("Galli")
end)

-- Kill Players
while true do
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= player and pcall(function() return v.Character.Humanoid,v.Character.HumanoidRootPart end) then
            repeat
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + Vector3.new(0, 45, 0)
                    events.Attack:FireServer(v.Character)
                end)
                wait()
            until not pcall(function() return v.Character.Humanoid,v.Character.HumanoidRootPart end) or v.Character.Humanoid.Health <= 0
        end
    end
    wait()
end