local player = game.Players.LocalPlayer
for i,v in pairs(workspace:GetChildren()) do
	if v:IsA("Model") and pcall(function() return require(v.mob_settings),v.Humanoid end) and require(v.mob_settings).questNeeded == player.data.notSavable.quest.questName.Value and v.Humanoid.Health > 0 then
        repeat
            pcall(function()
                v.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3)
            end)
            wait()       
            game.ReplicatedStorage.events.re:FireServer("InputBegan", "Q")
            game.ReplicatedStorage.events.re:FireServer("InputBegan", "F")
            game.ReplicatedStorage.events.re:FireServer("InputBegan", "C")
            game.ReplicatedStorage.events.re:FireServer("InputBegan", "V")
        until not pcall(function() return v.Humanoid,v.HumanoidRootPart end) or v.Humanoid.Health <= 0
	end
end