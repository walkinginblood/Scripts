-- Variable
local player = game.Players.LocalPlayer

-- No Cooldown
player.Character:BreakJoints()
player.CharacterAdded:Connect(function(char)
	repeat wait() until char:FindFirstChild("cd")
	char.cd.ChildAdded:Connect(function(v)
		game:GetService("RunService").RenderStepped:wait()
		v:Destroy()
	end)
end)

-- Get Dialogues
local dia = {}
for i,v in pairs(workspace.dialogues:GetChildren()) do
	if v:FindFirstChild("clicky") then
		table.insert(dia, v.Name)
	end
end

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('canibalims online')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "toggle1"})
w:Dropdown("dialogues", {
	location = _G;
	flag = "memes";
	list = dia
}, function(new)
	if fireclickdetector then
		fireclickdetector(workspace.dialogues[new].clicky.ClickDetector, 1)
	else
		player.Character.HumanoidRootPart.CFrame = workspace.dialogues[new].clicky.CFrame+Vector3.new(0,5,0)
	end
end)

-- Loop
while true do
	if w.flags.toggle1 then
		game.ReplicatedStorage.events.re:FireServer("InputBegan", "Q")
		game.ReplicatedStorage.events.re:FireServer("InputEnded", "Q")
	end
	wait()
end