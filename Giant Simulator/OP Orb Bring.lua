-- Variable
local player = game.Players.LocalPlayer

-- Godmode Function
local function godmode()
	repeat wait() until pcall(function() return player.Character.Humanoid end)
	if player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.Name = "1"
	end
	local l = player.Character["1"]:Clone()
	l.Parent = player.Character
	l.Name = "Humanoid"
	wait(.1)
	player.Character["1"]:Destroy()
	workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
	player.Character.Animate.Disabled = true
	wait(.1)
	player.Character.Animate.Disabled = false
end

--Start
godmode()

-- Do it again when character is added
player.CharacterAdded:Connect(function()
	godmode()
end)

-- Grab Orbs
local function grab()
    for i,v in pairs(workspace.Scene:GetChildren()) do
        if tonumber(v.Name) ~= nil then
            local th = v:GetChildren()
            for _ = 1, #th do local k = th[_]
                if k:FindFirstChildOfClass("MeshPart") and k.Position.x < 2150 then
                    return k.CFrame
				end
            end
        end
    end
end

-- Start
local old = player.Character.HumanoidRootPart.CFrame
grab()

-- TP
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        player.Character.HumanoidRootPart.CFrame = grab() + Vector3.new(0, math.random(1,30)/10,0)
		player.Character:FindFirstChildOfClass("Humanoid"):ChangeStat(11)
    end)
end)