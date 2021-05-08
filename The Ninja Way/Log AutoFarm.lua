--Variable
local player = game.Players.LocalPlayer
local log = workspace["Training_Objects"]:FindFirstChild("Log")

--Script
player.Character.HumanoidRootPart.CFrame = CFrame.new(log.Position)
wait(0.5)
game:GetService"RunService".RenderStepped:Connect(function()
	game.ReplicatedStorage.Events.Movement["Create_Hitbox"]:FireServer(1)
	game.ReplicatedStorage.Events.Damage["Training_Damage"]:FireServer(log, log.Position)
end)