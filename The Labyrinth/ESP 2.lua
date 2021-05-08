-- Variable
local folder = workspace.Resources.Glade.Ores
local folder2 = workspace.Resources.Maze.Ores

-- Table
local Ores = {}

-- Ore Check
local function espCheck(v)
    for i = 1, #Ores do local v2 = Ores[i]
        if v2 and v2["ore"] == v then
            return false
        end
    end
    return true
end

-- Ore Delete Check
local function oreDeleteCheck()
    for i = 1, #Ores do local v = Ores[i]
        if v and v["ore"] then
            if v["ore"]:FindFirstChild("MainPart") and v["ore"].Properties.Health.Value > 0 then else
                v["esp"]:Destroy()
                Ores[i] = nil
            end
        end
    end
end

-- Create ESP
local function esp(instance)
    -- Billboard
	local espholder = Instance.new("BillboardGui", instance.MainPart)
	espholder.Name = "Megumu ESP"
    espholder.AlwaysOnTop = true
    espholder.Size = UDim2.new(0,200,0,50)

    -- Text
    local esp = Instance.new("TextLabel", espholder)
    esp.Size = UDim2.new(0,200,0,50)
    esp.Text = string.split(instance.Name, "_")[1]
    esp.BackgroundTransparency = 1
    esp.TextColor3 = instance.Rock.Color
    esp.Font = Enum.Font.SciFi
    esp.TextStrokeTransparency = 0
    esp.TextScaled = true
    esp.Position = esp.Position + UDim2.new(0,0,0,-35)

    -- Chams
    local cham = Instance.new('BoxHandleAdornment', espholder)
    cham.Name = instance.Name
    cham.Size = instance.Rock.Size
    cham.Adornee = instance.Rock
    cham.AlwaysOnTop = true
    cham.ZIndex = 5
    cham.Transparency = 0.5
    cham.Color3 = instance.Rock.Color
    
    -- Add to table
    Ores[#Ores+1] = {ore=instance;esp=espholder}
end

-- Check
spawn(function()
    while true do
        oreDeleteCheck()
        wait(.35)
    end
end)

-- Yes
while wait(1) do
    local stuff = folder:GetChildren()
    for i = 1, #stuff do local v = stuff[i]
        if v:FindFirstChild("MainPart") and v.Properties.Health.Value > 0 and espCheck(v) then
            esp(v)
        end
    end
    local stuff = folder2:GetChildren()
    for i = 1, #stuff do local v = stuff[i]
        if v:FindFirstChild("MainPart") and v.Properties.Health.Value > 0 and espCheck(v) then
            esp(v)
        end
    end
end