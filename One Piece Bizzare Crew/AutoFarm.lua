function folder()
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "Wood Dummy" then
			return v.Parent
		end
	end
end

local player = game.Players.LocalPlayer

function equip()
	pcall(function()
		player.Character.Humanoid:EquipTool(player.Backpack.Combat)
	end)
end

function des()
	pcall(function()
		player.Character.Head.NameGui:Destroy()
	end)
end

while wait() do
	for i,v in pairs(folder():GetChildren()) do
		if string.find(v.Name:lower(), "buggy") and not string.find(v.Name:lower(), "boss") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			repeat
				pcall(function()
					equip()
					des()
					wait()
					player.Character.HumanoidRootPart.CFrame = v.Head.CFrame + Vector3.new(0, 4, 0)
					wait()
					player.Character.Combat.Damage:FireServer(player.PlrStats.Stats.Money, v.Head, v.Head.Position)
				end)
				wait()
			until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
		end
	end
end