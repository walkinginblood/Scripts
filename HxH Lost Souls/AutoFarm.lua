_G.Enabled = true --Toggle on/off

--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")

--Check
local function check(player)
	if player and player:FindFirstChild("Humanoid") and player:FindFirstChild("HumanoidRootPart") and player.Humanoid.Health > 0 then 
		return true
	else
		return false
	end
end

--Find Thing
function find()
	for i, v in ipairs(workspace.EternalNightBox:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			return v
		end
	end
end

--NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if check(player.Character) then 
            player.Character.Humanoid:ChangeState(11)
        end
        if _G.Enabled == false then 
            Stepped:Disconnect()
        end
    end)
end

--Start
noclip()

--Cover Screen
local screen = Instance.new("Frame", game.Players.LocalPlayer.PlayerGui.Chat)
screen.Size = UDim2.new(1000, 1, 1000, 1)

--Farm
while _G.Enabled do 
	if check(player.Character) then 
		player.Character.HumanoidRootPart.CFrame = find().HumanoidRootPart.CFrame + Vector3.new(0, math.random(-10, 10), 0)
    end
	if workspace:FindFirstChildOfClass("Camera") then
		workspace:FindFirstChildOfClass("Camera"):Destroy()
	end
	RS.Remotes.MeleeAttack:FireServer(true)
	wait(0.1)
	RS.Remotes.KoDown:FireServer()
	wait(0.25)
	RS.Remotes.KoUp:FireServer()
	wait()
	print("Strength Level: "..player.Stats.Strength.Value)
	print("Strength EXP: "..player.Stats.StrengthXP.Value)
end