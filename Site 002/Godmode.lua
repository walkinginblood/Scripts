local player = game.Players.LocalPlayer
while wait() do 
	if player.Character then 
		if player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("Tag") then 
			player.Character.Head.Tag:Destroy()
		end
		if player.Character:FindFirstChild("HasCrossedLine") then 
			player.Character.HasCrossedLine:Destroy()
		end
		if player.Character:FindFirstChild("HasPulledGun") then 
			player.Character.HasPulledGun:Destroy()
		end
		if player.Character:FindFirstChild("HasEnteredRestrictedArea") then 
			player.Character.HasEnteredRestrictedArea:Destroy()
		end
	end
end