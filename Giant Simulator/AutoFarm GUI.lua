-- Main
local library = loadstring(game:HttpGetAsync("https://pastebin.com/raw/HYcfs6KC"))()

-- Variable
local player = game.Players.LocalPlayer
local orbFolder

-- Global
_G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.OpenLegendaryCrate, "weapon"

-- Get Orb Folder
for i,v in pairs(workspace.Scene:GetChildren()) do
    if tonumber(v.Name) then
        orbFolder = v
    end
end

-- Require check
if require then
    -- Inventory Modules 
    mainPath = player.PlayerScripts.Aero.Controllers
    weaponController = require(mainPath.WeaponInventoryController)
    skinController = require(mainPath.SkinInventoryController)
    chestController = require(mainPath.ChestInventoryController)

    -- Credits
    pcall(function()
        skinController.NotificationController.ShowPopupAlertMessage(1, "Discord: PXdNwN5", 1)
    end)
    wait(3)
else
    game:Shutdown()
end

-- Main
local w = library:CreateWindow('bonk simulator')
w:Section('Made by Megumu')

-- GUI
w:Toggle('Auto Swing', {flag = "swing"})
w:Toggle('Auto Speed', {flag = "walk"})
w:Toggle('Auto Rebirth', {flag = "rebirth"})
w:Toggle('Collect Orbs', {flag = "heart"})
w:Button('Get Quests', function()
    spawn(function()
        game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.StartQuestRequest:InvokeServer()
    end)
    spawn(function()
        game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.EndQuestRequest:InvokeServer()
    end)
end)
w:Section('Teleports')
w:Toggle('Boss TP', {flag = "boss"})
w:Toggle('Demon King TP', {flag = "demonking"})
w:Button("Platform", function()
    local plat = Instance.new("Part", workspace)
    plat.Size = Vector3.new(math.huge, 1, math.huge)
    plat.Anchored = true
    plat.CFrame = CFrame.new(math.random(1, 9999), math.random(2000, 9999), math.random(1, 9999))
    wait()
    pcall(function()
        player.Character.HumanoidRootPart.CFrame = plat.CFrame + Vector3.new(0, 100, 0)
    end)
end)
w:Button('Golden Egg', function()
    pcall(function()
        workspace.Egg.CFrame = player.Character.HumanoidRootPart.CFrame
    end)
end)
w:Section('Auto Sell')
w:Toggle('Weapons',{flag = "sellwep"})
w:Toggle('Skins',{flag = "sellskin"})
w:Toggle('Common Crates',{flag = "crate"})
w:Section('Auto Upgrade')
w:Toggle('Weapons',{flag="upgradewep"})
w:Toggle('Skins',{flag="upgradeskin"})
w:Section('Quick Buy')
w:Dropdown("Chest", {
    location = _G;
    flag = "memes";
    list = {
        "Legendary Weapon";
        "Legendary Skin";
        "Epic Weapon";
        "Epic Skin";
        "Rare Weapon";
        "Rare Skin";
        "Common Weapon";
        "Common Skin";
    }
}, function(new)
    if new == "Legendary Weapon" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.OpenLegendaryCrate, "weapon"
    elseif new == "Legendary Skin" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.OpenLegendaryCrate, "skin"
    elseif new == "Epic Weapon" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t3_wpn_crate"
    elseif new == "Epic Skin" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t3_skin_crate"
    elseif new == "Rare Weapon" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t2_wpn_crate"
    elseif new == "Rare Skin" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t2_skin_crate"
    elseif new == "Common Weapon" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t1_wpn_crate"
    elseif new == "Common Skin" then
        _G.path, _G.argument = game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.BuyCrate, "t1_skin_crate"
    end
end)
w:Button("Purchase", function()
    _G.path:InvokeServer(_G.argument)
    if _G.argument ~= "weapon" and _G.argument ~= "skin" then
        game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.OpenCrate:InvokeServer(_G.argument)
    end
end)

-- Orb Loop
spawn(function()
    while true do
        if w.flags.heart then
            local th = orbFolder:GetChildren()
            for i = 1, #th do local k = th[i]
                local mesh = k:FindFirstChildOfClass("MeshPart")
                if mesh and w.flags.heart then
                    repeat
                        pcall(function()
                            player.Character.HumanoidRootPart.CFrame = k.CFrame+Vector3.new(0,math.random(1,10)/10,0)
                        end)
                        wait()
                    until not k:FindFirstChildOfClass("MeshPart") or not w.flags.heart
                    wait(.3)
                end
            end
        end
        wait(.25)
    end
end)

-- Swing
spawn(function()
    while true do
        if w.flags.swing then
            game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
            wait()
            game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
        end
        wait(.1)
    end
end)

-- nil Check
if getnilinstances then
    -- Swing Animation - Grabber
    local function animGrab()
        local stff = getnilinstances()
        local anim = {}
        for i = 1, #stff do local v = stff[i]
            if v.Name == "DUAL_SLASH_1" and v:IsA("Animation") then
                anim[1] = v:Clone()
            end
            if v.Name == "DUAL_SLASH_2" and v:IsA("Animation") then
                anim[2] = v:Clone()
            end
        end
        return anim
    end

    -- Swing Animation - Check
    function animCheck(eg)
        for i,v in pairs(eg) do
            if string.find(v.Name:lower(), "slash") then
                return false
            end
        end
        return true
    end

    -- Swing Animation - Loop
    spawn(function()
        local anim = animGrab()
        while true do
            if w.flags.swing then
                for i = 1, 2 do
                    if anim ~= nil and #anim == 2 and player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid:LoadAnimation(anim[i]):Play()
                        local stopped = false
                        repeat
                            wait()
                            if pcall(function() return player.Character.Humanoid end) then
                                stopped = animCheck(player.Character.Humanoid:GetPlayingAnimationTracks())
                            end
                        until stopped
                    else
                        anim = animGrab()
                    end
                end
            end
            wait(.1)
        end
    end)
end

-- Walk
spawn(function()
    while true do
        if w.flags.walk then
            local old = player.Character.HumanoidRootPart.CFrame
            repeat
                pcall(function()
                    if not w.flags.boss then
                        player.Character.HumanoidRootPart.CFrame = old
                    end
                    player.Character.Humanoid:MoveTo(Vector3.new())
                end)
                wait()
            until not w.flags.walk
        end
        wait(.25)
    end
end)

-- Boss
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if w.flags.boss and workspace.NPC.Boss:FindFirstChild("Borock") then
            pcall(function()
                player.Character.Humanoid:ChangeState(11)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.NPC.Boss.Borock.HumanoidRootPart.Position)
            end)
        end
        if w.flags.demonking and workspace.NPC:FindFirstChild("DemonKing") then
            pcall(function()
                player.Character.Humanoid:ChangeState(11)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.NPC.DemonKing.DemonKing.HumanoidRootPart.Position)
            end)
        end
    end)
end)

-- Require Check
if require then
    -- Sell
    spawn(function()
        while true do
            if w.flags.sellwep then
                for i,v in pairs(weaponController.InventoryData) do
                    if weaponController.EquippedWeapon == tostring(i) or weaponController.Offhand_EquippedWpn == tostring(i) then
                    else
                        game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.SellWeapon:InvokeServer(tostring(i))
                    end
                end
                wait(.1)
            end
            if w.flags.sellskin then
                for i,v in pairs(skinController.InventoryData) do
                    if skinController.EquippedSkin == tostring(i) then
                    else
                        game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.SellSkin:InvokeServer(tostring(i))
                    end
                end
                wait(.1)
            end
            if w.flags.crate then
                if pcall(function() return chestController.InventoryData.t1_skin_crate.amount.Text end) and tonumber(chestController.InventoryData.t1_skin_crate.amount.Text) > 0 then
                    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.SellAllCratesRequest:InvokeServer("t1_skin_crate")
                end
                if pcall(function() return chestController.InventoryData.t1_wpn_crate.amount.Text end) and tonumber(chestController.InventoryData.t1_wpn_crate.amount.Text) > 0 then
                    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.SellAllCratesRequest:InvokeServer("t1_wpn_crate")
                end
            end
            wait(.1)
        end
    end)

    -- Upgrade
    spawn(function()
        while true do
            if w.flags.upgradeskin then
                pcall(function()
                    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.UpgradeSkin:InvokeServer(skinController.EquippedSkin)
                    wait(.15)
                end)
            end
            if w.flags.upgradewep then
                pcall(function()
                    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.UpgradeWeapon:InvokeServer(weaponController.EquippedWeapon)
                end)
                pcall(function()
                    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.UpgradeWeapon:InvokeServer(weaponController.Offhand_EquippedWpn)
                end)
                wait(.15)
            end
            wait()
        end
    end)
end

-- Rebirth
spawn(function()
	while true do
        if w.flags.rebirth and player.leaderstats:GetChildren()[1].Value >= 100 then
            spawn(function()
			    game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.RebirthRequest:InvokeServer()
            end)
		end
		wait(0.25)
	end
end)