-- Variable
local player = game.Players.LocalPlayer
local remotes = game.ReplicatedStorage.Remotes

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('Auto Fish')
w:Section('Made by Megumu')
local box = w:Box('Delay', {
    flag = "delayy";
    type = 'number';
 }, function(new, old, enter)
    _G.Speed = tonumber(new)
 end)
local t = w:Toggle('Enabled', {flag = "toggle1"})

-- Loop
while true do
	if w.flags.toggle1 and pcall(function() a = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Model.Tip.Attachment end) then
		spawn(function()
			remotes.FireBobber:InvokeServer(player.Character.Head.Position, player.Character.Head.Position, player.Character:FindFirstChildOfClass("Tool").Model.Tip.Attachment)
		end)
		wait()      
		remotes.FinishFishing:FireServer(false)
        wait()
		bobbers = player.Character:GetChildren()
		for i = 1, #bobbers do local v = bobbers[i]
			if string.find(v.Name:lower(), player.Name:lower()) then
				v:Destroy()
			end
		end
    end
    wait(_G.Speed)
end