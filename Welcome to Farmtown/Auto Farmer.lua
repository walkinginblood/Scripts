_G.farming = true --Set this to false if you wanna buy seed or do other stuff
_G.seed = "Hay" --Which seed you want to plant
_G.OutBox = false --Set this to true if you have an outbox

--Dunt mess dis down here >:C

--// VARS //--
local PlayerData = require(game.ReplicatedStorage:WaitForChild("PlayerData"))
local plr = game:GetService("Players").LocalPlayer
local selling = false

--// FUNCTIONS //--
local function fS(func, ...)
 assert(type(func) == "function")
 local args = {...}
 local bindable = Instance.new("BindableEvent")
 bindable.Event:Connect(
   function()
     func(unpack(args))
   end
 )
 bindable:Fire()
 bindable:Destroy()
end

local function isInTable(table, toFind)
 assert(type(table) == "table")
 assert(type(toFind) == "string")
 local found = false
 for _, v in pairs(table) do
   if v == toFind then
     found = true
     break
   end
 end
 return found
end

local function sellCrops()
 local data = PlayerData.get()
 if data.weight > 0 then
   selling = not selling
   if not _G.OutBox then
     plr.Character:MoveTo(Vector3.new(52, 5, -453))
     wait(2)
   end
   for crop, _ in pairs(_G.crops) do
     local cropType = crop
     local quantity = 0
     if cropType and cropType ~= "none" then
       quantity = data.crops[cropType]
     end
     game.ReplicatedStorage.UseMarket:FireServer("SellCrop", cropType, quantity, _G.OutBox)
     game.ReplicatedStorage.CropSold:Fire(cropType, quantity, _G.OutBox)
   end
   selling = not selling
 end
end

local function useWell()
 if selling then
   return
 end

 local well = _G.farm:FindFirstChild("Well")

 local wellPos = well.PrimaryPart.Position
 local plrPos = plr.Character.PrimaryPart.Position

 local distance = (plrPos - wellPos).magnitude

 if distance >= 14 then
   plr.Character:MoveTo(wellPos)
   wait(.4)
 end
end

local function createFarmPlots()
 _G.plots = {}
 _G.farm = nil

 for i = 1, 8 do
   if
     workspace:FindFirstChild("Farm" .. i) ~= nil and
     workspace["Farm" .. i]:FindFirstChild("Owner") and
     workspace["Farm" .. i].Owner.Value == plr
   then
     _G.farm = workspace["Farm" .. i]
   end
 end

 for i = 1, 6 do
   if _G.farm:FindFirstChild("Plot" .. i) ~= nil then
     table.insert(_G.plots, _G.farm["Plot" .. i])
   end
 end
end

local function plotFarm(plot)
 assert(typeof(plot) == "Instance")
 local data = PlayerData.get()

 for _, v in pairs(plot:GetChildren()) do
   if v.Name ~= "Camera1" and v.Name ~= "Camera2" and v.Name ~= "Plot" and v.Name ~= "HasGreenhouse" then
     wait()
     if v.CropType.Value ~= "none" and _G.crops[v.CropType.Value] == v.CropStage.Value then
       game.ReplicatedStorage.ManipulateCrop:FireServer(v, "Harvest")
     end
     if v.CropType.Value == "none" and data.seeds[_G.seed] then
       game.ReplicatedStorage.ManipulateCrop:FireServer(v, "PlantSeed", _G.seed)
     end
   end
 end
end

local function plotWater(plot)
 assert(typeof(plot) == "Instance")
 for _, v in pairs(plot:GetChildren()) do
   if v.Name ~= "Camera1" and v.Name ~= "Camera2" and v.Name ~= "Plot" and v.Name ~= "HasGreenhouse" then
     wait()
     if v.WaterContent.Value <= 2 then
       game.ReplicatedStorage.ManipulateCrop:FireServer(v, "Water")
       useWell()
       game.ReplicatedStorage.UseItem:FireServer(_G.farm:FindFirstChild("Well"))
     end
   end
 end
end

local function autoFarm()
 while _G.KillSwitch and wait(5) do
   if _G.farming then
     for _, plot in pairs(_G.plots) do
       sellCrops()
       fS(plotFarm, plot)
       fS(plotWater, plot)
     end
   end
 end
end

if _G.farm == nil then
 createFarmPlots()
end

if not _G.crops or not isInTable(_G.crops, "Hay") then
 _G.crops = {}
 for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Farming.Crops:GetChildren()) do
   _G.crops[v.Name] = #v:GetChildren()
 end
end

--// INIT //--
_G.KillSwitch = false -- Just in case if someone execute everything
wait(6)
_G.KillSwitch = true -- instead of just changing the _G vars up there

autoFarm()