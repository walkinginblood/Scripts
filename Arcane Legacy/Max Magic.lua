--Variable
player = game:GetService("Players").LocalPlayer

--Check
function check()
	if player and player.Character and player.Character:FindFirstChild("Humanoid") and not player.Character:FindFirstChildOfClass("Tool") then
		for i, child in ipairs(player.Backpack:GetChildren()) do 
			if child.Name ~= "Combat" then 
				player.Character.Humanoid:EquipTool(child)
			end
		end
	end
end

--Farm
while wait() do 
	repeat check() wait() until player.Character:FindFirstChildOfClass("Tool")
	player.Character:FindFirstChildOfClass("Tool").Magic:FireServer("MC")
	player.Character:FindFirstChildOfClass("Tool").Magic:FireServer("Blast")
end