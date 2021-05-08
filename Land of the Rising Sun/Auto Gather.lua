-- Variable
local player = game.Players.LocalPlayer

-- Script
while true do
    for i,v in pairs(workspace.Resources.Gatherables:GetChildren()) do
        if v:FindFirstChild("Button") and player:DistanceFromCharacter(v.Button.Position) < 100 then
            player.Character.Humanoid:MoveTo(v.Button.Position)
            wait(player:DistanceFromCharacter(v.Button.Position)/player.Character.Humanoid.WalkSpeed)
            workspace.Remotes.Gathering.ManageResourceEvent:FireServer(v)
            repeat wait() until v.Button.Transparency == 1
        end
    end
    wait(.25)
end