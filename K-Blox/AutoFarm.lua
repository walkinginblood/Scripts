_G.Distance = 3
_G.NPCs = {
	["Thug"] = true
}

--Variable
local player = game.Players.LocalPlayer

--Credits
game.StarterGui:SetCore("SendNotification", {
Title = "Discord Server: 8JRAyM9";
Text = "Made by Megumu#8008";
Icon = ""; 
Duration = 30;
})

--Anti AFK
repeat wait() until game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

--NoClip
game:GetService("RunService").Stepped:Connect(function()
   if player.Character and player.Character:FindFirstChild("Humanoid") then
      player.Character.Humanoid:ChangeState(10)
   end
end)

--Farm
while wait() do 
	for i, child in ipairs(workspace:GetChildren()) do
		if player.Character and _G.NPCs[child.Name] and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
        	repeat
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("HumanoidRootPart") then 
					player.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, _G.Distance))
					wait()
					game.ReplicatedStorage.Events.fightingStuff:FireServer("usingCombathoe", Vector3.new(), CFrame.new(), nil)
				end
				wait()
        	until child.Humanoid == nil or child.Humanoid.Health <= 0 or child:FindFirstChild("HumanoidRootPart") == nil
		end
	end
end