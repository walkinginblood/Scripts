-- Settings
R, G, B = 255, 82, 255

-- Script
local color = Color3.new(R/255,G/255,B/255)
local shit = game.Players.LocalPlayer.PlayerGui.HUD:GetDescendants()
for i = 1, #shit do local v = shit[i]
	if v.Name == "ExpBar" or v.Name == "Divider" then
		v.BackgroundColor3 = color
	end
	if pcall(function() return v.BorderColor3 end) then
		v.BorderColor3 = color
	end
	if pcall(function() return v.TextColor3 end) then
		v.TextColor3 = color
	end
	if pcall(function() return v.ImageColor3 end) then
		v.ImageColor3 = color
	end
end