local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Eggy Eggs')

--Section
w:Section('Made by Megumu')
w:Toggle('Enabled',{flag = "enabled"})

--Variable
local player = game.Players.LocalPlayer
local rs = game.ReplicatedStorage

--Noclip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("Humanoid") then 
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end

--Auto Farm
spawn(function()
	while true do
		if w.flags.enabled then
			local work = workspace.npcs.Humans:GetChildren()
			for i = 1, #work do local v = work[i]
				local e = pcall(function()
					if v.HumanoidRootPart and v.Humanoid.Health > 0 and v.NPC then
					end
				end)
				if e and w.flags.enabled then
					noclip()
					repeat
						pcall(function()
							player.Character.PrimaryPart.CFrame = v.PrimaryPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,math.random(-50, -25)/10,0)
						end)
						wait()
						rs.events.remote:FireServer("Combat")
					until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or not w.flags.enabled
					Stepped:Disconnect()
				end
			end
		end
		wait(0.25)
	end
end)