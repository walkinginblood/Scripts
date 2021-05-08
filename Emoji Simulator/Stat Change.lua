_G.Settings = {
	Amount = 20000000; --Amount
	Type = "Coins"; --Gems | Coins
}

game.ReplicatedStorage.Remotes.QuestEnded:FireServer("CoinsV", 0, tostring(_G.Settings["Type"].."V"), _G.Settings["Amount"], "Made by Megumu")