--Variable
local player = game.Players.LocalPlayer
local rem = player.Character.BlockSystem

--Destroy
player.Character.ChildAdded:Connect(function(thing)
	if thing.Name == "Blocking" or thing.Name == "PerfectBlock" then 
		thing:Destroy()
	end
end)

--Inf Block
while wait() do
	rem.Blocking:FireServer()
	wait()
	rem.NotBlocking:FireServer()
end