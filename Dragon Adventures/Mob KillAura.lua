local player = game.Players.LocalPlayer
for i,v in pairs(player.Data.Dragons:GetChildren()) do
    player.Remote:FireServer("Hit", {ID=v.Name,melee=false,hits=workspace.CollectionZones.Mobs:GetChildren()})
end