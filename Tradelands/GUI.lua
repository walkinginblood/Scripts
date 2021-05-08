--Variable
local player = game:GetService("Players").LocalPlayer
local npcs = {}
local ts = game:GetService("TweenService")

--Globals
getgenv().Speed = 100

--Get Traders
for i,v in pairs(workspace.NPCs:GetChildren()) do
	if v:FindFirstChild("Head") then
		table.insert(npcs, v.Name)
	end
end

--NoClip
function noclip()
	Stepped = game:GetService('RunService').Stepped:Connect(function()
		if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then 
			player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
		end
	end)
end

--UI Library
local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

--Main
local w = library:CreateWindow('Trade TP')

--Section
w:Section('Made by Purity')
w:Button('GodMode', function()
    pcall(function()
        player.Character.Head:Destroy()
        player.CharacterAdded:wait()
        folder = player.Character:WaitForChild("plr_folder")
        local clone = player.Character["plr_folder"].block:Clone()
        if clone then
            pcall(function()
                player.Character["plr_folder"].block:Destroy()
                clone.Parent = player.Character["plr_folder"]
            end)
        end
    end)
end)

--Teleports
w:Section('Teleports')
w:Dropdown("NPCs", {
    location = _G;
    flag = "memes";
    list = npcs
}, function(new)
    local nearest = workspace.NPCs[tostring(new)].Head
    noclip()
    ts:Create(player.Character.HumanoidRootPart, TweenInfo.new(player:DistanceFromCharacter(nearest.Position)/getgenv().Speed, Enum.EasingStyle.Linear), {CFrame = nearest.CFrame}):Play()
    wait(player:DistanceFromCharacter(nearest.Position)/getgenv().Speed)
    Stepped:Disconnect()
end)