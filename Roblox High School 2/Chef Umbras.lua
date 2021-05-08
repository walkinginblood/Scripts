local RS = game:GetService("ReplicatedStorage")

while wait() do
	for i, v in ipairs(game:GetService("Workspace")["!Zone_TheVoid"]:GetChildren()) do 
		if string.find(v.Name, "Shrine") then
			RS.Remotes.SendJobDataAsync:InvokeServer("Chef Umbra's", "PickUpFood", true)
			wait()
			RS.Remotes.SendJobDataAsync:InvokeServer("Chef Umbra's", "ActivateShrine", A_3)
		end
	end
end