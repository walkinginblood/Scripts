--Variables
local player = game.Players.LocalPlayer

--Teleport
player.Character.HumanoidRootPart.Anchored = true
player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y + 20, player.Character.HumanoidRootPart.Position.Z)

--Platform
local boi = Instance.new("Part", player.Character)
boi.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y - 1, player.Character.HumanoidRootPart.Position.Z)
boi.Name = "Boi"
boi.Anchored = true
boi.Size = Vector3.new(100, 1, 100)
player.Character.HumanoidRootPart.Anchored = false
wait(0.25)
player.Character.HumanoidRootPart.Anchored = true

--Insta Knife
local module = require(game.ReplicatedStorage.Module)
local thing = module.guns.Knife
thing.damage = math.huge
thing.headmult = math.huge

--Child Added
workspace.NPCs.ChildAdded:Connect(function(zombie)
	local hum = zombie:WaitForChild("HumanoidRootPart")
	local climbed = zombie:WaitForChild("Settings"):WaitForChild("Climbed")
	repeat
		wait(0.2)
	until climbed.Value == true
	hum.Anchored = true
	hum.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, -4))
end)

--Startup
for i, child in ipairs(workspace.NPCs:GetChildren()) do 
	child.HumanoidRootPart.Anchored = true
	child.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(Vector3.new(0, 0, -4))
end

--Loop Knife
if KeyDown then 
	while wait() do 
		KeyDown(0x46)
		KeyUp(0x46)
	end
elseif keypress then 
	while wait() do 
		keypress(0x46)
		keyrelease(0x46)
	end
else
	player:Kick("Get a better exploit skid")
end