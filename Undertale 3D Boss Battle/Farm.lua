--Settings
local Enemy = "Froggit"

--Variable
local player = game.Players.LocalPlayer

--Equip
if not player.Character:FindFirstChildOfClass("Tool") then 
	player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
end

--Farm
for i, child in ipairs(workspace:GetChildren()) do 
	if child.Name == Enemy then 
		
	end
end