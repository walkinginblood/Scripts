--Thing
_G.Amount = 1000000000

--Variable
game:GetService("ReplicatedStorage")

local stff = 
{
	["BloodPoints"] = 
{
	["Name"] = "BloodPoints", 
	["Amount"] = _G.Amount
}
}
RS.RemoteEvents.UpdateStatsCache:FireServer(stff)