--Variable
local player = game.Players.LocalPlayer

--Credits
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Discord: 8JRAyM9";
    Text = "Made by Megumu#8008";
    Duration = 30;
})

--Farm
repeat
	player.Character.combat.update:FireServer("minigame", "waterwalk")
	wait()
	player.Character.combat.update:FireServer("minigame", "complete")
	wait()
	player.Character.combat.update:FireServer("minigame", "")
until player.statz.fodder.balance.Value == 30

--Done
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "You have max balance";
    Text = "Made by Megumu#8008";
    Duration = 25;
})

--Reset
player.Character.Head:Destroy()