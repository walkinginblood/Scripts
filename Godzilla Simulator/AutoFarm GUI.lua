-- Get NPCs
Targets = {}
for i,v in pairs(workspace.Interactables:GetChildren()) do
    if not Targets[v.Name] then
        Targets[v.Name] = v.Name
    end
end

-- UI Library
local library = loadstring(game:HttpGetAsync("https://pastebin.com/raw/HYcfs6KC"))()
local w = library:CreateWindow('rawr simulator')
local cred
w:Section('Discord: PXdNwN5')
w:Toggle('Auto Farm',{flag = "enabled"})
w:Dropdown("Target", {
    location = _G;
    flag = "Target";
    list = Targets
}, function()
end)

-- Variable
local player = game.Players.LocalPlayer

-- Invisible
function invis()
	pcall(function()
		for i,v in pairs(player.Character:GetChildren()) do
			if v:IsA("Model") then
				v:Destroy()
			end
		end
	end)
end

-- NoClip
function noclip()
    Stepped = game:GetService('RunService').Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end

-- AutoFarm
while true do
    if w.flags.enabled then
        for i,v in pairs(workspace.Interactables:GetChildren()) do
            if w.flags.enabled and string.find(v.Name:lower(), _G.Target:lower()) and pcall(function() return v.Crumble,v.Main end) and v.Crumble.Value > 0 then
                noclip()
                repeat
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = v.Main.CFrame
                        invis()
                    end)
                    wait()
                    game.ReplicatedStorage.Sonsho:FireServer(v.Main)
                until not w.flags.enabled or not pcall(function() return v.Crumble end) or v.Crumble.Value <= 0
                wait()
                Stepped:Disconnect()
            end
        end
    end
    wait(.25)
end