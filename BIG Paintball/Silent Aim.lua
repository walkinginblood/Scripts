--Variable
local player = game:GetService("Players").LocalPlayer

--Camera
local camera = workspace.Camera
local sc = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)
local gs = game:GetService("GuiService"):GetGuiInset()

--ProtoSmasher Compatible
if PROTOSMASHER_LOADED then
    getgenv().mouse1click = Input.LeftClick
    getgenv().newcclosure = protect_function
    getgenv().fireclickdetector = click_detector
    getgenv().getnamecallmethod = get_namecall_method
end

--Team Check
function teamcheck(v)
    if workspace["__VARIABLES"].RoundType.Value == "FFA" then
        return true
    end
    if v.Team == player.Team then
        return false
    else
        return true
    end
end

--Get Closest Player
function closest()
    local nearest = math.huge
    local nearplr
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= player and v.Character and teamcheck(v) and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
            local pos = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local diff = math.sqrt((pos.X - sc.X)^2 + (pos.Y+gs.Y - sc.Y)^2)
            if diff < nearest then
                nearest = diff
                nearplr = v
            end
        end
    end
    return nearplr
end

--Function
function kill(key)
    local enemy = closest()
    if enemy ~= nil then
        local stff = 
        {
            [1] = 
        {
            [1] = enemy.Character.Humanoid, 
            [2] = key, 
            [3] = false, 
            [4] = false, 
            [5] = false
        }, 
            [2] = 
        {
            [1] = false, 
            [2] = false, 
            [3] = false, 
            [4] = 2, 
            [5] = 2
        }
        }
        workspace["__THINGS"]["__REMOTES"]["do damage"]:FireServer(stff)
    end
end

--Log Key
local mt = getrawmetatable(game)
make_writeable(mt)
local old = mt.__namecall
mt.__namecall = newcclosure(loadstring([[
    local old = ...
    return function(self, ...)
        local len = select("#", ...)
        local pack = {...}
        local args = {}
        for i=1,len do
            args[i] = pack[i]
        end

        local method = getnamecallmethod()
        if method == "FireServer" and tostring(self) == "new projectile" then
            return old(self, ...), kill(args[1][1][2])
        end
        return old(self, ...)
    end
]])(old))