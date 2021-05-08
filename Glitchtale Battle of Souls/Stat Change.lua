--Variables
local player = game.Players.LocalPlayer
local target = game.Players[_G.username]

--Message
function message(text, color)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[SCRIPT]: "..text..""; Color = color; Font = Enum.Font.SourceSans; FontSize = Enum.FontSize.Size42})
end

--Startup
message("Made by Megumu#8008 <3", Color3.new(1, 0.7, 0.8))

--Stuff
pcall(function()
	local descendants = player.Backpack:FindFirstChildOfClass("Folder"):GetDescendants()

	for index, descendant in pairs(descendants) do
		if descendant:IsA("RemoteEvent") then
			descendant:FireServer(game.ReplicatedStorage.DataFolder[target.UserId].Data[_G.stat])
			descendant:FireServer(Vector3.new(), game.ReplicatedStorage.DataFolder[target.UserId].Data[_G.stat])
		end
	end
end)