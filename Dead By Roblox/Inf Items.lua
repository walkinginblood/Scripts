--Thing
_G.Amount = 1000000000

--Variable
local RS = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer

--Remote
for i, v in ipairs(player.DataStorage.Inventory.Items:GetChildren()) do 
	local A_1 = 
	{
		[v.Name] = 
	{
		["Class"] = v:FindFirstChildOfClass("IntValue").Name, 
		["Name"] = v.Name, 
		["Amount"] = _G.Amount
	}
	}
	RS.RemoteEvents.UpdateInventoryItemsCache:FireServer(A_1)
end