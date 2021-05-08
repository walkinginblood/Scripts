--Wait for load
repeat wait(1) until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

--Variable
local player = game.Players.LocalPlayer
local boss = workspace:FindFirstChild("Boss")

--Auto Rejoin | MADE BY PEPSI <3
local prompt = assert(game:GetService("CoreGui"):FindFirstChild("promptOverlay", true), "Looks like this method is patched. :/")
assert(not prompt:FindFirstChild("ErrorPrompt"), prompt:FindFirstChild("ErrorPrompt") and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
prompt.ChildAdded:Connect(function(child)
    assert(child, typeof(child) == "Instance" and child.Name == "ErrorPrompt" and child.ClassName == "Frame" and wait(2) and game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer))
end)

if game.PlaceId == 1955136 then
    wait(5)
    game:GetService("TeleportService"):Teleport(3823781113, game:GetService("Players").LocalPlayer)
end

--Equip
function equip()
	if not player.Character:FindFirstChildOfClass("Tool") then
        if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChildOfClass("Tool") and player.Character:FindFirstChild("Humanoid") then
            repeat wait() player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool")) until player.Character:FindFirstChildOfClass("Tool") and player.Character:FindFirstChildOfClass("Tool"):FindFirstChild("RemoteClick")
            return true
        else
            return false
        end
    else
        return true
    end
end

--Delet
function deletus()
    if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("RankingGui") then
        player.Character.Head:FindFirstChild("RankingGui"):Destroy()
    end
end

--NoClip
game:GetService('RunService').Stepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

--Boss Find
while wait() do
    if boss then
        if boss:FindFirstChild("Health") and boss:FindFirstChild("HumanoidRootPart") and boss.Health.Value > 0 then
            repeat
                if player.Character:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    deletus()
                end
                wait()
                if equip() then
                    player.Character:FindFirstChildOfClass("Tool").RemoteClick:FireServer()
                end
            until boss == nil or boss.Parent == nil or not boss:FindFirstChild("Health") or boss.Health.Value <= 0
            wait(1)
            game:GetService("TeleportService"):Teleport(1955136, game:GetService("Players").LocalPlayer)
            return
        end
    else
        game:GetService("TeleportService"):Teleport(1955136, game:GetService("Players").LocalPlayer)
        return
    end
end