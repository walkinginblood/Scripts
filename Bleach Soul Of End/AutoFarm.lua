--Variable
local player = game.Players.LocalPlayer

--Equip
local function Equip()
	if player.Character and player.Character:FindFirstChild("Backpack") then 
		game.ReplicatedStorage.Remotes.Inventory:FireServer("Insert Item", "Zanpakuto")
	end
end

--Farm
local function Farm()
	pcall(function()
		while wait() do
			for i, child in ipairs(workspace.Spawners.Hollows:GetChildren()) do 
				if player.Character and _G.NPCs[child.Name] and child:FindFirstChildOfClass("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
					local health = child:FindFirstChildOfClass("Humanoid").Health
					repeat
						wait()
						if player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health <= 0 then 
							break
						end
						if _G.AutoPoints == true then 
							game.ReplicatedStorage.Remotes.Data:FireServer("Kendo Input", "1")
						end
						if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
							Equip()
							player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(math.random(-3, 3), 0, 2))
						end
						if child:FindFirstChildOfClass("Humanoid") then 
							health = child:FindFirstChildOfClass("Humanoid").Health
						end
					until health <= 0
				end
			end
		end
	end)
end

--Run again
workspace.ChildAdded:Connect(function(thing)
	if thing.Name == player.Name then 
		repeat
			wait(0.25)
		until player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Backpack")
	end
end)

--Attack
game:GetService"RunService".RenderStepped:Connect(function()
	game.ReplicatedStorage.Remotes.Weapon:FireServer("Swing Attack")
end)

--Startup
Farm()