getgenv().search = function(name)
	local result = 0
	local book
	for i,v in pairs(workspace.NewBooks:GetChildren()) do
		if string.find(v.Name:lower(), name:lower()) then
			print(v.Name)
			result = result + 1
			book = v
		end
	end
	if result == 1 then
		pcall(function()
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = book.Clickspot.CFrame * CFrame.new(0, 0, 2)
		end)
	elseif result == 0 then
		warn("no books found")
	end
end