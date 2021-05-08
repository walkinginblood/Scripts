--Settings
local Name = "DefenceB" --DamageB | SpeedB | DefenceB
local Time = 999999
local Amount = 200

--Variable
local player = game.Players.LocalPlayer.Character

--Script
if player:FindFirstChild("Intake") then 
	--Buff
	local buff = Instance.new("NumberValue", player.Intake)
	buff.Name = Name
	buff.Value = Amount
	--Timer
	local timer = Instance.new("NumberValue", buff)
	timer.Name = "Time"
	timer.Value = Time
	--Sender
	local sender = Instance.new("ObjectValue", buff)
	sender.Name = "Sender"
	sender.Object = game.Players.LocalPlayer
end