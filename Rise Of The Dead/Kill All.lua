-- Variable
local player = game.Players.LocalPlayer

-- Remote
while wait() do
    spawn(function()
        game.ReplicatedStorage.Remotes.Shop.PurchaseAmmunition:InvokeServer(workspace.Interactables.Shop, "#1")
    end)
    egg = workspace.Entity:GetChildren()
    for i = 1, #egg do local v = egg[i]
        if string.find(v.Name:lower(), "zombie") then
            pcall(function()
                local stff = {
                    ["ShotPoint"] = v.Head.Position, 
                    ["Direction"] = Vector3.new(-0.441240996, -0.0738532469, 0.894344628), 
                    ["Victims"] = 
                {
                    [1] = 
                {
                    ["Object"] = v.Head, 
                    ["Index"] = 0
                }
                }, 
                    ["ShotOrigin"] = v.Head.Position, 
                    ["TargetPoints"] = 
                {
                    [1] = v.Head.Position
                }
                }
                game.ReplicatedStorage.Remotes.Weapons.PrimaryFire:FireServer("#1", player.Character:FindFirstChildOfClass("Model"), stff)
            end)
            wait(0.1)
        end
    end
    wait(0.25)
end