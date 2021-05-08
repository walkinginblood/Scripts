--Credits
for i = 1, 3 do 
	game:GetService"StarterGui":SetCore('SendNotification', {
		Title = "Discord: 8JRAyM9";
		Text = "Made by Megumu#8008";
		Duration = 25;
	})
end

_G.Enabled = true

--Variable
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")
local RS = game:GetService("ReplicatedStorage")

--Find Tycoon
local function find()
	for i, v in ipairs(work.Tycoons:GetChildren()) do 
		if v:FindFirstChild("Player") and v.Player.Value == player then 
			return v
		end
	end
end

--Loop
while _G.Enabled do 
	for i, child in ipairs(find().Items.OftenFiltered.Tables:GetChildren()) do 
		local stff = 
		{
			["name"] = "CollectBill", 
			["model"] = child
		}
		RS.Events.ClientTycoonInput:FireServer(find(), stff)
	end
	wait(0.25)
end