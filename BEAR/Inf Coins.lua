local part = workspace.Obby.Quidz
local player = game.Players.LocalPlayer

player.Character.ChildAdded:Connect(function(v)
	game:GetService("RunService").RenderStepped:wait()
	v:Destroy()
end)

while wait() do	
	fake_touch(part,player.Character.HumanoidRootPart,true)
	wait()
	fake_touch(part,player.Character.HumanoidRootPart,false)
	wait()
end