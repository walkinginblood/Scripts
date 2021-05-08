while wait(1) do 
	require(game.ReplicatedStorage:WaitForChild("Framework")).Network:Invoke("Bank/Deposit", 1)
end