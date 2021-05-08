--Varibale
local player = game.Players.LocalPlayer
local events = game.ReplicatedStorage.Events
local tycoon
local often

--Click
function click(part)
    if fireclickdetector then
        --Synapse X
    elseif click_detector then
        --ProtoSMasher
    else
        player:Kick("gay skid")
        wait()
        repeat until nil
    end
end

--Get Tycoon
for i,v in pairs(workspace.Tycoons:GetChildren()) do
    if v.Player.Value == player then
        tycoon = v
        often = often
    end
end

--Get Customers
if tycoon.Stats.Customer.AtDoor.Value == true then
    for _,k in pairs(tycoon.Items.AlwaysFiltered.NPCs.ClientCustomers:GetChildren()) do
        --Send Customer Table
        for i,v in pairs(often.Tables:GetChildren()) do
            if v.InUse.Value == false then
                events.ClientTycoonInput:FireServer(tycoon, {["name"] = "SendToTable", ["obj"] = v, ["group"] = k.Name, ["tycoon"] = tycoon, ["customer"] = k.Name})
            end
        end
    end
end

--Get Orders
for _,k in pairs(tycoon.Items.AlwaysFiltered.NPCs:GetChildren()) do
    for i,v in pairs(k:GetChildren()) do
        click(v.ClickDetector)
    end
end

--Spawn Food
for i,v in pairs(often.Kitchen:GetChildren()) do
    if v:FindFirstChild("OrderedFoods") then
        events.SpawnFood:FireServer(tycoon, v.OrderedFoods:FindFirstChildOfClass("Model").Name)
    end
end

--Give Food
for _,k in pairs(often.Kitchen:GetChildren()) do
    if k:FindFirstChild("OrderedFoods") then
        for i,v in pairs(k.OrderedFoods:GetChildren()) do
            if v:IsA("Model") then
                for _,k in pairs(tycoon.Items.AlwaysFiltered.NPCs.ClientCustomers:GetChildren()) do
                    for _,e in pairs(k:GetChildren()) do
                        events.ClientTycoonInput:FireServer(tycoon, {["models"]={[1]=v.Name},["name"]="ManageFood",["model"]=v.Name,["customer"]=v.Name,["tycoon"]=tycoon,["group"]=k.Name})
                    end
                end
            end
        end
    end
end


--Grab Food
--[[
for i,v in pairs(often.Kitchen:GetChildren()) do
    if v:FindFirstChild("OrderedFoods") then
        events.RequestGrabFood:InvokeServer(v, v.OrderedFoods:FindFirstChildOfClass("Model").Name)
    end
end
]]