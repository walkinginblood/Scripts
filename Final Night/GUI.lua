--Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Title
local w = library:CreateWindow('Final Night [Alpha]')

--Credits
w:Section('Made by Megumu')

--Variable
local player = game.Players.LocalPlayer

--Boxes
local box = w:Box('Player', {
    flag = "player";
    type = 'string';
}, function(new, old, enter)
    for i,v in pairs(game.Players:GetPlayers()) do
        if string.find(v.Name:lower(), tostring(new):lower()) then
            getgenv().playerSel = v
            return
        end
    end
end)
local box = w:Box('Cash', {
    flag = "cash";
    type = 'number';
}, function(new, old, enter)
    player.PlayerGui.Shop.RemoteEvent:FireServer(getgenv().playerSel.leaderstats.Cash, tonumber(new))
end)
local box = w:Box('Gems', {
    flag = "gems";
    type = 'number';
}, function(new, old, enter)
    player.PlayerGui.Shop.RemoteEvent:FireServer(getgenv().playerSel.leaderstats.gems, tonumber(new))
end)
local box = w:Box('Level', {
    flag = "level";
    type = 'number';
}, function(new, old, enter)
    player.PlayerGui.Shop.RemoteEvent:FireServer(getgenv().playerSel.leaderstats.level, tonumber(new))
end)

--Buttons
local b = w:Button("Escape", function()
    for i,v in pairs(workspace.DOOR:GetChildren()) do
        if string.find(v.Name:lower(), "escape") then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            return
        end
    end
end)
local b = w:Button("Kill Others", function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v ~= player and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            game.ReplicatedStorage.DealDamage:FireServer(v.Character.Humanoid, math.huge)
        end
    end
end)
local b = w:Button("Unlock All", function()
    for i,v in pairs(getgenv().playerSel.DataStore:GetDescendants()) do
		if v:IsA("BoolValue") and v.Value == false then 
			player.PlayerGui.Shop.RemoteEvent:FireServer(v, true)
		end
	end
end)
--Clown Chance
local s = w:Slider("Killer Chance", {
   min = 0;
   max = 100;
   flag = 'chance'
}, function(v)
    player.PlayerGui.Shop.RemoteEvent:FireServer(getgenv().playerSel.leaderstats.Chance, v);
end)