local char

for i,v in pairs(workspace.Characters:GetDescendants()) do
if v.Name == "user" and string.find(v.Value, game.Players.LocalPlayer.UserId) then
char = v.Parent.Parent
end
end

pcall(function()
	char.Configuration:Destroy()
end)
