local player = game:GetService("Players").LocalPlayer


	local Remote = game.ReplicatedStorage.Events["ChangeCharacter"]

	local Arguments = {
			[1] = player.Data.AttributePoints,
			[2] = 2000000000
	}

	Remote:InvokeServer(unpack(Arguments))
