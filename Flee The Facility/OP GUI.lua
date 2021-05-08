--- GUI Was Made By Pro Hacks :)
--- Credit For The Scripts Goes To Their Real Owner(s)
--- ENOJY!!!
local FleeTheFacilityGUI = Instance.new("ScreenGui")
local OpenFrame = Instance.new("Frame")
local Open = Instance.new("ImageButton")
local OpenLabel = Instance.new("TextLabel")
local Click = Instance.new("ImageButton")
local MainFrame = Instance.new("ImageLabel")
local Label = Instance.new("TextLabel")
local PlayersToggleButton = Instance.new("TextButton")
local ComputersToggleButton = Instance.new("TextButton")
local PodsToggleButton = Instance.new("TextButton")
local ExitDoorsToggleButton = Instance.new("TextButton")
local DoorsToggleButton = Instance.new("TextButton")
local AirVentsToggleButton = Instance.new("TextButton")
local ReloadESP = Instance.new("TextButton")
local HackingFailToggle = Instance.new("TextButton")
local Running = Instance.new("ImageButton")
local Close = Instance.new("TextButton")
local Credit = Instance.new("TextLabel")
local blur = Instance.new("BlurEffect")
--Properties:
FleeTheFacilityGUI.Name = "FleeTheFacilityGUI "
FleeTheFacilityGUI.Parent = game.CoreGui
FleeTheFacilityGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

blur.Parent = game.Lighting
blur.Enabled = false

OpenFrame.Name = "OpenFrame"
OpenFrame.Parent = FleeTheFacilityGUI
OpenFrame.BackgroundColor3 = Color3.new(1, 1, 1)
OpenFrame.BackgroundTransparency = 1
OpenFrame.Position = UDim2.new(0, 0, 0.609708726, 0)
OpenFrame.Size = UDim2.new(0, 100, 0, 100)

Open.Name = "Open"
Open.Parent = OpenFrame
Open.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
Open.BackgroundTransparency = 1
Open.BorderSizePixel = 0
Open.Position = UDim2.new(0.128758907, 0, 0.290485531, 0)
Open.Size = UDim2.new(0, 74, 0, 50)
Open.Image = "rbxassetid://1285673399"
Open.ImageColor3 = Color3.new(0.101961, 0.737255, 0.611765)
Open.ScaleType = Enum.ScaleType.Slice
Open.SliceCenter = Rect.new(8, 8, 247, 247)
Open.MouseButton1Down:connect(function()
	Running.Visible = true
	blur.Enabled = true
	Open.Position = UDim2.new(0.129, 0, 0.32, 0)
	Click.Position = UDim2.new(0.129, 0, 0.37, 0)
	wait(0.1)
	Open.Position = UDim2.new(0.128758907, 0, 0.27048552, 0)
	Click.Position = UDim2.new(0.128758907, 0, 0.330485493, 0)
	wait(0.13)
	OpenFrame.Visible = false
	Running:TweenPosition(UDim2.new(0.549, 0, 0.322, 0), 'Out', 'Quint', 7)
	wait(4)
	Credit.TextTransparency = 0.9
	wait(0.1)
	Credit.TextTransparency = 0.8
	wait(0.1)
	Credit.TextTransparency = 0.7
	wait(0.1)
	Credit.TextTransparency = 0.6
	wait(0.1)
	Credit.TextTransparency = 0.5
	wait(0.1)
	Credit.TextTransparency = 0.4
	wait(0.1)
	Credit.TextTransparency = 0.3
	wait(0.1)
	Credit.TextTransparency = 0.2
	wait(0.1)
	Credit.TextTransparency = 0.1
	wait(0.1)
	Credit.TextTransparency = 0
	wait(3)
	blur.Enabled = false
	Running.Position = UDim2.new(-0.120437965, 0, 0.322330087, 0)
	Credit.TextTransparency = 1
	MainFrame:TweenPosition(UDim2.new(0.421, 0, 0.315, 0), 'Out', 'Bounce', 3)
end)

OpenLabel.Name = "OpenLabel"
OpenLabel.Parent = Open
OpenLabel.AnchorPoint = Vector2.new(0, 0.5)
OpenLabel.BackgroundTransparency = 1
OpenLabel.Position = UDim2.new(0.108108111, 0, 0.5, 0)
OpenLabel.Size = UDim2.new(0.783783793, 0, 1, 0)
OpenLabel.Font = Enum.Font.SourceSans
OpenLabel.Text = "Open"
OpenLabel.TextColor3 = Color3.new(1, 1, 1)
OpenLabel.TextScaled = true
OpenLabel.TextSize = 14
OpenLabel.TextWrapped = true

Click.Name = "Click"
Click.Parent = OpenFrame
Click.BackgroundColor3 = Color3.new(0.901961, 0.494118, 0.133333)
Click.BackgroundTransparency = 1
Click.BorderSizePixel = 0
Click.Position = UDim2.new(0.128758922, 0, 0.360485554, 0)
Click.Size = UDim2.new(0, 74, 0, 50)
Click.ZIndex = 0
Click.Image = "rbxassetid://1285673399"
Click.ImageColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
Click.ScaleType = Enum.ScaleType.Slice
Click.SliceCenter = Rect.new(8, 8, 247, 247)

MainFrame.Name = "MainFrame "
MainFrame.Parent = FleeTheFacilityGUI
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.Position = UDim2.new(0.416, 0, 1, 0)
MainFrame.Size = UDim2.new(0, 253, 0, 231)
MainFrame.Image = "rbxassetid://2260429633"
MainFrame.ImageColor3 = Color3.new(0.101961, 0.737255, 0.611765)
MainFrame.ScaleType = Enum.ScaleType.Slice
MainFrame.SliceCenter = Rect.new(12, 12, 13, 13)
MainFrame.Active = true
MainFrame.Draggable = true

Label.Name = "Label"
Label.Parent = MainFrame
Label.BackgroundColor3 = Color3.new(0.101961, 0.737255, 0.611765)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(0, 253, 0, 31)
Label.Font = Enum.Font.Cartoon
Label.Text = "Flee The Facility"
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextScaled = true
Label.TextSize = 14
Label.TextWrapped = true

PlayersToggleButton.Name = "PlayersToggleButton"
PlayersToggleButton.Parent = MainFrame
PlayersToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
PlayersToggleButton.BorderSizePixel = 0
PlayersToggleButton.Position = UDim2.new(0, 0, 0.140106991, 0)
PlayersToggleButton.Size = UDim2.new(0, 253, 0, 20)
PlayersToggleButton.Font = Enum.Font.Cartoon
PlayersToggleButton.Text = "Players : OFF"
PlayersToggleButton.TextColor3 = Color3.new(1, 0, 0)
PlayersToggleButton.TextScaled = true
PlayersToggleButton.TextSize = 14
PlayersToggleButton.TextWrapped = true

ComputersToggleButton.Name = "ComputersToggleButton "
ComputersToggleButton.Parent = MainFrame
ComputersToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
ComputersToggleButton.BorderSizePixel = 0
ComputersToggleButton.Position = UDim2.new(0, 0, 0.239983425, 0)
ComputersToggleButton.Size = UDim2.new(0, 253, 0, 20)
ComputersToggleButton.Font = Enum.Font.Cartoon
ComputersToggleButton.Text = "Computers : OFF"
ComputersToggleButton.TextColor3 = Color3.new(1, 0, 0)
ComputersToggleButton.TextScaled = true
ComputersToggleButton.TextSize = 14
ComputersToggleButton.TextWrapped = true

PodsToggleButton.Name = "PodsToggleButton "
PodsToggleButton.Parent = MainFrame
PodsToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
PodsToggleButton.BorderSizePixel = 0
PodsToggleButton.Position = UDim2.new(0, 0, 0.347258002, 0)
PodsToggleButton.Size = UDim2.new(0, 253, 0, 20)
PodsToggleButton.Font = Enum.Font.Cartoon
PodsToggleButton.Text = " Freeze Pods : OFF"
PodsToggleButton.TextColor3 = Color3.new(1, 0, 0)
PodsToggleButton.TextScaled = true
PodsToggleButton.TextSize = 14
PodsToggleButton.TextWrapped = true

ExitDoorsToggleButton.Name = "ExitDoorsToggleButton "
ExitDoorsToggleButton.Parent = MainFrame
ExitDoorsToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
ExitDoorsToggleButton.BorderSizePixel = 0
ExitDoorsToggleButton.Position = UDim2.new(0, 0, 0.454532653, 0)
ExitDoorsToggleButton.Size = UDim2.new(0, 253, 0, 20)
ExitDoorsToggleButton.Font = Enum.Font.Cartoon
ExitDoorsToggleButton.Text = "Exit Doors : OFF"
ExitDoorsToggleButton.TextColor3 = Color3.new(1, 0, 0)
ExitDoorsToggleButton.TextScaled = true
ExitDoorsToggleButton.TextSize = 14
ExitDoorsToggleButton.TextWrapped = true

DoorsToggleButton.Name = "DoorsToggleButton "
DoorsToggleButton.Parent = MainFrame
DoorsToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
DoorsToggleButton.BorderSizePixel = 0
DoorsToggleButton.Position = UDim2.new(0, 0, 0.562179506, 0)
DoorsToggleButton.Size = UDim2.new(0, 253, 0, 20)
DoorsToggleButton.Font = Enum.Font.Cartoon
DoorsToggleButton.Text = " Doors : OFF"
DoorsToggleButton.TextColor3 = Color3.new(1, 0, 0)
DoorsToggleButton.TextScaled = true
DoorsToggleButton.TextSize = 14
DoorsToggleButton.TextWrapped = true

AirVentsToggleButton.Name = "AirVentsToggleButton "
AirVentsToggleButton.Parent = MainFrame
AirVentsToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
AirVentsToggleButton.BorderSizePixel = 0
AirVentsToggleButton.Position = UDim2.new(0, 0, 0.680179238, 0)
AirVentsToggleButton.Size = UDim2.new(0, 253, 0, 20)
AirVentsToggleButton.Font = Enum.Font.Cartoon
AirVentsToggleButton.Text = " Air Vents : OFF"
AirVentsToggleButton.TextColor3 = Color3.new(1, 0, 0)
AirVentsToggleButton.TextScaled = true
AirVentsToggleButton.TextSize = 14
AirVentsToggleButton.TextWrapped = true

ReloadESP.Name = "ReloadESP "
ReloadESP.Parent = MainFrame
ReloadESP.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
ReloadESP.BorderSizePixel = 0
ReloadESP.Position = UDim2.new(0, 0, 0.89453572, 0)
ReloadESP.Size = UDim2.new(0, 253, 0, 20)
ReloadESP.Font = Enum.Font.Cartoon
ReloadESP.Text = "ESP - Click on this on each game"
ReloadESP.TextColor3 = Color3.new(1, 1, 1)
ReloadESP.TextScaled = true
ReloadESP.TextSize = 14
ReloadESP.TextWrapped = true

HackingFailToggle.Name = "HackingFailToggle "
HackingFailToggle.Parent = MainFrame
HackingFailToggle.BackgroundColor3 = Color3.new(0.0862745, 0.627451, 0.521569)
HackingFailToggle.BorderSizePixel = 0
HackingFailToggle.Position = UDim2.new(0, 0, 0.792651713, 0)
HackingFailToggle.Size = UDim2.new(0, 253, 0, 20)
HackingFailToggle.Font = Enum.Font.Cartoon
HackingFailToggle.Text = " Never Fail Hacking : OFF"
HackingFailToggle.TextColor3 = Color3.new(1, 0, 0)
HackingFailToggle.TextScaled = true
HackingFailToggle.TextSize = 14
HackingFailToggle.TextWrapped = true

Running.Name = "Running"
Running.Parent = FleeTheFacilityGUI
Running.BackgroundColor3 = Color3.new(1, 1, 1)
Running.BackgroundTransparency = 1
Running.BorderSizePixel = 0
Running.Position = UDim2.new(-0.120437965, 0, 0.322330087, 0)
Running.Size = UDim2.new(0, 132, 0, 155)
Running.Image = "rbxassetid://2844713159"

Credit.Name = "Credit"
Credit.Parent = FleeTheFacilityGUI
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.304744512, 0, 0.407766998, 0)
Credit.Size = UDim2.new(0, 331, 0, 67)
Credit.ZIndex = 0
Credit.Font = Enum.Font.Cartoon
Credit.Text = "Made By : Pro Hacks"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextScaled = true
Credit.TextSize = 14
Credit.TextTransparency = 1
Credit.TextWrapped = true

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.BorderSizePixel = 0
Close.Size = UDim2.new(0, 25, 0, 32)
Close.Font = Enum.Font.Cartoon
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 0, 0)
Close.TextScaled = true
Close.TextSize = 14
Close.TextWrapped = true
Close.MouseButton1Down:connect(function()
	MainFrame:TweenPosition(UDim2.new(0.416, 0, 2, 0), 'Out', 'Bounce', 3)
	OpenFrame.Visible = true
end)

players = false
computers = false
pods = false
exitdoors = false
doors = false
vents = false

neverfailhack = false

--- DONT TOUCH!!
PlayersToggleButton.MouseButton1Down:connect(function()
if players == false then
players = true
PlayersToggleButton.Text = "Players: ON"
PlayersToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
players = false
PlayersToggleButton.Text = "Players: OFF"
PlayersToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

ComputersToggleButton.MouseButton1Down:connect(function()
if computers == false then
computers = true
ComputersToggleButton.Text = "Computers: ON"
ComputersToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
computers = false
ComputersToggleButton.Text = "Computers: OFF"
ComputersToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

PodsToggleButton.MouseButton1Down:connect(function()
if pods == false then
pods = true
PodsToggleButton.Text = "Freeze Pods: ON"
PodsToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
pods = false
PodsToggleButton.Text = "Freeze Pods: OFF"
PodsToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

ExitDoorsToggleButton.MouseButton1Down:connect(function()
if exitdoors == false then
exitdoors = true
ExitDoorsToggleButton.Text = "Exit Doors: ON"
ExitDoorsToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
exitdoors = false
ExitDoorsToggleButton.Text = "Exit Doors: OFF"
ExitDoorsToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

DoorsToggleButton.MouseButton1Down:connect(function()
if doors == false then
doors = true
DoorsToggleButton.Text = "Doors: ON"
DoorsToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
doors = false
DoorsToggleButton.Text = "Doors: OFF"
DoorsToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

AirVentsToggleButton.MouseButton1Down:connect(function()
if vents == false then
vents = true
AirVentsToggleButton.Text = "Air Vents: ON"
AirVentsToggleButton.TextColor3 = Color3.fromRGB(0,255,0)
else
vents = false
AirVentsToggleButton.Text = "Air Vents: OFF"
AirVentsToggleButton.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

HackingFailToggle.MouseButton1Down:connect(function()
if neverfailhack == false then
neverfailhack = true
HackingFailToggle.Text = "Never fail hacking: ON"
HackingFailToggle.TextColor3 = Color3.fromRGB(0,255,0)
else
neverfailhack = false
HackingFailToggle.Text = "Never fail hacking: OFF"
HackingFailToggle.TextColor3 = Color3.fromRGB(255,0,0) 
end
end)

ReloadESP.MouseButton1Down:connect(function()
game.Lighting.FogEnd = 10000000

if workspace:findFirstChild("ESP") then
workspace.ESP:remove()
end

if workspace:findFirstChild("ESPComputer") then
workspace.ESPComputer:remove()
end

if workspace:findFirstChild("ESPPod") then
workspace.ESPPod:remove()
end

if workspace:findFirstChild("ESPExitDoor") then
workspace.ESPExitDoor:remove()
end

if workspace:findFirstChild("ESPDoors") then
workspace.ESPDoors:remove()
end

if workspace:findFirstChild("ESPVents") then
workspace.ESPVents:remove()
end


function GetSizeOfObject(Obj)
if Obj:IsA("BasePart") then
return Obj.Size
elseif Obj:IsA("Model") then
return Obj:GetExtentsSize()
end
end

local ESP = Instance.new("Folder",workspace)
ESP.Name = "ESP"



function CreateESPPart(BodyPart,r,g,b)
local ESPPartparent = BodyPart
local Box = Instance.new("BoxHandleAdornment")
Box.Size = GetSizeOfObject(ESPPartparent) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = ESPPartparent
Box.Color3 = Color3.fromRGB(r,g,b)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.4
Box.Parent = ESP
if BodyPart.Parent.Name == game.Players.LocalPlayer.Name then
Box:remove()
spawn (function()
while true do
wait(0.1)
if BodyPart ~= nil then
Box:remove()
end
end
end)
end
end


local player = game.Players:GetChildren()
for i =1, #player do
local bodyparts = player[i].Character:GetChildren()
for i =1, #bodyparts do
if bodyparts[i].ClassName == "Part" then
if bodyparts[i].Parent:findFirstChild("BeastPowers") then
CreateESPPart(bodyparts[i],255,0,0)
else
CreateESPPart(bodyparts[i],170,170,255)
end
end
end
end


local ESPPC = Instance.new("Folder",workspace)
ESPPC.Name = "ESPComputer"

local ESPPod = Instance.new("Folder",workspace)
ESPPod.Name = "ESPPod"

local ESPExitDoor = Instance.new("Folder",workspace)
ESPExitDoor.Name = "ESPExitDoor"

local ESPDoors = Instance.new("Folder",workspace)
ESPDoors.Name = "ESPDoors"

local ESPVents = Instance.new("Folder",workspace)
ESPVents.Name = "ESPVents"


local map = workspace:findFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
local children = map:GetChildren()
for i =1, #children do
if children[i].Name == "ComputerTable" then 
local Box = Instance.new("BoxHandleAdornment")
Box.Size = GetSizeOfObject(children[i].Screen) + Vector3.new(-0.5, -0.5, -0.5)
Box.Name = "ESPPart"
Box.Adornee = children[i].Screen
spawn (function()
while true do
wait(0.1)
Box.Color3 = children[i].Screen.Color
end
end)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.4
Box.Parent = ESPPC
end
if children[i].Name == "FreezePod" then 
local Box = Instance.new("BoxHandleAdornment")
Box.Size = GetSizeOfObject(children[i].BasePart) + Vector3.new(0.1, 5, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].BasePart
Box.Color3 = Color3.fromRGB(0,0,255)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPPod
end
if children[i].Name == "ExitDoor" then 
local Box = Instance.new("BoxHandleAdornment")
Box.Size = GetSizeOfObject(children[i].ExitDoorTrigger) + Vector3.new(-1, 5, -1)
Box.Name = "ESPPart"
Box.Adornee = children[i].ExitDoorTrigger
Box.Color3 = Color3.fromRGB(255,255,0)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPExitDoor
end
if children[i].Name == "SingleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].Door:findFirstChild("DoorBoard") then
Box.Size = GetSizeOfObject(children[i].Door.DoorBoard) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].Door.DoorBoard
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end
if children[i].Name == "DoubleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].DoorL:findFirstChild("DoorBoard") then
Box.Size = GetSizeOfObject(children[i].DoorL.DoorBoard) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].DoorL.DoorBoard
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end
if children[i].Name == "DoubleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].DoorR:findFirstChild("DoorBoard") then
Box.Size = GetSizeOfObject(children[i].DoorR.DoorBoard) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].DoorR.DoorBoard
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end
if children[i].Name == "SingleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].Door:findFirstChild("DoorBoard") == false then
Box.Size = GetSizeOfObject(children[i].Door.Part) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].Door.Part
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end
if children[i].Name == "DoubleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].DoorR:findFirstChild("DoorBoard") == false then
Box.Size = GetSizeOfObject(children[i].DoorL.Part) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].DoorL.Part
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end
if children[i].Name == "DoubleDoor" then 
local Box = Instance.new("BoxHandleAdornment")
if children[i].DoorR:findFirstChild("DoorBoard") == false then
Box.Size = GetSizeOfObject(children[i].DoorR.Part) + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = children[i].DoorR.Part
Box.Color3 = Color3.fromRGB(204,142,105)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPDoors
end
end

if children[i].Name == "AirVent" then 
local Box = Instance.new("BoxHandleAdornment")
Box.Size = GetSizeOfObject(children[i].Part) + Vector3.new(4, 0.1, 4)
Box.Name = "ESPPart"
Box.Adornee = children[i].Part
Box.Color3 = Color3.fromRGB(100,100,100)
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = ESPVents
end
end

if players == false then
workspace.ESP:remove()
end

if computers == false then
workspace.ESPComputer:remove()
end

if pods == false then
workspace.ESPPod:remove()
end

if exitdoors == false then
workspace.ESPExitDoor:remove()
end

if doors == false then
workspace.ESPDoors:remove()
end

if vents == false then
workspace.ESPVents:remove()
end
end)

spawn (function()
while true do
wait()
if neverfailhack == true then
game.ReplicatedStorage.RemoteEvent:FireServer("SetPlayerMinigameResult",true)
end
end
end)