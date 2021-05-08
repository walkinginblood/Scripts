_G.HeadSize = 6.5
_G.Disabled = true
game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
        for i,v in next, game.Players:GetPlayers() do
            if v ~= game.Players.LocalPlayer then
                pcall(function()
                    v.Character.Kit.PlayerHitbox.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    v.Character.Kit.PlayerHitbox.Transparency = 0.9
                    v.Character.Kit.PlayerHitbox.BrickColor = BrickColor.new("White")
                    v.Character.Kit.PlayerHitbox.Material = "Neon"
                    v.Character.Kit.PlayerHitbox.CanCollide = false
                end)
            end
        end
    end
end)
