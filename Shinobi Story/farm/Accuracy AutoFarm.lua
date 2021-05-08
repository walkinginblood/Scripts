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
	player.Character.combat.update:FireServer("minigame", "aiming")
	wait()
	player.Character.combat.update:FireServer("minigame", "complete")
	wait()
	player.Character.combat.update:FireServer("minigame", "")
until player.statz.fodder.accuracy.Value == 80

--Done
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "You have max accuracy";
    Text = "Made by Megumu#8008";
    Duration = 25;
})

--Reset
player.Character.Head:Destroy()