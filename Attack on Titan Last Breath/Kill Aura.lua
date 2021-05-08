--[[
	Made by Megumu
	<3
]]

-- UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()
local w = library:CreateWindow('titan attack no breath')
w:Section('Made by Megumu')
w:Toggle('Enabled', {flag = "enabled"})
w:Toggle('Teleport', {flag = "tp"})
w:Slider("Range", {
   min = 3;
   max = 30;
   flag = 'range'
}, function(v)
   print(v)
end)

-- Variable
local player = game.Players.LocalPlayer

-- Get Code
local ni = getnilinstances()
local code
for i = 1, #ni do local v = ni[i]
	if v:IsA("LocalScript") and pcall(function() return getsenv(v).Code end) then
		code = getsenv(v).Code
	end
end

-- Yeet them titans
if code then
    while true do
        if w.flags.enabled then
            local titans = workspace.Titans:GetChildren()
            for i = 1, #titans do local v = titans[i]
                if pcall(function() return v.Main.Died,v.Nape end) and not v.Main.Died.Value then
                    pcall(function()
                        if w.flags.tp then
                            player.Character.PrimaryPart.CFrame = v.Nape.CFrame + Vector3.new(0,25,0)
                            wait(.3)
                            workspace.Settings.Input:FireServer(code, v.Nape)
                        elseif player:DistanceFromCharacter(v.Nape.Position) < w.flags.range * 10 then
                            workspace.Settings.Input:FireServer(code, v.Nape)
                        end
                    end)
                    wait()
                end
            end
        end
        wait()
    end
end