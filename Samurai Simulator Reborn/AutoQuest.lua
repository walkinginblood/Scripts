--Settings
_G.Section = "One"

--Variable
local player = game:GetService("Players").LocalPlayer

--Find Weapon
function weapon()
	tool = player.Character:FindFirstChildOfClass("Tool")
	if player.Character and tool and tool:FindFirstChild("HitE") then 
		return tool
	else
		return false
	end
end

--Hit
if weapon() then 
	for i, child in ipairs(game:GetService("Workspace").Hitable["Section".._G.Section]:GetChildren()) do 
		if child:FindFirstChild("Health") and child.Health.Value > 0 then 
			repeat
				wait()
				weapon().HitE:FireServer(child)
			until child.Health.Value <= 0
		end
	end
end