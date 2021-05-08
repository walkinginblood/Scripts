_G.Valis = 25000000000
_G.Crystals = 8000000000

repeat
	game:GetService("ReplicatedStorage").IngameMoney:FireServer(_G.Crystals)
	wait(0.1)
	game:GetService("ReplicatedStorage").Remotes.TradeEvent:FireServer("-".._G.Crystals)
	wait(0.1)
until game.Players.LocalPlayer.CurrencyValues.CrystalValue.Value > _G.Crystals
wait(0.5)
repeat
	game:GetService("ReplicatedStorage").IngameMoney:FireServer(_G.Valis)
	wait(0.1)
until game.Players.LocalPlayer.CurrencyValues.ValiValue.Value > _G.Valis