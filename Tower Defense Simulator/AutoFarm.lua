-- Wait for stuff to load
repeat wait() until pcall(function() return game.ReplicatedStorage.RemoteFunction, game.ReplicatedStorage.RemoteEvent, game.Players.LocalPlayer.Character.HumanoidRootPart end)

-- Synapse Sex Check
if not typeof(getconnections) == "function" then
	game:Shutdown()
	wait(2)
	IB_CRASH()
end

-- Variable
local player = game.Players.LocalPlayer
local func = game.ReplicatedStorage.RemoteFunction
local even = game.ReplicatedStorage.RemoteEvent

-- Elevator Check
function elevator()
    for i,v in pairs(workspace.Elevators.Survival:GetChildren()) do
        if tonumber(string.split(v.Screen.SurfaceGui.Count.Display.Text, "/")[1]) == 0 then
            return v
        end
    end
end

-- Lobby Check
if game.PlaceId == 3260590327 then
    -- Elevator Load
    repeat wait() until pcall(function() return workspace.Elevators.Survival.Elevator.Screen.SurfaceGui.Count.Display end)
    -- Elevator Check
    while true do
        local ele = elevator()
        if ele then
            func:InvokeServer("Elevators", "Enter", {["Model"]=ele})
            repeat
                wait(.1)
            until tonumber(string.split(ele.Screen.SurfaceGui.Count.Display.Text, "/")[1]) > 1
            func:InvokeServer("Elevators", "Leave")
		end
		wait(.25)
    end
end

-- No players
game.Players.PlayerAdded:Connect(function()
    game:GetService("TeleportService"):Teleport(3260590327)
end)

-- Choose Difficulty
wait(3)
even:FireServer("Difficulty", "Vote", "Insane")

-- Load Skip Button
repeat wait() until pcall(function() return game.Players.LocalPlayer.PlayerGui["Game UI"].Skip.Move.Yes.Detector end)

-- Press dat button
local button = game.Players.LocalPlayer.PlayerGui["Game UI"].Skip.Move.Yes.Detector
while true do
	for i,v in pairs(getconnections(button.MouseButton1Click)) do
		pcall(function()
			v:Fire()
		end)
	end
	wait(1)
    for i,v in pairs(getconnections(button.MouseButton1Down)) do
        pcall(function()
        	v:Fire()
        end)
	end
	wait(1)
	for i,v in pairs(getconnections(button.Activated)) do
        pcall(function()
        	v:Fire()
        end)
	end
end