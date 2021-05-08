--[[
    Made by Megumu/Mommy Mango
    <3
]]

_G.Enabled = true; --Toggle On/Off
_G.Settings = { --Settings
	AutoSaber = true; --Automatically upgrade sabers
    AutoDNA = true; --Automatically upgrade DNA
    AutoClass = true; --Automatically upgrade class
	AutoSell = { --Automatically Sell
		Enabled = true; --Toggle On/Off
		Fill = true; --Only sell when you're at max capacity
	};
};

--Script
pcall(function()
	if _G.Executed ~= true then

		--Variable
		_G.Executed = true
		local RS = game.ReplicatedStorage
		local events = RS.Events
		local player = game.Players.LocalPlayer

		--Credits
		loadstring(game:HttpGet("https://pastebin.com/raw/vJg6Sa8w", true))()

        --TP
        if _G.Settings["AutoSell"]["Enabled"] then
		    player.Character.HumanoidRootPart.CFrame = workspace.Locations.Sell.CFrame
        end

		--AutoStuff
		spawn(function()
			while wait(1) do
				if _G.Enabled then
					--AutoSaber
					if _G.Settings["AutoSaber"] then
						for i,v in pairs(RS.ShopItems.Swords:GetChildren()) do
							if not v:FindFirstChild("ID") then
								events.BuyItem:FireServer(v)
							end
						end
                    end
                    wait(0.5)
					--AutoDNA
					if _G.Settings["AutoDNA"] then
						for i,v in pairs(RS.ShopItems.Backpacks:GetChildren()) do
							if not v:FindFirstChild("ID") then
								events.BuyItem:FireServer(v)
							end
						end
                    end
                    wait(0.5)
                    --AutoClass
                    if _G.Settings["AutoClass"] then
                        for i,v in pairs(RS.ShopItems.Classes:GetChildren()) do
                            if not v:FindFirstChild("ID") then
                                events.BuyItem:FireServer(v)
                            end
                        end
                    end
                    wait(0.5)
				end
			end
		end)

		--Loop
		while true do
			if _G.Enabled then
				--Equip
				if not player.Character:FindFirstChildOfClass("Tool") then 
					player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
					repeat wait() until player.Character:FindFirstChildOfClass("Tool")
				end
				--AutoFarm
				RS.Events.Clicked:FireServer()
				wait(player.Character:FindFirstChildOfClass("Tool").SwingDelay.Value)
				--AutoSell
                if _G.Settings["AutoSell"]["Enabled"] then
                    if _G.Settings["AutoSell"]["Fill"] and player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Gui") and player.PlayerGui.Gui:FindFirstChild("Home") and player.PlayerGui.Gui.Home:FindFirstChild("Sand") and player.PlayerGui.Gui.Home.Sand:FindFirstChild("Amount") then 
                        if string.split(player.PlayerGui.Gui.Home.Sand.Amount.Text, " / ")[1] == string.split(player.PlayerGui.Gui.Home.Sand.Amount.Text, " / ")[2] then
                            if player:DistanceFromCharacter(workspace.Locations.Sell.Position) > 20 then
                                player.Character.HumanoidRootPart.CFrame = workspace.Locations.Sell.CFrame
                            end
                            events.Sell:FireServer()
                        end
                    else
                        if player:DistanceFromCharacter(workspace.Locations.Sell.Position) > 20 then
                            player.Character.HumanoidRootPart.CFrame = workspace.Locations.Sell.CFrame
                        end
                        events.Sell:FireServer()
                    end
				end
			end
			wait()
		end
	end
end)