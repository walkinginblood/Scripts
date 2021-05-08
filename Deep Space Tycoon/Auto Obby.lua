local buttons = {}
local stuff = workspace.MapModels["The Lobby"]["Lobby Graphic"]:GetDescendants()
local dest = workspace.MapModels["The Lobby"]["Lobby Graphic"].ObbyTeleport.Destination
local player = game.Players.LocalPlayer
for i = 1, #stuff do local v = stuff[i]
	if v.Name == "TouchReward" then
		v.Parent.CanCollide = false
		v.Parent.Transparency = 1
		table.insert(buttons, v.Parent)
	end
end
while true do
    pcall(function()
        for i,v in pairs(buttons) do
            v.CFrame = player.Character.PrimaryPart.CFrame
        end
        if player:DistanceFromCharacter(dest.Position) > 30 then
            oldpos = player.Character.PrimaryPart.CFrame
        else
            player.Character.PrimaryPart.CFrame = oldpos
        end
    end)
    wait()
end