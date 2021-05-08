local player = game.Players.LocalPlayer
local core = game.ReplicatedStorage.Core
pcall(function()
	player.Character.PrimaryPart.CFrame = player.Character.PrimaryPart.CFrame + Vector3.new(0, -10, 0)
	wait()
	player.Character.PrimaryPart.Anchored = true
end)
while wait(0.35) do
	for i,v in pairs(workspace.Logs:GetChildren()) do local v = v.Union
		if player:DistanceFromCharacter(v.Position) < 25 then
			core:FireServer("TouchDamage", "Kick", v, Color3.new(1, 0, 0.0352941), nil)
			wait(0.15)
			core:FireServer("TouchDamage", "Punch", v, Color3.new(1, 0, 0.0352941), nil)
			wait(0.25)
		end
	end
end