_G.Loop = true --true/false
_G.Money = 1000000000 --Amount of money

--Variable
local RS = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer
local work = game:GetService("Workspace")

--Click
function click(part)
	if fireclickdetector then 
		--Synapse
		fireclickdetector(part)
	elseif click_detector then 
		--ProtoSmasher
		click_detector(part, 1)
	else
		player:Kick("You're not using S^X or Proto")
	end
end

--Function
local function find()
	for i, v in ipairs(RS.PlayerData:GetChildren()) do 
		if string.find(v.Name, player.Name) then
			return v
		end
	end
end

--Get Tool
local function toold()
	click(work.Bartholomew.Click.ClickDetector)
	repeat wait() until player.PlayerGui:FindFirstChild("ClickGui")
	player.PlayerGui.ClickGui.MainFrame.OptionsFrame.Accept.RemoteEvent:FireServer(player.PlayerGui.ClickGui.MainFrame.OptionsFrame.Accept)
end

--Thing
while _G.Loop do 
	local tool = player.Backpack:FindFirstChildOfClass("Tool")
	if tool == nil then 
		toold()
		repeat wait() until player.Backpack:FindFirstChildOfClass("Tool")
	end
	if tool ~= nil then
		tool.LocalScript.Experience.Value = _G.Money
		tool.LocalScript.Money.Value = _G.Money
		repeat
			for i, child in ipairs(work:GetChildren()) do 
				if child.Name == "Trash" then 
					click(child:FindFirstChildOfClass("ClickDetector"))
					wait()
				end
			end
			wait()
		until tool == nil or tool.LocalScript.Objective.Value == 3
	end
end