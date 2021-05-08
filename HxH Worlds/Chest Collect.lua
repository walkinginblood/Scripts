--Setting
_G.Loop = true

--Variable
local player = game:GetService("Players").LocalPlayer

--Script
local function thing()
	for i, child in ipairs(game:GetService("Workspace").Interactions.MiscPoints:GetChildren()) do 
		if string.find(child:FindFirstChild("Value").Value, "Chest") and child:FindFirstChild("RemoteEvent") and not child:FindFirstChild("OpenDebounce") then 
			local old = player.Persistance.Data.Stats.Jeni.Value
			local timer = 100
			player.Character.HumanoidRootPart.CFrame = CFrame.new(child.Position.X, child.Position.Y + 10, child.Position.Z)
			repeat
				wait()
				timer = timer - 1
				child.RemoteEvent:FireServer("SentArgument")
			until old < player.Persistance.Data.Stats.Jeni.Value or timer <= 0
		end
	end
end

--Start
if _G.Loop then 
	while _G.Loop do
		thing()
		wait()
	end
else
	thing()
end