--Variable
local player = game.Players.LocalPlayer

--GET EM
while wait(2) do
	for i,v in pairs(game.Players:GetPlayers()) do
		if player.Team ~= v.Team and v.Character and v.Character:FindFirstChild("Head") then
			v.Character.Head.Size = Vector3.new(4, 2, 2)
		end
	end
end