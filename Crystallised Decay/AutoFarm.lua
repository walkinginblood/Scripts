-- Variable
local players = game.Players:GetPlayers()

-- Attack
local function attack()
	if players[1].Gem.Value == "Lapis" then
		pcall(function()
			players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Move4:FireServer(players[2].Character.HumanoidRootPart.Position)
		end)
	elseif players[1].Gem.Value == "Jasper" or players[1].Gem.Value == "Sapphire" then
		pcall(function()
			players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Move2:FireServer(players[2].Character.HumanoidRootPart.Position)
		end)
	elseif players[1].Gem.Value == "Connie" then
		pcall(function()
			if players[1].Character:FindFirstChild("Sword") then else
				players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Summon:FireServer()
			end
			players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Move2:FireServer(players[2].Character.HumanoidRootPart.Position)
		end)
		wait(.2)
	elseif players[1].Gem.Value == "Spinel" then
		pcall(function()
			players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Move3:FireServer(players[2].Character.HumanoidRootPart.Position)
		end)
	else
		pcall(function()
			players[1].Backpack:FindFirstChildOfClass("Folder"):FindFirstChildOfClass("LocalScript").Move1:FireServer(players[2].Character.HumanoidRootPart.Position)
		end)
		if players[1].Gem.Value == "Pearl" or players[1].Gem.Value == "Bismuth" then
			wait(.2)
		end
	end		
end

-- Teleport
game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		if players[1].Gem.Value == "Spinel" then
			players[1].Character.HumanoidRootPart.CFrame = players[2].Character.HumanoidRootPart.CFrame*CFrame.new(0,0,2)
		else
			players[1].Character.HumanoidRootPart.CFrame = players[2].Character.HumanoidRootPart.CFrame*CFrame.new(0,0,6)
		end
		players[1].Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
		players[1].Character.Humanoid:ChangeState(11)
	end)
end)

-- Gem Check
local function gemCheck()
    local gem = players[1].Gem.Value
    local spin = players[1].Spins.Value
    if gem == "Pearl" and spin >= 4 then
        return true
    elseif gem == "Ruby" and spin >= 4 then
        return true
    elseif gem == "Jasper" and spin >= 2 then
        return true
    elseif gem == "Sapphire" and spin >= 4 then
        return true
    elseif gem ~= "Sapphire" and gem ~= "Jasper" and gem ~= "Ruby" and gem ~= "Pearl" and spin == 1 then
        return true
    end
    return false
end

-- Loop
while players[1].Gem.Value ~= "Tanzanite" do
	repeat
		attack()
		wait()
	until gemCheck()
	repeat
		pcall(function()
			local shit = workspace:GetDescendants()
			for i = 1, #shit do local v = shit[i]
				if v:IsA("ClickDetector") then
					fireclickdetector(v, 1)
				end
			end
			players[1].PlayerGui.SpinGUI:GetChildren()[3].LocalScript.FreeRespin:FireServer(players[1])
			players[1].CharacterAdded:wait()
		end)
		wait(1)
	until players[1].Spins.Value == 0 or players[1].Gem.Value == "Tanzanite"
	if players[1].Gem.Value == "Tanzanite" then
		return
	end
end
