--[[
	Made by Megumu/Mommy Mango
	<3
]]

--Settings
_G.Enabled = true; --Toggle On/Off
_G.Type = "Basic"; --Tree Type

--Chop
local function chop()
	for i, v in pairs(workspace.Forest.SpawnPoints:GetChildren()) do
		if _G.Enabled and v:FindFirstChild(_G.Type) and v[_G.Type]:FindFirstChild("Trunk") and v[_G.Type].Health.Value > 0 then
			local stff = 
			{
				["axe"] = true, 
				["buyPrice"] = 1, 
				["stackable"] = false, 
				["chopStrength"] = 2, 
				["id"] = "Iron Axe", 
				["cooldownWaitTime"] = 0.8, 
				["damage"] = 30, 
				["textureId"] = "rbxassetid://3603588083"
			}
			game.ReplicatedStorage.Trees.TreeHitRequest:InvokeServer(v[_G.Type].Trunk, stff)
		end
	end
end

--Loop
if _G.Enabled then 
	while _G.Enabled do
		chop()
		wait()
	end
else
	chop()
end