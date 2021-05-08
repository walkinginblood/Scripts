_G.Sword = "ElvenBloodshed"

game:GetService("ReplicatedStorage").InventoryEvents.Events.WeaponEvent:FireServer(_G.Sword)
for i, v in ipairs(game:GetService("ReplicatedStorage").InventoryEvents.Weapons:GetChildren()) do 
	print(i..": "..v.Name)
end