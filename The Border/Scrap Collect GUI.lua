if getgenv().scrap == nil then
    --Library
    local library = loadstring(game:HttpGet("https://pastebin.com/raw/eWKgbdix", true))()

    --Main
    local w = library:CreateWindow('The Border')

    --Credit Tab
    local cred = library:CreateWindow('Credits')

    --Credits
    cred:Section('Scripts: Megumu')
    cred:Section('UI Library: wally')

    --Top
    w:Section('Made by Megumu')

    --Toogles
    local t = w:Toggle('Auto Pickup', {flag = "pickup"})
    local t = w:Toggle('Auto Loot', {flag = "loot"})

    --Get Scrap Piles
	print("Executed!")
	getgenv().scrap = {}
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "BinPicker" and v:FindFirstChild("ClickDetector") then 
			table.insert(getgenv().scrap, v.ClickDetector)
		end
    end
    
    --Get All The Shit
    workspace.MoneyBin.ChildAdded:Connect(function(v)
        if w.flags.pickup then
            repeat wait() until v:FindFirstChild("ClickDetector") or w.flags.pickup == false
            click(v.ClickDetector)
        end
    end)

    --Click
    function click(v)
        if fireclickdetector then
            --Synapse X
            fireclickdetector(v)
        elseif click_detector then
            --ProtoSmasher
            click_detector(v, 1)
        else
            --Skid
            game.Players.LocalPlayer:Kick("Get a better exploit")
            wait(0.25)
            repeat until nil
            while true do end
        end
    end

    --Auto
    while wait(1) do
        if w.flags.loot then
            --Collect Scrap
            for i,v in pairs(getgenv().scrap) do
                click(v)
            end
        end
        if w.flags.pickup then
            for i,v in pairs(workspace.MoneyBin:GetChildren()) do
                if v:FindFirstChild("ClickDetector") then
                    click(v.ClickDetector)
                end
            end
        end
    end
else
	print("Already executed!")
end