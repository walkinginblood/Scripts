local player = game:GetService("Players").LocalPlayer

for i, child in ipairs(player.Data.UnlockedForms:GetChildren()) do 
	local Remote = game.ReplicatedStorage.Events["ChangeCharacter"]

	local Arguments = {
			[1] = child,
			[2] = "UNLOCKED"
	}

	Remote:InvokeServer(unpack(Arguments))
end