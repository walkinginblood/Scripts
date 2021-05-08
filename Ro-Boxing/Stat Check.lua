--Username
Username = "Mango"

--Check
for i, v in ipairs(workspace["Player_Information"]:GetChildren()) do 
	if string.find(v.Name:lower(), Username:lower()) then 
		print("".."\n\nUsername: ".. v.Name .."\nFitness: ".. v.Stats.Fitness.Level.Value .."\nSpeed: ".. v.Stats.Speed.Level.Value .."\nStrength: "..v.Stats.Strength.Level.Value .."\nEndurance: ".. v.Stats.Endurance.Level.Value .."\nAccuracy: ".. v.Stats.Accuracy.Level.Value)
	end
end