local gui = Window.new("Hitbox Expander")
local label = gui:AddElement("Label")
local size = gui:AddElement("FloatSlider")
label.Text = "Made by Megumu"
size.Min = 4
size.Max = 16
size.Value = 6
size.Label = "Size"
local trans = gui:AddElement("FloatSlider")
trans.Min = 0
trans.Max = 1
trans.Value = 0.8
trans.Label = "Transparency"
local color = gui:AddElement("ColorPicker")
color.Label = "Color"

local mt = getrawmetatable(game)
local old = mt.__index
make_writeable(mt)
mt.__index = protect_function(function(t, k)
    if k == "Size" and typeof(t) == "Instance" and tostring(t) == "HumanoidRootPart" then
		return nil
    end
    return old(t, k)
end)

while true do
    local plrs = game.Players:GetPlayers()
    for i = 1, #plrs do local v = plrs[i]
        if v.Name ~= game.Players.LocalPlayer.Name  then
            pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(size.Value, size.Value, size.Value)
                v.Character.HumanoidRootPart.Transparency = trans.Value
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new(color.Color)
                v.Character.HumanoidRootPart.Material = "Neon"
                v.Character.HumanoidRootPart.CanCollide = false
            end)
        end
    end
    wait(.7)
end