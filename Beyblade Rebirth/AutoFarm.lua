-- Main
local w = Window.new("B: Rebirth | Farm "..tostring(math.random(1, 9999)))

-- Credits
local cred = w:AddElement("Label");cred.Text="Made by Megumu";cred.AlignToFramePadding = false;

-- Toggles
local enabled = w:AddElement("Checkbox");enabled.Label = "Enabled";
local collision = w:AddElement("Checkbox");collision.Label = "No Collision"
local upgrade = w:AddElement("Checkbox");upgrade.Label = "Upgrade Attack"
local jumping = w:AddElement("Checkbox");jumping.Label = "Jumping"

-- Section
w:AddElement("HorizontalSeparator")
local s1 = w:AddElement("Label"); s1.Text = "Targets"; cred.AlignToFramePadding = false;

-- Get Targets
Targets = {}
for i,v in pairs(workspace.mobs:GetChildren()) do
    if not Targets[v.Name] then
        Targets[v.Name] = w:AddElement("Checkbox")
        Targets[v.Name].Label = v.Name
    end
end

-- Variable
local player = game.Players.LocalPlayer

-- Blade
local function getBlade()
    if workspace.beyblades:FindFirstChild(player.Name) then
        return workspace.beyblades[player.Name]
    end
    return false
end

-- MeshPart or Union?
local function partCheck(part)
    local mesh = part:FindFirstChildOfClass("MeshPart")
    local union = part:FindFirstChildOfClass("UnionOperation")
    if mesh then return mesh end
    if union then return union end
    return false
end

-- Get Nearest Rock
local function getRock()
    Closest = false
    local Distance = 250
    local stuff = workspace.mobs:GetChildren()
	for _ = 1, #stuff do local v = stuff[_]
        if enabled.State and getBlade() and partCheck(v) and Targets[v.Name].State and v:FindFirstChild("health") and v.health.Value > 0 then
            local newDistance = (partCheck(v).Position - getBlade().Torso.Position).magnitude
            if newDistance < Distance then
                Closest = v
                Distance = newDistance
            end
        end
    end
    if typeof(Closest) == "Instance" then
        return partCheck(Closest)
    else
        return false
    end
end

-- Auto Upgrade
spawn(function()
    while true do
        if upgrade.State then
            game.ReplicatedStorage.event:FireServer("attri", tick(), "atk")
        end
        wait(.7)
    end
end)

-- Farm
while true do
    local rock = getRock()
    if enabled.State and getBlade() and rock then
        repeat
            if getBlade() and rock then
                if collision.State then
                    rock.CanCollide = false
                end
                getBlade():FindFirstChildOfClass("Humanoid"):MoveTo(rock.Position)
                if jumping.State and getBlade():FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Jumping and getBlade():FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Freefall then
                    getBlade():FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                end
                if (rock.Position - getBlade().Torso.Position).magnitude < 15 then
                    for i = 1, 4 do
                        spawn(function()
                            game.ReplicatedStorage.func:InvokeServer("skill", tick(), i)
                        end)
                    end
                    spawn(function()
                        game.ReplicatedStorage.func:InvokeServer("awaken", tick())
                    end)
                end
            end
            wait(.1)
        until not getBlade() or not enabled.State or partCheck(rock.Parent)
    elseif enabled.State and not getBlade() then
        game.ReplicatedStorage.event:FireServer("launch", tick())
        local time = 50
        repeat wait(.1) time = time - 1 until time <= 0 or getBlade()
    end
    wait(.25)
end