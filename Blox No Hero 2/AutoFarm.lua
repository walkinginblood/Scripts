-- Window
local window = Window.new("stinky poop "..math.random(1, 99999))
local label=window:AddElement("Label");label.Text="Main";label.AlignToFramePadding=false
local checkbox=window:AddElement("Checkbox");checkbox.Label="Auto-Farm"
local label=window:AddElement("Label");label.Text="Settings";label.AlignToFramePadding=false
local list=window:AddElement("List");list.Label="Example";list.Items={"Citizen", "Thug", "Criminal", "Police Chief", "Delinquent", "UA Student"};list.ItemsToShow = 3
local slide=window:AddElement("FloatSlider");slide.Min=-8;slide.Max=-3;slide.Label="Distance";slide.Value=-3;

-- Variables
local player = game.Players.LocalPlayer
local gym=game.Players.LocalPlayer.PlayerGui["NewUI Test"].Gym.Button.Key
local Keys={W="0x57";A="0x41";S="0x53";D="0x44";E="0x45";Q="0x51";}

-- NoClip
local platform = Instance.new("Part");platform.Size=Vector3.new(10,1,10);platform.Anchored=true
game:GetService("RunService").RenderStepped:Connect(function()
    if checkbox.State then
        pcall(function()
            player.Character.Humanoid:ChangeState(10)
            player.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        end)
    end
end)

-- AutoFarm
while true do
    local npc = workspace.QuestNPCS:FindFirstChild(list.Selected)
    if checkbox.State then
        for i,v in pairs(workspace.QuestNPCS:GetChildren()) do
            if v.Name == list.Items[list.Selected+1] and pcall(function() return v.HumanoidRootPart.CFrame, v.Humanoid.Health end) and v.Humanoid.Health > 0 then
                repeat
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0,slide.Value,0)
                    end)
                    wait()
                    pcall(function()
                        game.ReplicatedStorage.Remotes.Events.Combat.HandToHand:FireServer(player.Character, player.Character.Humanoid)
                    end)
                until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or not checkbox.State
            end
        end
    end
    wait(.25)
end