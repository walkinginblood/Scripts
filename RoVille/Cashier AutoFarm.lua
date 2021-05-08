-- Bad exploit check
if not fireclickdetector then
    game:Shutdown()
end

-- Variable
local player = game.Players.LocalPlayer

-- Get Cashiers
local cashiers = {}
local stuff = workspace:GetDescendants()
for i = 1, #stuff do local v = stuff[i]
    if v.Name == "Cashier" then
        table.insert(cashiers, v)
    end
end

-- Get Customers
while wait() do
    for _ = 1, 3 do
        for i,v in pairs(cashiers[_].Customers:GetChildren()) do
            if v:FindFirstChild("ChoiceShow") then
                if string.find(v.ChoiceShow.TextLabel.Text, "Fries") then
                    player.Character.Humanoid:MoveTo(cashiers[_].QSpot.Position)
                    wait(player:DistanceFromCharacter(cashiers[_].QSpot.Position)/player.Character.Humanoid.WalkSpeed+0.3)
                    fireclickdetector(cashiers[_].Choices["Bloxy Fries"].ClickDetector, 1)
                elseif string.find(v.ChoiceShow.TextLabel.Text, "Cola") then
                    player.Character.Humanoid:MoveTo(cashiers[_].QSpot.Position)
                    wait(player:DistanceFromCharacter(cashiers[_].QSpot.Position)/player.Character.Humanoid.WalkSpeed+0.3)
                    fireclickdetector(cashiers[_].Choices["Bloxy Cola"].ClickDetector, 1)
                elseif string.find(v.ChoiceShow.TextLabel.Text, "Burger") then
                    player.Character.Humanoid:MoveTo(cashiers[_].QSpot.Position)
                    wait(player:DistanceFromCharacter(cashiers[_].QSpot.Position)/player.Character.Humanoid.WalkSpeed+0.3)
                    fireclickdetector(cashiers[_].Choices["Bloxy Burger"].ClickDetector, 1)
                end
            end
        end
    end
end