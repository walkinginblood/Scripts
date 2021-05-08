print("made by megumu")
-- Variable
local player = game.Players.LocalPlayer

-- NoClip
Stepped = game:GetService('RunService').Stepped:Connect(function()
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end)
end)

-- TP
player.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(1, 99999), 1000, math.random(1, 99999))

-- Enemy check
local enemies = {}
function enemCheck(type, en)
    if type == "Check" then
        for i = 1, #enemies do local v = enemies[i]
            if v == en then
                return false
            end
        end
        return true
    else
        for i = 1, #enemies do local v = enemies[i]
            if v == en then
                table.remove(enemies, i)
            end
        end
    end
end

-- Loop
while true do
    local stff = workspace:GetChildren()
    for i = 1, #stff do local v = stff[i]
        if enemCheck("Check", v) and v:FindFirstChild("Follow") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health >= 0 then
            table.insert(enemies, v)
            spawn(function()
				repeat
					pcall(function()
						v.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-10, 10)/10, math.random(-10, 10)/10, -3)
                        v.HumanoidRootPart.Anchored = true
                        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-10, 10)/10, math.random(-10, 10)/10, math.random(-10, 10)/10)
						player.Character.Damager:FireServer()
					end)
					wait()
                until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                enemCheck("Remove", v)
			end)
		end
    end
    wait()
end