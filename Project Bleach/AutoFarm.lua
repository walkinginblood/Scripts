--Variable
local player = game.Players.LocalPlayer

--Credits
game.StarterGui:SetCore("SendNotification", {
Title = "AutoFarm";
Text = "By Megumu#8008";
Icon = ""; 
Duration = 12;
})

--Anti-AFK
local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

--Equip
local function Equip()
	if not player.Character:FindFirstChildOfClass("Tool") then 
		Weapon = player.Backpack:FindFirstChildOfClass("Tool")
		player.Character.Humanoid:EquipTool(Weapon)
	end
end

--Farm
local function Run()
	while wait(0.25) do
		for i, child in ipairs(workspace:GetChildren()) do 
			if player.Character and _G.NPCs[child.Name] and child:FindFirstChild("Humanoid") then 
				local health = child.Humanoid.Health
				repeat
					Equip()
					wait()
					player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, 4)) 
					Weapon.AttackClient.LeftClick:InvokeServer()
					health = child.Humanoid.Health
				until health <= 1
			end
		end
	end
end

--Run Again
workspace.ChildAdded:Connect(function(instance)
    if instance.Name == player.Name then 
		wait(2)
		Run()
	end
end)

--Startup
Run()