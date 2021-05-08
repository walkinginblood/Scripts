_G.Enabled = true --Toggle On/Off

--Variable
local player = game.Players.LocalPlayer

--Find Free Dummy
local function Free()
	for i = 1, 4 do 
		if workspace["Tramp"..i]["In_Use"].Value == false then 
			repeat
				player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace["Tramp"..i].Touch.Position)
				wait(1)
				game.ReplicatedStorage["Strength_Exercises"]["Tramp"..i]:FireServer()
			until workspace["Tramp"..i]["In_Use"].Value == true
			TRAMP = workspace["Tramp"..i]
			return
		end
	end
end

--Loop
local function Loop()
	Free()
	wait()
	repeat
		wait()
	until TRAMP["In_Use"].Value == false
	wait()
	if _G.Enabled then 
		Loop()
	end
end

--Startup
Loop()