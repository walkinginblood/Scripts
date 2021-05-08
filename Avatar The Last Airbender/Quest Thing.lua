--Variable
local player = game:GetService("Players").LocalPlayer
local QuestScript = require(player.PlayerGui.MainMenu.MenuControl.MainModule)

--Lel
for i, v in pairs(QuestScript) do 
	if typeof(v) == "table" then 
		if v.WhiteLotus1 then 
			print(v.WhiteLotus1)
		end
	end
end