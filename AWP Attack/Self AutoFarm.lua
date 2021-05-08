-- var
local mod = game.Players.LocalPlayer.PlayerScripts.Aero.Controllers.ItemController.AWP
local random = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
_G.found = false

-- platform
function plat()
    if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(0, 0, 0)) > 50 then
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        end)
        wait()
        if not workspace:FindFirstChild("egg salad") then
            local pl = Instance.new("Part", workspace)
            pl.Size = Vector3.new(25, 2, 25)
            pl.Anchored = true
            pl.Name = "egg salad"
            pcall(function()
                pl.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -15, 0)
            end)
        end
    end
end

-- find
function find()
	if not _G.found then
        random = Vector3.new(math.random(-17, 17), math.random(-388, 388), math.random(-14, 14))
    end
    plat()
	return random
end

-- arg
local player = game.Players.LocalPlayer
while wait(0.1) do
	if pcall(function() return player.Character.HumanoidRootPart.Position, player.Character.Humanoid.Health, player.Character.Head.Position end) then
		a1 = require(mod)
		a2 = player.Character
		a3 = Ray.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, player.Character.HumanoidRootPart.Position)
		a4 = player.Character.Head.Position + find()
		a5 = player.Character.Head
		a6 = player.Character.HumanoidRootPart.Position 
		pcall(function()
			require(mod).HitEnemy(a1, a2, a3, a4, a5, a6)
		end)
		wait()
		if player.Character.Humanoid.Health <= 0 and not _G.found then
            _G.found = true
            warn("found!")
            setclipboard("Vector3.new("..tostring(random)..")")
		end
	end
end