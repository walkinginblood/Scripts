--Variable
local player = game.Players.LocalPlayer

--Equip
local function Equip()
	if player.Character and player.Character:FindFirstChild("weapon_stuff") and not player.Character["weapon_stuff"]:FindFirstChild("equiped") and player.Character["weapon_stuff"]:FindFirstChild("unequiped") then 
		game.ReplicatedStorage["game_events"].re:FireServer("inputBegan", "Q")
	end
end

--Loop Sword & NoClip
game:GetService"RunService".RenderStepped:Connect(function()
	game.ReplicatedStorage["game_events"].re:FireServer("button1Down")
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

--AutoFarm & AutoCollect
while wait() do
	for i, child in ipairs(workspace.mobs:GetChildren()) do
		for i, v in pairs(_G.NPCs) do  
			if string.find(child.Name, v) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then 
				repeat
					if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("HumanoidRootPart") then 
						player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,_G.Distance,0)
						Equip()
						wait()
					end
					wait()
				until child.Humanoid.Health <= 0 or child == nil or child.HumanoidRootPart == nil
			end
		end
	end
end