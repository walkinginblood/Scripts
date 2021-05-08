-- Variable
local player = game.Players.LocalPlayer
local job

-- Get Desk
for i,v in pairs(workspace.BankerJob:GetChildren()) do
    if v:IsA("Model") and player:DistanceFromCharacter(v.Amm.Position) < 6 then
        job = v
    end
end

-- Get Customers
while wait() do
    for i,v in pairs(job.Customers:GetChildren()) do
        if pcall(function() return v.ChoiceShow.TextLabel.Text end) then
            local choice = v.ChoiceShow
            local amount = string.split(choice.TextLabel.Text, "$")[2]
            local mm = tick()
            repeat
                pcall(function()
                    fireclickdetector(job.Nums[amount].ClickDetector, 1)
                end)
                wait(.25)
            until job.Amm.SurfaceGui.TextLabel.Text == "$"..amount or tick() - mm > 2
            if string.find(choice.TextLabel.Text:lower(), "deposit") then
                fireclickdetector(job.Choices.Deposit.CD, 1)
            else
                fireclickdetector(job.Choices.Withdraw.CD, 1)
            end
            wait(.7)
        end
    end
end