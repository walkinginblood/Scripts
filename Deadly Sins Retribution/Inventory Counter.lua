game:GetService"StarterGui":SetCore('SendNotification', {
    Title = "Amount: "..#game.Players.LocalPlayer.Data.Inventory:GetChildren();
    Text = "EGG";
    Duration = 4;
})