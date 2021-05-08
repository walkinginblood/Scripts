local player = game:GetService("Players").LocalPlayer
player.CharacterAdded:wait()
print("added")
pcall(function()
	folder = player.Character:WaitForChild("plr_folder")
	local clone = player.Character["plr_folder"].block:Clone()
	if clone then
		player.Character["plr_folder"].block:Destroy()
		clone.Parent = player.Character["plr_folder"]
		print("deleted")
	end
end)