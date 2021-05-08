--Variable
local plr = game.Players.LocalPlayer

--Message
local function message(text, color)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[SCRIPT]: "..text..""; Color = color; Font = Enum.Font.SourceSans; FontSize = Enum.FontSize.Size42})
end

--Kill
local function hit(player)
    plr.Character:FindFirstChildOfClass("Tool")["GunScript_Server"].InflictTarget:FireServer(player.Character:FindFirstChild("Humanoid"), player.Character:FindFirstChild("Torso"), math.huge, Vector3.new(), math.huge, math.huge, false)
end

--Script
if plr.Character:FindFirstChildOfClass("Tool") then
    if plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("GunScript_Server") then
        for i, player in pairs(game.Players:GetPlayers()) do
            if player ~= plr and player.Character and player.Character:FindFirstChild("Humanoid") then
                hit(player)
                wait(0.2)
                message("Killed: "..player.Name, Color3.new(0, 1, 0))
            end
        end
    else
        message("Could not find 'InflictTarget', try a different tool", Color3.new(1, 0, 0))
    end
else
    message("You need to hold a tool", Color3.new(1, 0, 0))
end