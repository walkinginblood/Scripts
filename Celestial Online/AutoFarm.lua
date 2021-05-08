-- Variable
local player = game.Players.LocalPlayer
local dmg

-- Get Remote Password
local scr = game.ReplicatedStorage.Library.Movesets.HitboxHandler
local func = debug.getproto(require(scr).Function, 1)
local consts = getconstants(func)
local remote = game.ReplicatedStorage.Server_E[consts[27]]
local pass = consts[28]

-- Script
while true do
    local shit = workspace.NPCs:GetChildren()
    for i = 1, #shit do local v = shit[i]
        pcall(function()
            remote:FireServer(pass, "D",{AirKnock=false;AttackType="Physical";Enemy=v.HumanoidRootPart;Character=player.Character;Multiplicator=1e58;CFrame=v.HumanoidRootPart.CFrame;DType="Slash"})
        end)
        wait()
    end
    wait(.25)
end