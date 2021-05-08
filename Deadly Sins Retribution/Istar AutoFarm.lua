getgenv().Settings = {
	Key = 1725515953;
    PlayerCheck = true;
}

if getgenv().Settings["Key"] and pcall(function() a = game.Players.LocalPlayer.UserId end) and math.floor(getgenv().Settings["Key"]) == math.floor(game.Players.LocalPlayer.UserId*2.53) then
	print("made by megumu :)")
	if game.PlaceId == 4355528079 then
		local load
		repeat
			load = pcall(function()
				a = game.Players.LocalPlayer.Character.HumanoidRootPart
				b = game.Players.LocalPlayer.Character.CombatV1.CombatRemote
				c = workspace.Map
				d = workspace.Zaneri
				e = workspace.Spawns.Meliodas.Spawned:FindFirstChildOfClass("ObjectValue")
			end)
		until load
		print("loaded")
		-- Variable
		local player = game.Players.LocalPlayer
		
		--Player Check
		if getgenv().Settings["PlayerCheck"] then
			game.Players.PlayerAdded:Connect(function()
				game:GetService("TeleportService"):Teleport(2066381781)
			end)
		end

		-- Get Meliodas
		local meliodas
		repeat
			player.Character.PrimaryPart.CFrame = CFrame.new(8, 74, 290)
			for i,v in pairs(workspace:GetChildren()) do
				if string.find(v.Name:lower(), "meliodas") then
					meliodas = v
				end
			end
			wait()
		until meliodas ~= nil
		print("found meliodas")
		
		--Check For Weapon
		if not player.Character:FindFirstChild("Weapon") then
			player.Character.CombatV1.Equip:FireServer()
		end
		
		--Get Remote Key
		getgenv().Key = "egg"
		local mt = getrawmetatable(game)
		if PROTOSMASHER_LOADED then
			make_writeable(mt)
		else
			setreadonly(mt, false)
		end
		local old = mt.__namecall
		mt.__namecall = newcclosure(loadstring([[
			local old = ...
			return function(self, ...)
				local len = select("#", ...)
				local pack = {...}
				local args = {}
				for i=1,len do
					args[i] = pack[i]
				end
		
				local method = getnamecallmethod()
				if method == "FireServer" and tostring(self) == "CombatRemote" and tostring(args[1]) then
					getgenv().Key = tostring(args[1])
				end
				return old(self, ...)
			end
		]])(old))

		--Wait for key
		repeat
			mouse1click()
			wait(0.5)
		until getgenv().Key ~= "egg"
		print("got key")
		
		-- NoClip
		game:GetService('RunService').Stepped:Connect(function()
			if player.Character and player.Character:FindFirstChild("Humanoid") then 
				player.Character.Humanoid:ChangeState(11)
			end
		end)

		-- Attack
		spawn(function()
			while wait(0.33) do
				pcall(function()
					--Check For Weapon
					if not player.Character:FindFirstChild("Weapon") then
						player.Character.CombatV1.Equip:FireServer()
						wait(1)
					end
					player.Character.CombatV1.CombatRemote:FireServer(getgenv().Key)
				end)
			end
		end)

		-- Loop
		while wait(0.1) do
			pcall(function()
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = meliodas.PrimaryPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) + Vector3.new(0,10,0)
			end)
		end
	else
		game:GetService("TeleportService"):Teleport(4355528079)
	end
end