--Variable
local player = game:GetService("Players").LocalPlayer
local ts = game:GetService("TweenService")
local rs = game:GetService("ReplicatedStorage")

--Tables
local npcs = {}
local shops = {}

--Check 
if not getgenv then
    player:Kick("Get a better exploit skid")
    wait(0.25)
    repeat until nil
end

--Globals
getgenv().Speed = 100

--Get NPCs
for i,v in pairs(workspace.NPCs:GetChildren()) do
    if v:FindFirstChild("Head") then
		table.insert(npcs, v.Name)
	end
end

--Get Shops
for i,v in pairs(workspace.Shops:GetChildren()) do
    if v:FindFirstChild("Head") then
		table.insert(shops, v.Name)
	end
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Tabs
local w = library:CreateWindow('TP Shit')

--Main
w:Section('Made by Purity')

--Bypass
local mt = getrawmetatable(game)
make_writeable(mt)
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
        if method == "FireServer" and tostring(self) == "RemoteEvent" then
            return
        end
        return old(self, ...)
    end
]])(old))

--Teleports
w:Dropdown("NPCs", {
    location = _G;
    flag = "memes";
    list = npcs
}, function(new)
    local nearest = workspace.NPCs[tostring(new)].Head
    player.Character.HumanoidRootPart.CFrame = nearest.CFrame
end)
w:Dropdown("Shops", {
    location = _G;
    flag = "memes";
    list = shops
}, function(new)
    local nearest = workspace.Shops[tostring(new)].Head
    player.Character.HumanoidRootPart.CFrame = nearest.CFrame
end)