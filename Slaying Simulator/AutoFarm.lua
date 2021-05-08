_G.Settings = {
	Delay = 0.2;
	Area = "All"; --All or name of the area
}

while wait(_G.Settings["Delay"]) do
	for l, e in pairs(workspace.Game.Stages:GetChildren()) do
		if _G.Settings["Area"] == "All" or string.find(e.Name:lower(), _G.Settings["Area"]:lower()) then
			for i, v in pairs(e.Zombies:GetChildren()) do
				game.ReplicatedStorage.Networks.UI:FireServer("Damage", v)
			end
		end
	end
end