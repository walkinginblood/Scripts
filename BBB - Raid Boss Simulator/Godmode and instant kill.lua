--[[
    Made by Megumu/Mommy Mango
    <3
]]

_G.Settings = {
    GodMode = true; --Take no damage
    InstKill = true; --Inf Damage
    SpeedBoost = true; --SpeedBoost
}

--Variable
local player = game.Players.LocalPlayer

--AntiKick
local old;
old = hookfunction(getrawmetatable(game).__namecall,function(...)
local Method = getnamecallmethod();
if Method == "Kick" or Method == "BreakJoints" or Method == "kick" then
    return
end
return old(...)
end)

--Thingy
function buff(stat)
    if player.Character and player.Character:FindFirstChild("Intake") then
        --Buff
        local buff = Instance.new("NumberValue", player.Character.Intake)
        buff.Name = stat
        if stat == "SpeedB" then
            buff.Value = 50
		else
			buff.Value = math.huge
        end
        --Timer
        local timer = Instance.new("NumberValue", buff)
        timer.Name = "Time"
        timer.Value = 99999
        --Sender
        local sender = Instance.new("ObjectValue", buff)
        sender.Name = "Sender"
        sender.Value = player
    end
end

--Start
if _G.Settings["GodMode"] then
    buff("DefenceB")
end
if _G.Settings["InstKill"] then
    buff("DamageB")
end
if _G.Settings["SpeedBoost"] then
    buff("SpeedB")
end