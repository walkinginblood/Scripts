-- Exploit Check
if not pcall(function() return getfenv,debug.getupvalues end) then
    game:Shutdown()
end

-- Variable
local plr = game.Players.LocalPlayer
local scr = plr.PlayerScripts.LocalHandler
local inv = game.ReplicatedStorage.InvokeHandler

-- Get Handshake
function shake()
	local stuff = getreg()
	for i = 1, #stuff do local v = stuff[i]
		if typeof(v) == "function" and getfenv(v).script == scr and typeof(debug.getupvalues(v)[2]) == "string" then
			return debug.getupvalues(v)[2]
		end
	end
end
local handshake = shake()

-- Get Jobs
local jobs = {}
for i,v in pairs(plr.PlayerGui.Jobs:GetChildren()) do
    table.insert(jobs, v.Name)
end

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('1987')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "enabled"})
w:Dropdown("Jobs", {
    location = _G;
    flag = "memes";
    list = jobs
}, function()
end)

-- Loop
while true do
    if w.flags.enabled and not plr.PlayerGui.Notifications.WorkTimer.Frame.Visible then
        for i,v in pairs(plr.PlayerGui.Jobs[_G.memes]:GetChildren()) do
            if string.find(v.Name, _G.memes) then
                inv:InvokeServer("ChangeJob", handshake, _G.memes, v.Name)
                inv:InvokeServer("StartWork", handshake, _G.memes, v.Name)
            end
        end
    end
    wait()
end