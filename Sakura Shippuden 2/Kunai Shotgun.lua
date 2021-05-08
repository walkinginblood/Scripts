--Variable
local player = game.Players.LocalPlayer
_G.Amount = 100000

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Weeb Shit')

--Section
w:Section('Kunai')

--Amount
local box = w:Box('Amount', {
    flag = "amount";
    type = 'number';
}, function(new, old, enter)
    _G.Amount = tonumber(new)
end)

--Inf Kunai
local b = w:Button("Add Kunai", function()
    if player.Character and player.Character:FindFirstChild("Throw") and player.Character.Throw:FindFirstChild("Kunai") then
        player.Character.Throw.Kunai:FireServer(nil, tonumber("-".._G.Amount))
    end
end)

--Keybind
w:Bind("Shotgun", {
    flag = "shotgun";
    kbonly = true;
    default = Enum.KeyCode.RightAlt;
}, function()
    if player.Character and player.Character:FindFirstChild("Throw") and player.Character.Throw:FindFirstChild("Kunai") then
        player.Character.Throw.Kunai:FireServer(CFrame.new(), _G.Amount)
    end
end)