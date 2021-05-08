local username = "derieri"

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	if string.find(v.Name:lower(), username) then
		local data = v.Data
		warn("stats")
		print(data.Strength.Value)
		print(data.Health.Value)
		print(data.Magic.Value)
		warn("magic")
		print(data.Magic1.Value)
		print(data.Magic2.Value)
	end
end