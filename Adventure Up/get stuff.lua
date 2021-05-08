local e = game.ReplicatedStorage.Resources.Items.Data.Armors.Drops
for i,v in pairs(e:GetChildren()) do
	warn(v:FindFirstChildOfClass("ModuleScript").Name)
	print(require(v:FindFirstChildOfClass("ModuleScript")).EquipLevel)
end