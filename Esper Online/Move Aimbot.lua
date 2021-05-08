--Settings
_G.Settings = {
    Range = 400;
    Blacklist = {
        ["aburtz"] = true;
    };
    Abilities = {
        A1 = {
            Name = "Ice Pound";
            Keybind = "E";
        };
    };
}

--Variable
local player = game.Players.LocalPlayer
local cryo = game.ReplicatedStorage.Remotes.Powers.Cyrokinesis
local UIS = game:GetService("UserInputService")

--Script
if _G.Enabled ~= true then
	_G.Enabled = true;
	print("Executed")
	UIS.InputBegan:Connect(function(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode[_G.Settings.Abilities.A1["Keybind"]] then
			for i, v in pairs(game.Players:GetPlayers()) do 
				if not _G.Settings.Blacklist[v.Name:lower()] and v ~= player and v.Character and v:FindFirstChild("PlayerFolder") and v.PlayerFolder:FindFirstChild("Level") and v.PlayerFolder.Level.Value > 24 and v.Character:FindFirstChild("HumanoidRootPart") and player.Character and player:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < _G.Settings["Range"] then 
					print(v.Name)
					cryo:FireServer(_G.Settings.Abilities.A1["Name"], v.Character.HumanoidRootPart.CFrame)
					cryo:FireServer(tostring(_G.Settings.Abilities.A1["Name"].."Up"), v.Character.HumanoidRootPart.CFrame)
					return
				end
			end
		end 
	end)
end