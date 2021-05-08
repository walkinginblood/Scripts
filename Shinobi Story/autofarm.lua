--Script
if game.PlaceId ~= 3087107127 then 
	game:GetService("TeleportService"):Teleport(3087107127, game.Players.LocalPlayer)
else

	--check for pig
	local function pig()
		for i, child in ipairs(game:GetService("Workspace").npc:GetChildren()) do 
			if string.find(child.Name, "piggy") or child:FindFirstChildOfClass("Humanoid") then 
				game:GetService("TeleportService"):Teleport(3087107127, game.Players.LocalPlayer)
			end
		end
	end

	--TP
	local function Leave()
		for index, descendant in pairs(game:GetService("Workspace"):GetDescendants()) do
			if descendant.Name == "leave" and descendant:FindFirstChildOfClass("TouchTransmitter") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = descendant.CFrame
			end
		end
	end

	pig()
	wait(2)
	Leave()
end