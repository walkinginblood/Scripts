--Credits
game.StarterGui:SetCore("SendNotification", {
	Title = "Discord: 8JRAyM9";
	Text = "Made by Megumu#8008";
	Icon = "";
	Duration = 20;
})

--Script
for i,v in pairs(debug.getregistry()) do
    if type(v) == "table" then
		if v.Rarity then
			v.Rarity = 1
		end
    end
end