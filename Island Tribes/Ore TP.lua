--Settings
getgenv().Settings = {
    Speed = 50;
    Distance = 5;
}

--Variables
local ore = "ruby"
local player = game.Players.LocalPlayer

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end

--TP
for i,v in pairs(workspace:GetChildren()) do 
	if string.find(v.Name:lower(), ore) then
        noclip()
        game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(v:FindFirstChildOfClass("MeshPart").Position)/getgenv().Settings["Speed"], Enum.EasingStyle.Linear), {CFrame = v:FindFirstChildOfClass("MeshPart").CFrame + Vector3.new(0, getgenv().Settings["Distance"], 0)}):Play()
        wait(player:DistanceFromCharacter(v:FindFirstChildOfClass("MeshPart").Position)/getgenv().Settings["Speed"])
        Stepped:Disconnect()
		return
	end
end