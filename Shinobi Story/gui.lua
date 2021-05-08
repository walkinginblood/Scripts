--Variable
local player = game:GetService("Players").LocalPlayer

--Function
function missionRem(text)
  player.Character:FindFirstChild("combat"):FindFirstChild("update"):FireServer("minigame", text)
  wait()
  player.Character:FindFirstChild("combat"):FindFirstChild("update"):FireServer("minigame", "complete")
  wait()
end

local mt = getrawmetatable(game)
setreadonly(mt, false) 

local old = mt.__namecall

mt.__namecall = function(self, ...)
    local arguments = {...}
    local method = table.remove(arguments)
    local a = table.remove(arguments)
    local b = table.remove(arguments)

    if method == "FireServer" and tostring(self) == "update" and string.find(tostring(a), "exploit") then
        return nil
    end
    return old(self, ...)
end

local library = loadstring(game:HttpGet("https://pastebin.com/raw/7Z6TzFnv", true))()

local credits = library:CreateWindow({text = "Credits"})
local train = library:CreateWindow({text = "Training"})
local exam = library:CreateWindow({text = "Exams"})
local mission = library:CreateWindow({text = "Mission"})

credits:AddLabel("Credits\nInori: Dragging\nwally: UI\nMegumu: Scripts")

train:AddButton("Accuracy", function()
  missionRem("aiming")
end)

train:AddButton("Guard", function()
  missionRem("blocking")
end)

train:AddButton("Endurance", function()
  missionRem("endurance")
end)

train:AddButton("Waterwalk", function()
  missionRem("waterwalk") 
end)

train:AddButton("Climbing", function()
  missionRem("treeclimb")
end)

train:AddButton("Tree Jumping", function()
  missionRem("treejump")
end)

train:AddButton("Shadowclone", function()
  missionRem("shadowclone")
end)

train:AddButton("Cleanup", function()
  missionRem("cleanup")
end)

exam:AddButton("Jounin", function()
  missionRem("jounin")
end)

exam:AddButton("Gennin", function()
  missionRem("gennin")
end)

exam:AddButton("Forest", function()
  missionRem("forest")
end)

exam:AddButton("Chunin", function()
  missionRem("chunin")
end)

exam:AddButton("Chunin Paper", function()
  missionRem("chuninpaper")
end)

mission:AddButton("Mission", function()
  game:GetService("ReplicatedStorage").effect:FireServer("originfinish")
end)