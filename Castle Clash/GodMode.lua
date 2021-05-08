_G.Enabled = true; -- Toggle On/Off

if _G.Enabled == false then
	pcall(function()
		game.Players.LocalPlayer.Character.Head:Destroy()
	end)
end
if _G.Executed == nil then
	_G.Executed = true
	while true do
		if _G.Enabled then
			pcall(function()
				local player = game.Players.LocalPlayer
				local dam = player.Character.damagers:Clone()
				player.Character.damagers:Destroy()
				dam.Parent = player.Character
			end)
		end
		wait(1)
	end
end