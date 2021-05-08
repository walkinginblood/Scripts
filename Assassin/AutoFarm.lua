print("made by megumu")
local load
local timer = 200
repeat wait() until pcall(function() return game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Lobby.ObbyEnd,game.Players.LocalPlayer.PlayerGui.ScreenGui.UI.Shop.TopBar.UtilBar.Tokens.TextLabel end)
print("loaded")
local player = game.Players.LocalPlayer
local old = player.PlayerGui.ScreenGui.UI.Shop.TopBar.UtilBar.Tokens.TextLabel.Text
repeat
	pcall(function()
		workspace.Lobby.ObbyEnd.CFrame = player.Character.HumanoidRootPart.CFrame
	end)
	wait()
until old ~= player.PlayerGui.ScreenGui.UI.Shop.TopBar.UtilBar.Tokens.TextLabel.Text or not workspace.Lobby:FindFirstChild("ObbyEnd") or timer <= 0
while wait(1) do
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end