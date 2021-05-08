_G.Amount = 1500000

--Variable
local RS = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer

--Remote
game.ReplicatedStorage.Events.Character.QuestComplete:FireServer("Lol", 0, _G.Amount)