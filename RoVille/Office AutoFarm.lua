-- Variable
local player = game.Players.LocalPlayer
local jobStation

-- Get Station
for i,v in pairs(workspace.OfficeArea:GetChildren()) do
    if v.Name == "Model" and player:DistanceFromCharacter(v.Model.Part.Position) < 4 then
        jobStation = v
    end
end
if typeof(jobStation) ~= "Instance" then
    return
end

-- Get Answer
local function eq()
    local shit = workspace:GetChildren()
    for i = 1, #shit do local v = shit[i]
        local gui = v:FindFirstChildOfClass("SurfaceGui")
        if v:IsA("Model") and gui and gui:FindFirstChild("Equasion") and gui.Adornee == jobStation.Model.Part then
            return tostring(loadstring("return "..gui.Equasion.Text)())
        end
    end
end

-- Click
local correct=1
while true do
    local answer = eq()
    for i,v in pairs(jobStation.Model.Ans:GetChildren()) do
        if (correct<=4 and v.S.A.Text==answer) or (correct==5 and v.S.A.Text~=answer) then
            fireclickdetector(v.ClickDetector, 1)
			for i=1,5 do
            	v.S.A.Changed:wait()
			end
            wait(1.2)
            if correct==5 then
                correct=1
            else
                correct=correct+1
            end
        end
    end
    wait(.25)
end