_G.Enabled = true; --Toggle On/Off

--Variables
local events = game.ReplicatedStorage.Connections
local player = game.Players.LocalPlayer

--Loop
while _G.Enabled do
	--Fish
	events.FishingCast:InvokeServer()
	repeat wait() until not player.Character:FindFirstChild("FishingRod")

	--Sell
	events.FishingSellAll:InvokeServer()

	--Buy Bait
	e = string.split(player.PlayerGui.ScreenGui.SideBait.Counter.Text, ": ")
	if tonumber(e[2]) <= 1 then 
		print("yes")
	end
	wait()
end