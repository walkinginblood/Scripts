_G.Amount = 100000
_G.Stat = "Health" --Health | Power | Speed | Energy | EnergyControl

for i = 1, _G.Amount do 
	local Arguments = {
			[1] = game:GetService("Players").LocalPlayer.Data[_G.Stat]
	}
	game:GetService("ReplicatedStorage").Events.RaiseStat:FireServer(unpack(Arguments))
	wait()
end