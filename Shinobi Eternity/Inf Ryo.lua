--Variable
local ev = game.ReplicatedStorage.Events

--Credits
game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Discord: 8JRAyM9";
    Text = "Made by Megumu#8008";
    Duration = 25;
})

--Farm
while wait() do 
	ev.GiveScroll:FireServer()
	ev.CompleteMission:FireServer("300")
end