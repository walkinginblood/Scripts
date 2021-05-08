--Variable
local player = game.Players.LocalPlayer
local OldGold = player.Data.Gold.Value

--Credits
game.StarterGui:SetCore("SendNotification", {
	Title = "Discord: 8JRAyM9";
	Text = "Made by Megumu#8008";
	Icon = "";
	Duration = 30;
})

--Message
function message(text, color)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[SCRIPT]: "..text..""; Color = color; Font = Enum.Font.SourceSans; FontSize = Enum.FontSize.Size42})
end

--NoClip
function NuClip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end

player.CharacterAdded:Connect(function(plr)
	repeat wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

	--Start
	wait(_G.Delay)
	NuClip()
	wait()

	--Get in position
	player.Character.HumanoidRootPart.CFrame = CFrame.new(-50, 94, 801)
	wait(1)

	--Move
	local ti = TweenInfo.new(_G.Speed, Enum.EasingStyle.Linear)
	game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, ti, {CFrame = CFrame.new(-50, 94, 8490)}):Play()

	--Wait for it to be done
	wait(_G.Speed + 0.25)
	Stepped:Disconnect()

	--Teleport to chest
	local gold = player.Data.Gold.Value
	repeat
		player.Character.HumanoidRootPart.CFrame = workspace.GoldenChest.Collider.CFrame
		wait()
	until gold ~= player.Data.Gold.Value or not player.Character:FindFirstChild("HumanoidRootPart")
	wait()
	message("You have gained: "..player.Data.Gold.Value - OldGold.." Gold", Color3.new(0, 1, 0.5))
end)

player.Character.Head:Destroy()