local stam = game.ReplicatedStorage.CharStats[game.Players.LocalPlayer.Name].Stamina
stam.Changed:Connect(function()
stam.Value = 100
end)