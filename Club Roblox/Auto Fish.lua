-- Variable
local player = game.Players.LocalPlayer
local folder = workspace.Fishing.ServerUtility

-- Fishing
while true do
	repeat
	    spawn(function()
	        game.ReplicatedStorage.RemoteEvents.FishEvents.RemoteCastLine:InvokeServer(player.Character.PrimaryPart.Position + Vector3.new(0, -10, -10))
	    end)
	    wait(.2)
	until folder:FindFirstChild(player.Name)
	folder[player.Name].ChildAdded:wait()
    repeat
        spawn(function()
            game.ReplicatedStorage.RemoteEvents.FishEvents.RemoteCaughtFish:InvokeServer()
        end)
        wait(.2)
    until not folder:FindFirstChild(player.Name)
end