-- Variable
local player = game.Players.LocalPlayer
local company

-- Get Company
for i,v in pairs(workspace.CompaniesFolder:GetChildren()) do
    if v.Owner.Value == player then
        company = v
    end
end

-- Get to work
while true do
    local shit = company.CompanyModel.Floors:GetDescendants()
    for i = 1, #shit do local v = shit[i]
        if v.Name == "PlacedIndex" and v.Parent:FindFirstChild("Worker") then
            local stf = v.Parent.Worker
            if stf:FindFirstChild("Tired") and stf.Tired.Value then
                v.Parent.Parent.WorkerController.Remote.WakeUp:FireServer()
                wait(.1)
            end
            if stf:FindFirstChild("CurrentProject") and stf.CurrentProject.Value == "None" then
                game.ReplicatedStorage.Remote.StartWorking:InvokeServer(v.Value, 1)
                wait(.1)
            end
            if stf:FindFirstChild("NextProject") and stf.NextProject.Value == "None" then
                game.ReplicatedStorage.Remote.AssignProject:InvokeServer(v.Value, 1, "WEBSITE")
            end
            if stf:FindFirstChild("Full") then
                v.Parent.Parent.WorkerController.Remote.CollectDesigns:InvokeServer()
                wait(.1)
            end
        end
    end
    wait()
    if not player.DayStarted.Value then
        game.ReplicatedStorage.Remote.StartDay:InvokeServer()
    end
end