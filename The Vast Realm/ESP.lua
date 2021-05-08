-- Variable
local folder = workspace.Map.DlTrinket

-- Table
local Trinket = {}

-- Ore Check
local function espCheck(v)
    for i = 1, #Trinket do local v2 = Trinket[i]
        if v2 and v2["ore"] == v then
            return false
        end
    end
    return true
end

-- Ore Delete Check
local function trinketDeleteCheck()
    for i = 1, #Trinket do local v = Trinket[i]
        if v and v["ore"] then else
            v["esp"]:Destroy()
            Trinket[i] = nil
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
    Trinket[#Trinket+1] = {ore=instance;esp=espholder}
end

-- Check
spawn(function()
    while true do
        trinketDeleteCheck()
        wait(.35)
    end
end)

-- Yes
while wait(1) do
    local stuff = folder:GetChildren()
    for i = 1, #stuff do local v = stuff[i]
        if espCheck(v) then
            esp(v)
        end
    end
end