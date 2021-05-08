local root = game.Players.LocalPlayer.Character.Head
local event = workspace.Remotes.placerSystem.placeLogEvent
for i = 1, 1000, 1.5 do
local A_1 = 
{
[1] = root.CFrame*CFrame.new(0,0,-2.5)+Vector3.new(0,i,0), 
[2] = "Pine Log"
}
event:FireServer(A_1)
end