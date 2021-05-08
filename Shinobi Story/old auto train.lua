--Setting
_G.Enabled = true
_G.List = {
	[1] = "blocking",
	[2] = "aiming",
	[3] = "endurance",
}

--Variable
local player = game:GetService("Players").LocalPlayer
local update = player.Character.combat.update


--Function
function mission(text)
    update:FireServer("minigame", text)
	wait()
    update:FireServer("minigame", "complete")
	wait()
end

--Go through table
while _G.Enabled do 
	wait()
	for i, v in pairs(_G.List) do 
		mission(v)
	end
end