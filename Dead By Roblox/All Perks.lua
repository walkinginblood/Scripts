--Variable
local RS = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer

--Remote
for i, v in ipairs(player.DataStorage.Inventory.Perks.Survivor:GetChildren()) do 
	local A_1 = 
	{
		[v.Name] = 
	{
		["Got"] = true, 
		["Name"] = v.Name, 
		["Tier"] = 3
	}
	}
	RS.RemoteEvents.UpdateInventoryPerksSurvivorCache:FireServer(A_1)
end