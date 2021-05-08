--Variable
local player = game.Players.LocalPlayer

--Credits
game.StarterGui:SetCore("SendNotification", {
Title = "Discord Server: 8JRAyM9";
Text = "Made by Megumu#8008";
Icon = ""; 
Duration = 30;
})

--Message
function message(text, color)
   game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[SCRIPT]: "..text..""; Color = color; Font = Enum.Font.SourceSans; FontSize = Enum.FontSize.Size42})
end

--Equip
local function Equip()
	if not player.Character:FindFirstChildOfClass("Tool") then 
		repeat wait() until player.Backpack:FindFirstChildOfClass("Tool")
		Weapon = player.Backpack:FindFirstChildOfClass("Tool")
		player.Character.Humanoid:EquipTool(Weapon)
	end
end

--Anti AFK
repeat wait() until game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

--Startup
message("Made by Megumu#8008 <3", Color3.new(1, 0.7, 0.8))

--NoClip
game:GetService("RunService").Stepped:Connect(function()
   if player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid:ChangeState(11)
   end
end)

--Counter
local count = 0

--Farm
while wait() do 
	for i, child in ipairs(workspace:GetChildren()) do
		if player.Character and player.Character:FindFirstChild("Skills") and _G.NPCs[child.Name] and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
        	repeat
				if player.Character and player.Character:FindFirstChild("Skills") and child:FindFirstChild("HumanoidRootPart") then 
					Equip()
					player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, _G.Distance))
					if Weapon:FindFirstChild("AttackClient") and Weapon.AttackClient:FindFirstChild("LeftClick") then
						Weapon.AttackClient.LeftClick:InvokeServer()
					end
				end
				wait()
        	until child.Humanoid == nil or child.Humanoid.Health <= 0 or child:FindFirstChild("HumanoidRootPart") == nil
			count = count + 1
			if count == 1 then
				message("You've killed "..count.." Hollow")
			else
				message("You've killed "..count.." Hollows")
			end
		end
	end
end