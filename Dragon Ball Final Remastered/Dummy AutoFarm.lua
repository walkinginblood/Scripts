for i,v in pairs(workspace:GetChildren()) do
    if v.Name == "Training Dummy" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
		wait(1)
		repeat
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
            end)
            wait()
            local A_2 = 
            {
                ["HitTime"] = 0.5, 
                ["Type"] = "Normal", 
                ["HitEffect"] = game:GetService("ReplicatedStorage").Resources.OtherEffects.NormalHitEffect2, 
                ["VictimCFrame"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
                ["HurtAnimation"] = game:GetService("ReplicatedStorage").Resources.Animations.HurtAnimations.Hurt3, 
                ["Velocity"] = Vector3.new(), 
                ["Sound"] = game:GetService("ReplicatedStorage").Resources.Sounds.Combat.NormalPunch, 
                ["Damage"] = 3.5
            }
            game.ReplicatedStorage.Remotes.Damage4:InvokeServer(v, A_2)
        until v.Humanoid.Health <= 0
		wait(1)
	end
end