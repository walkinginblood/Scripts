local special = {
	Tanzanite = "DEATH";
	Spinel = "EMBODIMENT OF CANCER";
	Lapis = "PROTECC"
}
warn("---=== NEW ===---")
for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= game.Players.LocalPlayer then
		print("Name: "..v.Name)
		if special[v.Gem.Value] then
			print("GEM: "..special[v.GemName.Value])
		else
			print("Gem: "..v.GemName.Value)
		end
		warn("---===---")
	end
end