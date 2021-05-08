while true do
	spawn(function()
		getsenv(game.Players.LocalPlayer.Character["Fishing Rod"].core).catch()
	end)
	wait(2.6)
end