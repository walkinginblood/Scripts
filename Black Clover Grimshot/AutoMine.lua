-- Variable
local player = game.Players.LocalPlayer
local ts = game:GetService("TweenService")

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('brown clover')
w:Section('made by megumu')
w:Toggle('enabled', {flag = "enabled"})

-- Pickaxe Equip
local function equip()
	if player.Character:FindFirstChild("Pickaxe") then
		return true
	elseif pcall(function() return player.Backpack.Pickaxe end) then
		player.Backpack.Pickaxe.Parent = player.Character
		return true
	else
		return player:Kick("Buy a pickaxe & walk to the mine"), IB_CRASH()
	end
end

-- TP
while true do
	if w.flags.enabled then
		local stuff = workspace:GetChildren()
		for i = 1, #stuff do local v = stuff[i]
			if pcall(function() return v.MoveHere, v.Health, player.Character.Humanoid.Health end) then
				repeat
					player.Character.Humanoid:MoveTo(v.MoveHere.Position)
					wait()
				until not w.flags.enabled or v == nil or v.Parent == nil or not v:FindFirstChild("MoveHere") or player:DistanceFromCharacter(v.MoveHere.Position) < 10
				repeat
					wait()
					if equip() then
						pcall(function()
							game.ReplicatedStorage.JobRemotes.Mining:FireServer(v.MoveHere)
							player.Character.Pickaxe.Activate()
						end)
					end
				until not w.flags.enabled or v == nil or v.Parent == nil or not v:FindFirstChild("Health") or v.Health.Value <= 0
			end
		end
	end
	wait(.25)
end