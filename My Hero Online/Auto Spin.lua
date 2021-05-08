_G.Quirks = {
	["Shock Absorption"] = true,
}

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
local function gui()
	click(work["Dr. Lauren"].Click.ClickDetector)
	repeat wait(0.25) until player.PlayerGui:FindFirstChild("SpinGui")
end

--Thing
repeat
	gui()
	wait()
	local old = find().Quirk.Value
	local timer = 420
	player.PlayerGui.SpinGui.MainFrame.OptionsFrame.Spin1.RemoteEvent:FireServer(player.PlayerGui.SpinGui.MainFrame.OptionsFrame.Spin1, 100)
	repeat wait() timer = timer - 1 until old ~= find().Quirk.Value or timer <= 0
until _G.Quirks[find().Quirk.Value]